import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: "basic_channel",
        channelName: "Basic notifications",
        channelDescription: "Notification channel for basic tests",
        importance: NotificationImportance.Max,
      ),
    ],
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((value) =>
        AwesomeNotifications().requestPermissionToSendNotifications());
    super.initState();
  }

  triggleNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 10,
      channelKey: "basic_channel",
      title: "Renai",
      body: "Hello giri",
      bigPicture:
          "https://scontent.fktm8-1.fna.fbcdn.net/v/t31.18172-8/14939449_961491573984338_7746141411823876974_o.jpg?_nc_cat=101&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=ZVjgSpRr4YgAX-X0Og6&_nc_ht=scontent.fktm8-1.fna&oh=00_AfCxR4sTmn9MDXwGJ93O1JgQhyA29PeYbMOueGaOgei1gQ&oe=648A6987",
      notificationLayout: NotificationLayout.BigPicture,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: triggleNotification,
            child: const Text("Triggle Notificatons")),
      ),
    );
  }
}
