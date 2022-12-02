flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart 

flutter drive --no-pub --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d DFEAD234-4BB0-447E-97D2-622C577EA024

flutter drive --no-pub --no-build --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d DFEAD234-4BB0-447E-97D2-622C577EA024


flutter drive --no-pub --use-application-binary build/ios/iphoneos/Runner.app --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d DFEAD234-4BB0-447E-97D2-622C577EA024

flutter drive --no-pub --use-application-binary build/ios/iphonesimulator/Runner.app --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart -d DFEAD234-4BB0-447E-97D2-622C577EA024



flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d chrome

