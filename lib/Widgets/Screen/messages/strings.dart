import 'dart:isolate';

const String scope = 'ScreenWidget';

const Map strings = {
  '$scope/smTitle': "Settings",
  '$scope/smSelectLanguage': "Select Language",
  '$scope/smEnglish': "english",
  '$scope/smChinese': "chinese",
  '$scope/smArabic': "arabic",
  '$scope/smSystemDefault': "system default",
  '$scope/error': "Error",
  '$scope/cantPerform': "Platfrom cannot perform the action",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
