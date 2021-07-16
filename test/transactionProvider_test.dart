import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testapp/provider/transactionProvider.dart';

import 'transactionProvider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchTransaction', () {
    test('returns an Transactions if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('https://60e29b749103bd0017b4743f.mockapi.io/api/v1/transactions')))
          .thenAnswer((_) async => http.Response('[{"date": "2021-07-05T00:34:29.993Z","amount": "209.78","type": "withdrawal","currencyCode": "XBD","iban": "IE53624A00844716683079","description": "payment transaction at Hilpert, Emard and Denesik using card ending with ***9524 for JPY 324.08 in account ***83781284","bic": "JBFEMWP1745","id": "1"}', 200));

      expect(await TransactionProvider().getTransactions(), isA<List>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('https://60e29b749103bd0017b4743f.mockapi.io/api/v1/transactions')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(TransactionProvider().getTransactions(), throwsException);
    });
  });
}