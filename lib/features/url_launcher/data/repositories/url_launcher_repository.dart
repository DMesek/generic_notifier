// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/domain/either_failure_or.dart';
import '../../../../common/domain/entitites/failure.dart';

final urlLauncherRepositoryProvider = Provider<IUrlLauncherRepository>(
  (ref) => UrlLauncherRepository(),
);

class UrlLauncherRepository implements IUrlLauncherRepository {
  @override
  EitherFailureOr<bool> openUrl({
    Uri? url,
    String? urlString,
    LaunchMode mode = LaunchMode.platformDefault,
    WebViewConfiguration webViewConfiguration = const WebViewConfiguration(),
    String? webOnlyWindowName,
  }) async {
    Uri? tmpUrl = url;
    if (tmpUrl == null && urlString != null) {
      tmpUrl = Uri.tryParse(urlString);
    }
    if (tmpUrl != null) {
      try {
        return Right(await launchUrl(
          tmpUrl,
          mode: mode,
          webViewConfiguration: webViewConfiguration,
          webOnlyWindowName: webOnlyWindowName,
        ));
      } catch (error, stackTrace) {
        return Left(Failure.generic(error: error, stackTrace: stackTrace));
      }
    }
    return Left(Failure.generic());
  }

  @override
  EitherFailureOr<bool> canOpenUrl({
    Uri? url,
    String? urlString,
  }) async {
    Uri? tmpUrl = url;
    if (tmpUrl == null && urlString != null) {
      tmpUrl = Uri.tryParse(urlString);
    }
    if (tmpUrl != null) {
      try {
        return Right(await canLaunchUrl(tmpUrl));
      } catch (error, stackTrace) {
        return Left(Failure.generic(error: error, stackTrace: stackTrace));
      }
    }
    return Left(Failure.generic());
  }
}

abstract class IUrlLauncherRepository {
  EitherFailureOr<bool> openUrl({
    Uri? url,
    String? urlString,
    LaunchMode mode = LaunchMode.platformDefault,
    WebViewConfiguration webViewConfiguration = const WebViewConfiguration(),
    String? webOnlyWindowName,
  });

  EitherFailureOr<bool> canOpenUrl({
    Uri? url,
    String? urlString,
  });
}
