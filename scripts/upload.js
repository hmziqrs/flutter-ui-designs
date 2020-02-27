import admin from 'firebase-admin';

const platforms = {
  apk: {
    path: 'build/app/outputs/apk/release/app-release.apk',
    name: 'app-release.apk',
  },
  linux: {
    path: 'build/linux/linux-release.zip',
    name: 'linux-release.zip',
  },
  macos: {
    path: 'build/macos/Build/Products/Release/macos-release.zip',
    name: 'macos-release.zip',
  },
  windows: {
    path: 'build\\windows\\x64\\Release\\windows-release.zip',
    name: 'windows-release.zip',
  },
};

async function main() {
  const platform = process.argv[2];

  admin.initializeApp({
    credential: admin.credential.cert(
      JSON.parse(process.env.ACCOUNT || process.argv[3])
    ),
    storageBucket: 'flutter-ui-challenges-hgl.appspot.com',
    databaseURL: 'https://flutter-ui-challenges-hgl.firebaseio.com',
  });
  try {
    console.log(`Automated process started | ${platform}`);

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

    console.log(`Automated process completed | ${platform}`);
  } catch (e) {
    console.log(`Automated process failed | ${platform}`);
    console.error(e);
  }
  process.exit(0);
}

main();
