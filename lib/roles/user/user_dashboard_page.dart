import 'package:flutter/material.dart';
import 'package:misastudio/theme/app_text.dart';
import '../../controllers/navigasi.dart';
import '../../theme/app_color.dart';

class DashboardUserPage extends StatefulWidget{
  const DashboardUserPage ({super.key});

  @override
  State<DashboardUserPage> createState() => _DashboardUserPage();
}

class _DashboardUserPage extends State<DashboardUserPage> {
  final navigasi = Navigasi();
  int _selectedIndex = 0;

  // final List<Widget> _pages = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme
        .of(context)
        .brightness == Brightness.dark;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: isDark ? AppColor.darkBackground : AppColor.lightBackground,

      appBar: AppBar(
        automaticallyImplyLeading: false, // => HILANGKAN TOMBOL BACK
        title: Text(
          'MISA STUDIO',
          style: AppText.title(context).copyWith(
            color: AppColor.black,
          )
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColor.black26,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColor.black,
        unselectedItemColor: AppColor.black26,
        backgroundColor: AppColor.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: 'Konsultation'),
          BottomNavigationBarItem(
              icon: Icon(Icons.timeline_outlined),
              label: 'Progres'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.work_history),
              label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'Information'),
        ],
      )
    );
  }
}