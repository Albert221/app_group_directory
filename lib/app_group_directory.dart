import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class AppGroupDirectory {
  static const MethodChannel _channel = MethodChannel('me.wolszon.app_group_directory/channel');

  /// Returns the container directory associated with the specified security
  /// application group identifier [groupId].
  ///
  /// Returns `null` if the app group does not exist or there is no access to it.
  ///
  /// On iOS, this uses the `containerURLForSecurityApplicationGroupIdentifier` API.
  /// Returns method not implemented on other platforms.
  ///
  /// See https://developer.apple.com/documentation/foundation/nsfilemanager/1412643-containerurlforsecurityapplicati
  Future<Directory?> getAppGroupDirectory(String groupId) async {
    final path = await _channel.invokeMethod<String>('getAppGroupDirectory', groupId);

    if (path == null) {
      return null;
    }

    return Directory(path);
  }
}
