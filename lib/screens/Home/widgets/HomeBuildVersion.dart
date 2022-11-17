import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_uis/configs/AppDimensions.dart';
import 'package:flutter_uis/configs/AppTheme.dart';
import 'package:flutter_uis/configs/TextStyles.dart';
import 'package:flutter_uis/configs/App.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../messages/keys.dart';

final versionProvider = FutureProvider<String>((ref) async {
  final package = await PackageInfo.fromPlatform();
  final version = "${package.version}";
  return version;
});

class HomeBuildVersion extends ConsumerWidget {
  @override
  Widget build(context, ref) {
    final provider = ref.watch(versionProvider);
    return provider.when(
      data: (data) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: AppDimensions.padding * 3,
          ),
          width: double.infinity,
          child: Text(
            "${App.translate(HomeScreenMessages.version, context)} ${data}",
            textAlign: TextAlign.center,
            style: TextStyles.body27.copyWith(
              color: AppTheme.text.withOpacity(0.4),
            ),
          ),
        );
      },
      error: (error, stack) => Text("ERROR"),
      loading: () => SizedBox(),
    );
  }
}
