import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/color.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView(
          children: [
            _switchTile('App Notifications', true),
            _switchTile('Order Updates', true),
            _switchTile('Promotional Offers', false),
            _switchTile('New Products Alerts', true),
          ],
        ),
      ),
    );
  }

  Widget _switchTile(String title, bool value) {
    return SwitchListTile(
      activeColor: AppColor.primaryColor,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      value: value,
      onChanged: (_) {},
    );
  }
}
