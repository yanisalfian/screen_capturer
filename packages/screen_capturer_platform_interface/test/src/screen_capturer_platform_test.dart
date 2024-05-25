import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:screen_capturer_platform_interface/src/capture_mode.dart';
import 'package:screen_capturer_platform_interface/src/captured_data.dart';
import 'package:screen_capturer_platform_interface/src/screen_capturer_method_channel.dart';
import 'package:screen_capturer_platform_interface/src/screen_capturer_platform.dart';
import 'package:screen_capturer_platform_interface/src/system_screen_capturer.dart';

class MockScreenCapturerPlatform
    with MockPlatformInterfaceMixin
    implements ScreenCapturerPlatform {
  @override
  SystemScreenCapturer get systemScreenCapturer => throw UnimplementedError();

  @override
  Future<bool> isAccessAllowed() {
    return Future(() => true);
  }

  @override
  Future<void> requestAccess({
    bool onlyOpenPrefPane = false,
  }) {
    throw UnimplementedError('requestAccess() has not been implemented.');
  }

  @override
  Future<Uint8List?> readImageFromClipboard() {
    throw UnimplementedError(
      'readImageFromClipboard() has not been implemented.',
    );
  }

  @override
  Future<void> saveClipboardImageAsPngFile({
    required String imagePath,
  }) {
    throw UnimplementedError(
      'saveClipboardImageAsPngFile() has not been implemented.',
    );
  }

  @override
  Future<void> captureScreen({
    required String imagePath,
  }) async {
    throw UnimplementedError('captureScreen() has not been implemented.');
  }

  @override
  Future<CapturedData?> capture({
    required CaptureMode mode,
    String? imagePath,
    bool copyToClipboard = true,
    bool silent = true,
    int? display,
  }) {
    throw UnimplementedError();
  }
}

void main() {
  final ScreenCapturerPlatform initialPlatform =
      ScreenCapturerPlatform.instance;

  test('$MethodChannelScreenCapturer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenCapturer>());
  });

  test('isAccessAllowed', () async {
    MockScreenCapturerPlatform fakePlatform = MockScreenCapturerPlatform();
    ScreenCapturerPlatform.instance = fakePlatform;

    expect(
      await ScreenCapturerPlatform.instance.isAccessAllowed(),
      true,
    );
  });
}
