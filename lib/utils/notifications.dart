import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging _messaging = FirebaseMessaging.instance;

Future<void> grantMessagingPermission() async {
  NotificationSettings settings = await _messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
}

void onMessage(RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message information');
  message.toMap().forEach((key, value) {
    print('${key}: ${value}');
  });
}

void onLaunchAndResume(RemoteMessage message) {
  print('Got a message whilst on launch and on resume!');
  print('Message information');
  message.toMap().forEach((key, value) {
    print('${key}: ${value}');
  });
}
