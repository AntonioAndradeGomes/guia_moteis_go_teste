import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_go_teste/app/domain/models/motel.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/motel_item_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/reviews_widget.dart';
import 'package:guia_moteis_go_teste/app/ui/widgets/suite_item_widget.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../mock_response.dart';

void main() {
  testWidgets(
    'MotelItemWidget display correctly',
    (WidgetTester tester) async {
      final motel = Motel.fromJson(
        mockMoteis.first,
      );
      await mockNetworkImagesFor(
        () async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: MotelItemWidget(
                  item: motel,
                ),
              ),
            ),
          );
          await tester.pump();
        },
      );
      expect(find.byType(MotelItemWidget), findsOneWidget);
      expect(find.text(motel.fantasia), findsOneWidget);
      expect(find.text(motel.bairro), findsOneWidget);
      expect(find.byType(ReviewsWidget), findsOneWidget);
      expect(find.byType(ExpandableCarousel), findsOneWidget);
      expect(find.byType(SuiteItemWidget), findsNWidgets(motel.suites.length));
    },
  );
}
