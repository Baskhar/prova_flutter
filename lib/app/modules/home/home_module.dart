
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova_flutter/app/modules/home/home_store.dart';
import 'package:prova_flutter/app/modules/home/screens/home_screen.dart';

import '../../data/repository/text_repository.dart';
class HomeModule extends Module {



  @override
  List<Bind> get binds => [
    Bind((_) => TextRepository()),
    Bind((i) => HomeStore(i.get<TextRepository>())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) =>  HomeScreen()),

  ];
}