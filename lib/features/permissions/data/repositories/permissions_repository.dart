import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionRepositoryProvider = Provider(
  (_) => PermissionsRepositoryImpl(),
);

abstract class PermissionsRepository {
  Future requestPermission({
    required Function() onSuccess,
    required Function() onFail,
    required Permission permission,
  });
}

class PermissionsRepositoryImpl implements PermissionsRepository {
  PermissionsRepositoryImpl();

  @override
  Future requestPermission({
    required Function() onSuccess,
    required Function() onFail,
    required Permission permission,
  }) async {
    final status = await permission.request();
    if (status.isGranted) {
      return onSuccess();
    } else {
      return onFail();
    }
  }
}

///Android setup - add to AndroidManifest.xml
/*
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    package="com.baseflow.permissionhandler.example">

    <!--
    Internet permissions do not affect the `permission_handler` plugin, but are required if your app needs access to
    the internet.
    -->
    <uses-permission android:name="android.permission.INTERNET"/>

    <!-- Permissions options for the `contacts` group -->
    <uses-permission android:name="android.permission.READ_CONTACTS"/>
    <uses-permission android:name="android.permission.WRITE_CONTACTS"/>
    <uses-permission android:name="android.permission.GET_ACCOUNTS"/>

    <!-- Permissions options for the `storage` group -->
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

    <!-- Permissions options for the `camera` group -->
    <uses-permission android:name="android.permission.CAMERA"/>

    <!-- Permissions options for the `sms` group -->
    <uses-permission android:name="android.permission.SEND_SMS"/>
    <uses-permission android:name="android.permission.RECEIVE_SMS"/>
    <uses-permission android:name="android.permission.READ_SMS"/>
    <uses-permission android:name="android.permission.RECEIVE_WAP_PUSH"/>
    <uses-permission android:name="android.permission.RECEIVE_MMS"/>

    <!-- Permissions options for the `phone` group -->
    <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
    <uses-permission android:name="android.permission.CALL_PHONE"/>
    <uses-permission android:name="android.permission.ADD_VOICEMAIL"/>
    <uses-permission android:name="android.permission.USE_SIP"/>
    <uses-permission android:name="android.permission.READ_CALL_LOG"/>
    <uses-permission android:name="android.permission.WRITE_CALL_LOG"/>
    <uses-permission android:name="android.permission.BIND_CALL_REDIRECTION_SERVICE"/>

    <!-- Permissions options for the `calendar` group -->
    <uses-permission android:name="android.permission.READ_CALENDAR" />
    <uses-permission android:name="android.permission.WRITE_CALENDAR" />

    <!-- Permissions options for the `location` group -->
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />

    <!-- Permissions options for the `microphone` or `speech` group -->
    <uses-permission android:name="android.permission.RECORD_AUDIO" />

    <!-- Permissions options for the `sensors` group -->
    <uses-permission android:name="android.permission.BODY_SENSORS" />

    <!-- Permissions options for the `accessMediaLocation` group -->
    <uses-permission android:name="android.permission.ACCESS_MEDIA_LOCATION" />

    <!-- Permissions options for the `activityRecognition` group -->
    <uses-permission android:name="android.permission.ACTIVITY_RECOGNITION" />

    <!-- Permissions options for the `ignoreBatteryOptimizations` group -->
    <uses-permission android:name="android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS" />

    <!-- Permissions options for the `bluetooth` group -->
    <uses-permission android:name="android.permission.BLUETOOTH" />
    <uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />

    <!-- Permissions options for the `manage external storage` group -->
    <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />

    <!-- Permissions options for the `system alert windows` group -->
    <uses-permission android:name="android.permission.SYSTEM_ALERT_WINDOW" />

    <!-- Permissions options for the `request install packages` group -->
    <uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />

    <!-- Permissions options for the `access notification policy` group -->
    <uses-permission android:name="android.permission.ACCESS_NOTIFICATION_POLICY"/>

    <application
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:label="permission_handler_example"
        tools:ignore="AllowBackup,GoogleAppIndexingWarning">

        <activity android:name="io.flutter.embedding.android.FlutterActivity"
            android:launchMode="singleTop"
            android:theme="@android:style/Theme.Black.NoTitleBar"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|locale|layoutDirection"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>

        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>
*/

///iOS setup
///1. Add the following to your Podfile file:
// post_install do |installer|
//   installer.pods_project.targets.each do |target|
//     ... # Here are some configurations automatically generated by flutter
//
//     # Start of the permission_handler configuration
//     target.build_configurations.each do |config|
//
//       # You can enable the permissions needed here. For example to enable camera
//       # permission, just remove the `#` character in front so it looks like this:
//       #
//       # ## dart: PermissionGroup.camera
//       # 'PERMISSION_CAMERA=1'
//       #
//       #  Preprocessor definitions can be found in: https://github.com/Baseflow/flutter-permission-handler/blob/master/permission_handler_apple/ios/Classes/PermissionHandlerEnums.h
//       config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
//         '$(inherited)',
//
//         ## dart: PermissionGroup.calendar
//         # 'PERMISSION_EVENTS=1',
//
//         ## dart: PermissionGroup.reminders
//         # 'PERMISSION_REMINDERS=1',
//
//         ## dart: PermissionGroup.contacts
//         # 'PERMISSION_CONTACTS=1',
//
//         ## dart: PermissionGroup.camera
//         # 'PERMISSION_CAMERA=1',
//
//         ## dart: PermissionGroup.microphone
//         # 'PERMISSION_MICROPHONE=1',
//
//         ## dart: PermissionGroup.speech
//         # 'PERMISSION_SPEECH_RECOGNIZER=1',
//
//         ## dart: PermissionGroup.photos
//         # 'PERMISSION_PHOTOS=1',
//
//         ## dart: [PermissionGroup.location, PermissionGroup.locationAlways, PermissionGroup.locationWhenInUse]
//         # 'PERMISSION_LOCATION=1',
//
//         ## dart: PermissionGroup.notification
//         # 'PERMISSION_NOTIFICATIONS=1',
//
//         ## dart: PermissionGroup.mediaLibrary
//         # 'PERMISSION_MEDIA_LIBRARY=1',
//
//         ## dart: PermissionGroup.sensors
//         # 'PERMISSION_SENSORS=1',
//
//         ## dart: PermissionGroup.bluetooth
//         # 'PERMISSION_BLUETOOTH=1',
//
//         ## dart: PermissionGroup.appTrackingTransparency
//         # 'PERMISSION_APP_TRACKING_TRANSPARENCY=1',
//
//         ## dart: PermissionGroup.criticalAlerts
//         # 'PERMISSION_CRITICAL_ALERTS=1'
//       ]
//
//     end
//     # End of the permission_handler configuration
//   end
// end

///2. Remove the # character in front of the permission you do want to use. For example if you need access to the calendar make sure the code looks like this:
