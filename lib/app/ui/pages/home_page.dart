import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_moteis_go_teste/app/ui/bloc/moteis_bloc.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/app_app_bar_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/filter_column_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/home_body_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 40,
        child: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.map),
          label: const Text('Mapa'),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          AppAppBarWidget(
            onToggle: (index) {
              context.read<MoteisBloc>().add(MoteisFetch(isNow: index == 0));
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: const Column(
                children: [
                  FilterColumnWidget(),
                  HomeBodyWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
