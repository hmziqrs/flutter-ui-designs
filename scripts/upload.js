import admin from 'firebase-admin';

const app = admin.initializeApp({
  credential: admin.credential.cert(JSON.parse(process.env.account)),
  storageBucket: 'flutter-ui-challenges-hgl.appspot.com',
  databaseURL: 'https://flutter-ui-challenges-hgl.firebaseio.com',
});

const platforms = {
  apk: {
    path: 'build/app/outputs/apk/release/app-release.apk',
    name: 'app-release.apk',
  },
  linux: {
    path: 'build/linux/linux-release.zip',
    name: 'linux-release.zip',
  },
  mac: {
    path: 'build/macOS/Build/Products/Release/mac-release.zip',
    name: 'mac-release.zip',
  },
  windows: {
    path: 'build\\windows\\x64\\Release\\windows-release.zip',
    name: 'window-release.zip',
  },
};

async function main() {
  try {
    console.log('Automated process started');

    const platform = process.argv[2];

    if (!platforms[platform]) {
      throw Error('Undefined platform');
    }

    const { path, name } = platforms[platform];
    const storage = admin.storage().bucket();

    await storage.upload(path);

    const file = storage.file(name);
    const [url] = await file.getSignedUrl({
      action: 'read',
      expires: '01-01-2021',
    });

    await admin
      .database()
      .ref(`urls/${platform}`)
      .set(url);

    console.log('Automated process completed');
  } catch (e) {
    console.log('Automated process failed');

    console.error(e);
  }
}

main();
