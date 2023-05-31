import 'package:app_group_directory/app_group_directory.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const channel = MethodChannel('me.wolszon.app_group_directory/channel');

  setUp(
    () {
      TestWidgetsFlutterBinding.ensureInitialized();

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        channel,
        (_) async => '/private/var/mobile/Containers/Shared/'
            'AppGroup/5CFF96C4-8B73-449F-99A3-F871D21862BD',
      );
    },
  );

  tearDown(() => TestDefaultBinaryMessengerBinding
      .instance.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, null));

  test('getAppGroupDirectory', () async {
    final dir =
        await AppGroupDirectory.getAppGroupDirectory('com.example.app1');

    expect(
      dir?.path,
      '/private/var/mobile/Containers/Shared/'
      'AppGroup/5CFF96C4-8B73-449F-99A3-F871D21862BD',
    );
  });
}
