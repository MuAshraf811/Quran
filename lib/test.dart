import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:quran/features/Masbha/presentation/widgets/custom_masbha_button.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            CustomMasbhaButton(
                text: 'permission',
                onPressed: () {
                  AwesomeNotifications().requestPermissionToSendNotifications();
                }),
            const SizedBox(
              height: 48,
            ),
            CustomMasbhaButton(
                text: 'create',
                onPressed: () {
                  AwesomeNotifications().createNotification(
                      content: NotificationContent(
                    id: 0,
                    channelKey: 'MySecondKey',
                    title: 'Test',
                    body: 'test , test , tset , test , test ',
                    bigPicture: 'assets/q/ssss.webp',
                    notificationLayout: NotificationLayout.BigPicture,
                  ));
                }),
            const SizedBox(
              height: 48,
            ),
            CustomMasbhaButton(text: 'permission', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class Hold {
 static holdNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'My3Key',
        title: 'صلاة الظهر',
        body: 'حان الان موعد أذان الظهر حسب توقيتك المحلي',
      ),
      schedule: NotificationCalendar(
        repeats: true, 
        
      ),
    );
  }
}
