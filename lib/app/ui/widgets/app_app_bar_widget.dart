import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_moteis_go_teste/app/ui/bloc/moteis_bloc.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/item_arrow_down_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AppAppBarWidget extends StatelessWidget {
  final OnToggle? onToggle;
  const AppAppBarWidget({
    super.key,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              ToggleSwitch(
                minWidth: 120,
                initialLabelIndex: 0,
                cornerRadius: 20.0,
                activeFgColor: Colors.red,
                inactiveFgColor: Colors.white,
                radiusStyle: true,
                labels: ['ir agora', 'ir outro dia'],
                icons: [
                  Icons.flash_on,
                  FontAwesomeIcons.calendarCheck,
                ],
                activeBgColors: [
                  [Colors.white],
                  [Colors.white]
                ],
                inactiveBgColor: Color(0xffb8000e),
                onToggle: onToggle,
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: BlocBuilder<MoteisBloc, MoteisState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ItemArrowDownWidget(
                      label: 'Maceió',
                    ),
                    if (!state.isNow)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: ItemArrowDownWidget(
                          label: '22 fev - 23 fev',
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
