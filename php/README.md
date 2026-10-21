# Cash Flow Statement API - PHP Package

Cash Flow Statement returns operating, investing and financing cash flows for a US public company by ticker - straight from SEC filings, with free cash flow, FCF margin and cash-conversion metrics calculated for you.

## Installation

Install via Composer:

```bash
composer require apiverve/cashflow
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Cashflow\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'ticker' => 'AAPL',
    'year' => 0,
    'quarter' => 0
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Cashflow\Client;
use APIVerve\Cashflow\Exceptions\APIException;
use APIVerve\Cashflow\Exceptions\ValidationException;

try {
    $response = $client->execute(['ticker' => 'AAPL', 'year' => 0, 'quarter' => 0]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/cashflow?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/cashflow?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/cashflow?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
