import 'dart:io';
import 'dart:convert';

Future<void> copyFile(String source, String destination) async {
  try {
    final sourceFile = File(source);
    final destinationFile = File(destination);

    if (await destinationFile.exists()) {
      print('Overwriting existing file: $destination');
      await destinationFile.delete();
    }

    await sourceFile.copy(destination);
    print('Successfully copied: $destination');
  } catch (e) {
    throw 'Failed to copy $source to $destination: $e';
  }
}

Future<void> main() async {
  try {
    // Check if .keys-n-stuff directory exists
    final keysDir = Directory('.keys-n-stuff');

    // Read the keys-n-stuff.json file
    final configFile = File('.keys-n-stuff.json');
    if (!await configFile.exists()) {
      throw 'Configuration file not found';
    }

    final config = jsonDecode(await configFile.readAsString());
    final String projectDir = config['dir'];
    final String projectType = config['type'];
    final String repo = config['repo'];
    final source = ".keys-n-stuff/$projectDir";

    print('Project directory: $projectDir');
    print('Project type: $projectType');
    print('Repository: $repo');

    if (await keysDir.exists()) {
      print('Repository already exists, pulling latest changes...');
      final pullResult =
          await Process.run('git', ['pull'], workingDirectory: '.keys-n-stuff');

      if (pullResult.exitCode != 0) {
        throw 'Failed to pull repository: ${pullResult.stderr}';
      }
      print('Successfully pulled latest changes');
    } else {
      print('Cloning repository...');
      final cloneResult =
          await Process.run('git', ['clone', repo, '.keys-n-stuff']);

      if (cloneResult.exitCode != 0) {
        throw 'Failed to clone repository: ${cloneResult.stderr}';
      }
      print('Successfully cloned repository');
    }

    if (projectType == 'flutter') {
      // Create necessary directories
      await Directory('android/app').create(recursive: true);
      await Directory('ios/Runner').create(recursive: true);
      await Directory('macos/Runner').create(recursive: true);

      // Copy Firebase config files
      // Android
      await copyFile(
          '$source/google-services.json', 'android/app/google-services.json');

      // iOS
      await copyFile('$source/GoogleService-Info.plist',
          'ios/Runner/GoogleService-Info.plist');

      // macOS
      await copyFile('$source/GoogleService-Info.plist',
          'macos/Runner/GoogleService-Info.plist');

      // Copy keystore properties file to android root
      await copyFile('$source/prod.properties', 'android/prod.properties');

      // Copy keystore file to android/app
      final prodKeystoreFile = File('$source/prod.jks');
      if (await prodKeystoreFile.exists()) {
        await copyFile('$source/prod.jks', 'android/app/prod.jks');
      }

      // Copy keystore file to android/app
      final testKeystoreFile = File('$source/test.jks');
      if (await testKeystoreFile.exists()) {
        await copyFile('$source/prod.jks', 'android/app/test.jks');
      }

      final serviceAccountFile = File('$source/service-account.json');
      if (await serviceAccountFile.exists()) {
        await copyFile('$source/service-account.json', 'service-account.json');
      }

      print(
          'Successfully copied all configuration files to their respective directories');
    } else {
      throw 'Unsupported project type: $projectType';
    }

    print('Setup completed successfully');
  } catch (e) {
    print('Error: $e');
    exit(1);
  }
}
