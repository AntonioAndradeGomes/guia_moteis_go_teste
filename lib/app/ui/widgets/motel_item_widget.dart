import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_moteis_go_teste/app/domain/models/motel.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/reviews_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/suite_item_widget.dart';

class MotelItemWidget extends StatelessWidget {
  final Motel item;

  const MotelItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.network(
                      item.logo,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.fantasia,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          item.bairro,
                        ),
                        ReviewsWidget(
                          rating: item.media,
                          reviews: item.qtdAvaliacoes,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidHeart,
                    size: 25,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
        ExpandableCarousel(
          options: ExpandableCarouselOptions(
            autoPlay: false,
            showIndicator: false,
            initialPage: 0,
            viewportFraction: 0.91,
            aspectRatio: 0,
          ),
          items: item.suites.map(
            (s) {
              return SuiteItemWidget(
                suite: s,
              );
            },
          ).toList(),
        )
      ],
    );
  }
}
