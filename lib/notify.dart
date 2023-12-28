import 'package:flutter/material.dart';

class NotificationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/notification-detail': (context) => NotificationDetailScreen(),
       },
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
    'Notification 4',
    'Notification 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification Screen',
          style: TextStyle(fontFamily: 'Inter'),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/notification-detail',
                arguments: notifications[index],
              );
            },
          );
        },
      ),
    );
  }
}

class NotificationDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notification = ModalRoute.of(context)!.settings.name as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Detail'),
      ),
      body: Center(

    ),);
  }
}

void main() {
  runApp(NotificationApp());
}
