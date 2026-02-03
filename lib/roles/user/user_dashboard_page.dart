import 'package:flutter/material.dart';

import '../../controllers/navigasi.dart';
import '../../theme/app_color.dart';

class DashboardUserPage extends StatefulWidget{
  const DashboardUserPage ({super.key});

  @override
  State<DashboardUserPage> createState() => _DashboardUserPage();
}

class _DashboardUserPage extends State<DashboardUserPage> {
  final navigasi = Navigasi();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme
        .of(context)
        .brightness == Brightness.dark;
    return Scaffold(
        resizeToAvoidBottomInset: true, // penting agar layout menyesuaikan saat keyboard muncul
        backgroundColor:
        isDark ? AppColor.darkBackground : AppColor.lightBackground);
  }
}