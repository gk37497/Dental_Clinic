import 'package:dc_app/models/employee.dart';
import 'package:dc_app/screens/login_screen.dart';
import 'package:dc_app/theme.dart';
import 'package:flutter/material.dart';

import 'admin/admin_screen.dart';
import 'dentist/dentist_screen.dart';
import 'reception/reception_screen.dart';
import 'superAdmin/super_admin_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

PageController _pageController = PageController();

class _HomeState extends State<Home> {
  bool _isUserLoggedIn = false;
  late Employee _employee;
  int _page = 0;

  DrawerHeader sideBarHeader() {
    return DrawerHeader(
      child: ListTile(
        leading: CircleAvatar(
          radius: 40,
        ),
        title: Text(
          _employee.firstName + " " + _employee.lastName,
          style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(_employee.hospital.hospitalName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ListTile menuItem(String roleCode) {
      switch (roleCode) {
        case "admin":
          return (ListTile(
            leading: Icon(Icons.admin_panel_settings_outlined, color: primary),
            title: Text("Админ"),
            trailing: Icon(Icons.arrow_right_rounded, color: primary),
            onTap: () {
              navigationTapped(0);
              Navigator.pop(context);
            },
          ));
        case "dentist":
          return (ListTile(
            leading: Icon(Icons.person, color: primary),
            title: Text("Эмч"),
            trailing: Icon(Icons.arrow_right_rounded, color: primary),
            onTap: () {
              navigationTapped(1);
              Navigator.pop(context);
            },
          ));
        case "reception":
          return (ListTile(
            leading: Icon(Icons.support_agent_rounded, color: primary),
            title: Text("Угтагч"),
            trailing: Icon(Icons.arrow_right_rounded, color: primary),
            onTap: () {
              navigationTapped(2);
              Navigator.pop(context);
            },
          ));
        case "super_admin":
          return (ListTile(
            leading: Icon(Icons.admin_panel_settings, color: primary),
            title: Text("Супер Админ"),
            trailing: Icon(Icons.arrow_right_rounded, color: primary),
            onTap: () {
              navigationTapped(3);
              Navigator.pop(context);
            },
          ));
      }
      return (ListTile(
        leading: Icon(Icons.admin_panel_settings, color: primary),
        title: Text("Супер Админ"),
        trailing: Icon(Icons.arrow_right_rounded, color: primary),
        onTap: () {
          navigationTapped(0);
          Navigator.pop(context);
        },
      ));
    }

    Scaffold homeScreen() {
      return Scaffold(
        appBar: AppBar(backgroundColor: secondary),
        body: PageView(
          children: [
            AdminScreen(),
            DentistScreen(),
            ReceptionScreen(),
            SuperAdminScreen(),
          ],
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 120,
                child: sideBarHeader(),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: _employee.empRoles.length,
                  itemBuilder: (context, int i) {
                    return menuItem(_employee.empRoles[i].roleCode);
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined, color: primary),
                title: Text("Гарах"),
                onTap: userLogout,
              ),
            ],
          ),
        ),
      );
    }

    return _isUserLoggedIn ? homeScreen() : Login(userLogin: userLogin);
  }

  void userLogin(Employee emp) {
    setState(() {
      _isUserLoggedIn = true;
      _employee = emp;
    });
    print(_employee.hospital.hospitalName);
  }

  void userLogout() {
    setState(() {
      _isUserLoggedIn = false;
    });
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }
}
