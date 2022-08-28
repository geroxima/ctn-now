import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class PushNotificationService {
  static Future initializeApp() async {
    //push notifications
    await Firebase.initializeApp();
  }
}
