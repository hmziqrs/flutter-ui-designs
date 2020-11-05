import 'dart:isolate';

const String scope = 'ScreenWidget';

const Map strings = {
  '$scope/smTitle': "Settings",
  //
  '$scope/smSelectLanguage': "Select Language",
  '$scope/smEnglish': "english",
  '$scope/smChinese': "chinese",
  '$scope/smArabic': "arabic",
  '$scope/smSystemDefault': "system default",

  //
  '$scope/smSelectTheme': "Select Theme",
  '$scope/smSytemTheme': "Sytem Theme",
  '$scope/smLightTheme': "Light Theme",
  '$scope/smDarkTheme': "Dark Theme",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
