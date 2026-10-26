# Cash Flow Statement API - Dart/Flutter Client

Cash Flow Statement returns operating, investing and financing cash flows for a US public company by ticker - straight from SEC filings, with free cash flow, FCF margin and cash-conversion metrics calculated for you.

[![pub package](https://img.shields.io/pub/v/apiverve_cashflow.svg)](https://pub.dev/packages/apiverve_cashflow)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Cash Flow Statement API](https://apiverve.com/marketplace/cashflow?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_cashflow: ^1.2.3
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_cashflow/apiverve_cashflow.dart';

void main() async {
  final client = CashflowClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'ticker': 'AAPL',
      'year': 0,
      'quarter': 0
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "ticker": "AAPL",
    "company": "Apple Inc.",
    "cik": "0000320193",
    "fiscalYear": 2025,
    "fiscalQuarter": 4,
    "filingType": "10-K",
    "filingDate": "2025-10-31",
    "periodEnd": "2025-09-27",
    "cashFlow": {
      "operatingCashFlow": 111482000000,
      "capitalExpenditures": 12715000000,
      "investingCashFlow": 15195000000,
      "financingCashFlow": -120686000000,
      "dividendsPaid": 15421000000,
      "shareRepurchases": 90711000000,
      "freeCashFlow": 98767000000
    },
    "metrics": {
      "fcfMargin": 23.73,
      "operatingCashFlowMargin": 26.79,
      "capexToRevenue": 3.06,
      "cashFlowToNetIncome": 1,
      "dividendPayoutRatio": 13.77,
      "fcfPerShare": 6.5824
    },
    "formatted": {
      "operatingCashFlow": "$111.48B",
      "freeCashFlow": "$98.77B",
      "capitalExpenditures": "$12.71B"
    }
  }
}
```

## API Reference

- **API Home:** [Cash Flow Statement API](https://apiverve.com/marketplace/cashflow?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/cashflow](https://docs.apiverve.com/ref/cashflow?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
