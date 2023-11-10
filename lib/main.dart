
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';


import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/data/service/shared_preferences_service.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
