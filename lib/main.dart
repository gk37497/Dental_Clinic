import 'package:dc_app/providers/order_provider.dart';
import 'package:dc_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => OrderProvider()),
    ],
    child: DentalClinic(),
  ));
}

class DentalClinic extends StatelessWidget {
  const DentalClinic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dental Clinic App",
      home: Home(),
    );
  }
}
