import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_moteis_go_teste/app/core/constants/constants.dart';
import 'package:guia_moteis_go_teste/app/ui/bloc/moteis_bloc.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/filter_tile.dart';

class FilterColumnWidget extends StatelessWidget {
  const FilterColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: BlocBuilder<MoteisBloc, MoteisState>(
            builder: (context, state) {
              return ListView.separated(
                //shrinkWrap: true,
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: Constants.filters.length,
                itemBuilder: (context, index) {
                  return FilterTile(
                    label: Constants.filters[index],
                    icon: index == 0 ? FontAwesomeIcons.sliders : null,
                    isLoading: state is MoteisLoading,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10,
                  );
                },
              );
            },
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
