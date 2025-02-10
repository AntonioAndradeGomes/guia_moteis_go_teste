import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_moteis_go_teste/app/core/dependencies/dependencies.dart';
import 'package:guia_moteis_go_teste/app/core/theme/app_theme.dart';
import 'package:guia_moteis_go_teste/app/data/repositories/moteis/motel_repository.dart';
import 'package:guia_moteis_go_teste/app/ui/bloc/moteis_bloc.dart';
import 'package:guia_moteis_go_teste/app/ui/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guia Moteis Go Teste',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: BlocProvider(
        create: (context) => MoteisBloc(
          motelRepository: injector.get<MotelRepository>(),
        )..add(MoteisFetch()),
        child: HomePage(),
      ),
    );
  }
}
