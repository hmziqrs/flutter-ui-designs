typedef YamlFunction = String Function(String);
YamlFunction tempYaml = (String version) => '''
name: flutter_icons
description: Customizable Icons for Flutter，you can use with over 3K+ icons in your flutter project
version: 1.1.0
author: flutter-studio<2534290808@qq.com>
homepage: https://github.com/flutter-studio/flutter-icons.git
environment:
  sdk: ">=2.0.0-dev.68.0 <3.0.0"
dependencies:
  flutter:
    sdk: flutter
dev_dependencies:
  flutter_test:
    sdk: flutter
flutter:
  fonts:
''';
const String allFonts = '''
      - family: Ionicons
        fonts:
          - asset: fonts/Ionicons.ttf
      - family: AntDesign
        fonts:
          - asset: fonts/AntDesign.ttf
      - family: FontAwesome
        fonts:
          - asset: fonts/FontAwesome.ttf
      - family: MaterialIcons
        fonts:
          - asset: fonts/MaterialIcons.ttf
      - family: Entypo
        fonts:
          - asset: fonts/Entypo.ttf
      - family: EvilIcons
        fonts:
          - asset: fonts/EvilIcons.ttf
      - family: Feather
        fonts:
          - asset: fonts/Feather.ttf
      - family: Foundation
        fonts:
          - asset: fonts/Foundation.ttf
      - family: MaterialCommunityIcons
        fonts:
          - asset: fonts/MaterialCommunityIcons.ttf
      - family: Octicons
        fonts:
          - asset: fonts/Octicons.ttf
      - family: SimpleLineIcons
        fonts:
          - asset: fonts/SimpleLineIcons.ttf
      - family: Zocial
        fonts:
          - asset: fonts/Zocial.ttf
      - family: FontAwesome5
        fonts:
          - asset: fonts/FontAwesome5_Regular.ttf
      - family: FontAwesome5_Brands
        fonts:
          - asset: fonts/FontAwesome5_Brands.ttf
      - family: FontAwesome5_Solid
        fonts:
          - asset: fonts/FontAwesome5_Solid.ttf
      - family: WeatherIcons
        fonts:
          - asset: fonts/weathericons.ttf
''';

Map<String, String> fontsMap = {
  "ant": '''
      - family: AntDesign
        fonts:
          - asset: fonts/AntDesign.ttf
''',
  "ion": """
      - family: Ionicons
        fonts:
          - asset: fonts/Ionicons.ttf
""",
  "faw": '''
      - family: FontAwesome
        fonts:
          - asset: fonts/FontAwesome.ttf
''',
  "mdi": '''
      - family: MaterialIcons
        fonts:
          - asset: fonts/MaterialIcons.ttf
''',
  "ent": '''
      - family: Entypo
        fonts:
          - asset: fonts/Entypo.ttf
''',
  "evi": '''
      - family: EvilIcons
        fonts:
          - asset: fonts/EvilIcons.ttf
''',
  "fea": '''
      - family: Feather
        fonts:
          - asset: fonts/Feather.ttf
''',
  "fou": '''
      - family: Foundation
        fonts:
          - asset: fonts/Foundation.ttf
''',
  "mco": '''
      - family: MaterialCommunityIcons
        fonts:
          - asset: fonts/MaterialCommunityIcons.ttf
''',
  "oct": '''
      - family: Octicons
        fonts:
          - asset: fonts/Octicons.ttf
''',
  "sli": '''
      - family: SimpleLineIcons
        fonts:
          - asset: fonts/SimpleLineIcons.ttf
''',
  "zoc": '''
      - family: Zocial
        fonts:
          - asset: fonts/Zocial.ttf
''',
  "faw5": '''
      - family: FontAwesome5
        fonts:
          - asset: fonts/FontAwesome5_Regular.ttf
''',
  "faw5b": '''
      - family: FontAwesome5_Brands
        fonts:
          - asset: fonts/FontAwesome5_Brands.ttf
''',
  "faw5s": '''
      - family: FontAwesome5_Solid
        fonts:
          - asset: fonts/FontAwesome5_Solid.ttf
''',
  "wea": '''
      - family: WeatherIcons
        fonts:
          - asset: fonts/weathericons.ttf
'''
};
