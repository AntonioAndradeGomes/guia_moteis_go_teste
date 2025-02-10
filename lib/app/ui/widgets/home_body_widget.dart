import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_moteis_go_teste/app/ui/bloc/moteis_bloc.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/motel_item_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MoteisBloc, MoteisState>(
        builder: (context, state) {
          if (state is MoteisLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is MoteisError) {
            return Center(
              child: Text(
                state.exception.message,
              ),
            );
          }
          if (state is MoteisSuccess) {
            final moteis = state.moteis;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<MoteisBloc>().add(
                      MoteisFetch(
                        isNow: state.isNow,
                      ),
                    );
              },
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  bottom: 150,
                ),
                itemCount: moteis.length,
                itemBuilder: (context, index) {
                  final motel = moteis[index];
                  return MotelItemWidget(
                    item: motel,
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 10,
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
