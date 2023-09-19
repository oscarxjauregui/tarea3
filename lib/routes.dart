import 'package:flutter/widgets.dart';
//import 'package:pmsn20232/screens/add_task.dart';
import 'package:tarea3/home_screen.dart';
//import 'package:pmsn20232/screens/dashboard_screen.dart';


Map<String,WidgetBuilder> getRoutes(){
  return {
    //'/dash' : (BuildContext context) => DashboardScreen(),
    '/home' : (BuildContext context) => HomeScreen()
  };
}