import 'package:dc_app/helpers/employee_service.dart';
import 'package:dc_app/helpers/strings.dart';
import 'package:dc_app/models/employee.dart';
import 'package:dc_app/theme.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.userLogin}) : super(key: key);

  final userLogin;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _errorMessageShow = false;

  @override
  Widget build(BuildContext context) {
    //Login screen Body
    Container body() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: white),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(143, 148, 251, .2),
              blurRadius: 20.0,
              offset: Offset(5, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.local_hospital_outlined,
                    color: primary,
                    size: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        hospitalName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: black,
                        ),
                      ),
                      const Text(
                        motto,
                        style: TextStyle(
                          fontSize: 13,
                          color: primary,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      child: TextFormField(
                        controller: _userNameController,
                        decoration: const InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person_outline_rounded,
                            color: primary,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: "Нэвтрэх нэр",
                          labelStyle: TextStyle(color: grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: primary,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: "Нууц үг",
                          labelStyle: TextStyle(color: grey),
                          // suffixIcon: IconButton(onPressed:, icon: Icon(Icons.remove_red_eye, color: grey)),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Visibility(
                      visible: _errorMessageShow,
                      child: Text("Нэвтрэх нэр эсвэл нууц үг буруу байна.",
                          style: TextStyle(color: Colors.red)),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: ElevatedButton(
                        onPressed: handleLoginBtn,
                        child: Text("Нэвтрэх"),
                        style: ElevatedButton.styleFrom(
                            primary: primary,
                            padding: EdgeInsets.symmetric(
                              horizontal: 90,
                              vertical: 15,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    //Login Screen footer
    Container footer() => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Powered by",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Mongol iD",
                    style: TextStyle(color: black, fontWeight: FontWeight.w700),
                  )
                ],
              )
            ],
          ),
        );

    return Scaffold(
        appBar: AppBar(toolbarHeight: -1, backgroundColor: primary),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
            child: Column(
              children: [
                body(),
                SizedBox(height: 100),
                footer(),
              ],
            ),
          ),
        ));
  }

  void handleLoginBtn() async {
    Employee? employee = await loginUser(
      _userNameController.text,
      _passwordController.text,
    );
    if (employee != null) {
      widget.userLogin(employee);
      showErrorMessage(false);
    } else
      showErrorMessage(true);
  }

  void showErrorMessage(bool a) {
    setState(() {
      _errorMessageShow = a;
    });
  }
}
