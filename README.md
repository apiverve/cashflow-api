# [Cash Flow Statement API](https://apiverve.com/marketplace/cashflow?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

Cash Flow Statement returns operating, investing and financing cash flows for a US public company by ticker - straight from SEC filings, with free cash flow, FCF margin and cash-conversion metrics calculated for you.

The Cash Flow Statement API provides a simple, reliable way to integrate cash flow statement functionality into your applications. Built for developers who need production-ready cash flow statement capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/cashflow?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/cashflow?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/cashflow)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.CashFlowStatement)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-cashflow/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_cashflow)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/cashflow)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_cashflow)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callCashFlowStatementAPI() {
    try {
        const params = new URLSearchParams({
            ticker: 'AAPL'
        });

        const response = await fetch(`https://api.apiverve.com/v1/cashflow?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callCashFlowStatementAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/cashflow?ticker=AAPL" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/cashflow
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/cashflow) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.CashFlowStatement
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.CashFlowStatement) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-cashflow
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-cashflow/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_cashflow
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_cashflow) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/cashflow
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/cashflow) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_cashflow
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_cashflow) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:cashflow-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/cashflow-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [Cash Flow Statement API](https://apiverve.com/marketplace/cashflow?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/cashflow](https://docs.apiverve.com/ref/cashflow)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The Cash Flow Statement API is commonly used for:

- **Web Applications** - Add cash flow statement features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with cash flow statement capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the Cash Flow Statement API:

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

## Support & Community

- 🏠 **API Home**: [Cash Flow Statement API](https://apiverve.com/marketplace/cashflow?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
