import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';
import 'package:intl_phone_number_input/src/widgets/countries_search_list_widget.dart';

void main() {
  testWidgets('Closing the country list disposes it without errors',
      (WidgetTester tester) async {
    final countries = [
      Country(
        name: 'Poland',
        alpha2Code: 'PL',
        alpha3Code: 'POL',
        dialCode: '+48',
        flagUri: 'assets/flags/pl.png',
      ),
    ];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: CountrySearchListWidget(countries, null,
            showFlags: false, useEmoji: false),
      ),
    ));
    expect(find.byType(CountrySearchListWidget), findsOneWidget);
    expect(tester.takeException(), isNull);

    // Removing the widget runs dispose().
    await tester.pumpWidget(const MaterialApp(home: SizedBox()));
    expect(tester.takeException(), isNull);
  });
}
