import 'dart:isolate';

const String scope = 'HomeScreen';

const Map strings = {
  '$scope/title': 'Welcome',
  '$scope/desc':
      "Explore UI designs powered by the Flutter framework, designed by creative designers.",
  '$scope/uiList': 'Explore UIs',
  '$scope/about': 'About App',
  '$scope/aboutDeveloper': 'About Developer',
  '$scope/download': 'Download',
  '$scope/settings': "Settings",
  '$scope/modalWebTitle': "Warning",
  '$scope/modalWebDesc':
      "Flutter does not have good support for web out of box. That's why you will face bugs and lag. There is nothing wrong with my implementaion becuase every things works well on native apps.\n\nSo for hassle free smooth experience I recommend you to download native app",
  '$scope/modalWebButton1': "Download",
  '$scope/modalWebButton2': "Continue",
  '$scope/modalDesktopTitle': "Alert",
  '$scope/modalDesktopDesc':
      "In some screens 'BackButton' isn't avaible becuase it made UI hideous. So as an alternative I implemented keyboard shortcut to navigate back.\n\nMacOS: Option + Backspace\nLinux: Alt + Backspace\nWindows: Ctrl + Backspace",
  '$scope/modalDesktopButton': "Continue",
  '$scope/version': "VERSION",
  '$scope/settingsModalTitle': "Select Language",
  '$scope/settingsModalEnglish': "english",
  '$scope/settingsModalChinese': "chinese",
  '$scope/settingsModalArabic': "arabic",
  '$scope/settingsModalSystemDefault': "system default",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
