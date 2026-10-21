# Cash Flow Statement API - Ruby Gem

Cash Flow Statement returns operating, investing and financing cash flows for a US public company by ticker - straight from SEC filings, with free cash flow, FCF margin and cash-conversion metrics calculated for you.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_cashflow'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_cashflow
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_cashflow'

# Initialize the client
client = APIVerve::Cashflow::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  ticker: "AAPL",
  year: 0,
  quarter: 0
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ ticker: "AAPL", year: 0, quarter: 0 })
  puts response["data"]
rescue APIVerve::Cashflow::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Cashflow::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Cashflow::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/cashflow?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/cashflow?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/cashflow?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
