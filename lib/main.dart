import 'package:demo_app_nslhub/page/draggable_advanced_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Demo App NSLHUB';

  @override
  Widget build(BuildContext context) => MaterialApp(
    builder: (context, widget) => ResponsiveWrapper.builder(ClampingScrollWrapper.builder(context, widget),
      breakpoints : const[ResponsiveBreakpoint.resize(350, name: "Device1"),
      ResponsiveBreakpoint.autoScale(600, name: "Device2"),
      ResponsiveBreakpoint.resize(800, name: "Device3"),
      ResponsiveBreakpoint.autoScale(1700, name: "Device4")],
    ),
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.blueAccent,
    ),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: buildPages(),
  );

  Widget buildPages() {
        return DraggableAdvancedPage();
  }
}