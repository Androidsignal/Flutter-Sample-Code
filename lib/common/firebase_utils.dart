import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseUtils {

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  FirebaseUtils(){
    messaging = FirebaseMessaging.instance;
    notificationPermission();
    configureFirebaseMessaging();
    getToken();
  }

  Future<String> getToken() async {
    try {
      var token = await messaging.getToken();
      return token;
    } catch (e) {
      print('Exception at get token $e');
    }
    return '';
  }

  notificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  configureFirebaseMessaging() {
    try {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
            print('Got a message whilst in the foreground!');
            print('Message data: ${message.data}');
            if (message.notification != null) {
              print('Message also contained a notification: ${message.notification}');
            }
          });

      FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async{
            print("Handling a background message: ${message.messageId}");
          });
    } catch (e) {
      print('Exception in configureFirebaseMessaging $e');
    }
  }
}
