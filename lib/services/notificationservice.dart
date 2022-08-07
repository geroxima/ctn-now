import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  // App en 2do Plano
  static Future _backgroundHandler(RemoteMessage message) async {
    print("On background Handler ${message.messageId}");
  }

//App en Pantalla manejador de notificaciones
  static Future _onMessageHandler(RemoteMessage message) async {
    print("On Message Handler ${message.messageId}");
  }

//Terminada
  static Future _onMessageOpenApp(RemoteMessage message) async {
    print("on Message Open App ${message.messageId}");
  }

  static Future initializeApp() async {
    //push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('========================FCM TOKEN========================');
    print(token);
    print('========================FCM TOKEN========================');
    // local notificaciones
  }
}
