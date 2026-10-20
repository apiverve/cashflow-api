Cash Flow Statement API
============

Cash Flow Statement returns operating, investing and financing cash flows for a US public company by ticker - straight from SEC filings, with free cash flow, FCF margin and cash-conversion metrics calculated for you.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-cashflowstatement.svg)](https://pypi.org/project/apiverve-cashflowstatement/)

This is a Python wrapper for the [Cash Flow Statement API](https://apiverve.com/marketplace/cashflow?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-cashflowstatement
```

Using `pip3`:

```bash
pip3 install apiverve-cashflowstatement
```

---

## Configuration

Before using the Cash Flow Statement API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_cashflowstatement.apiClient import CashflowAPIClient

# Initialize the client with your APIVerve API key
api = CashflowAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Cash Flow Statement API documentation is found here: [https://docs.apiverve.com/ref/cashflow](https://docs.apiverve.com/ref/cashflow?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_cashflowstatement.apiClient import CashflowAPIClient

# Initialize the client with your APIVerve API key
api = CashflowAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `CashflowAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_cashflowstatement.apiClient import CashflowAPIClient, CashflowAPIClientError

api = CashflowAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except CashflowAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_cashflowstatement.apiClient import CashflowAPIClient, CashflowAPIClientError

api = CashflowAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except CashflowAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_cashflowstatement.apiClient import CashflowAPIClient, CashflowAPIClientError

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

# Using context manager ensures proper cleanup
with CashflowAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except CashflowAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_cashflowstatement.apiClient import CashflowAPIClient

# Enable debug mode
api = CashflowAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_cashflowstatement.apiClient import CashflowAPIClient

api = CashflowAPIClient("[YOUR_API_KEY]")

query = {
    "ticker": "AAPL",
    "year": 0,
    "quarter": 0
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
