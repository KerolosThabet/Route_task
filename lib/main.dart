import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/shared/DI/di.dart';
import 'package:route_task/shared/api/api_manager.dart';
import 'package:route_task/shared/myobserver.dart';

import 'my_app.dart';

void main() {

  ApiManager.init();
  Bloc.observer =MyBlocObserver();
  configureDependencies();
  runApp(const MyApp());

}
