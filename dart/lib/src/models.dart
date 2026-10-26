/// Response models for the Cash Flow Statement API.

/// API Response wrapper.
class CashflowResponse {
  final String status;
  final dynamic error;
  final CashflowData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  CashflowResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory CashflowResponse.fromJson(Map<String, dynamic> json) => CashflowResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CashflowData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Cash Flow Statement API.

class CashflowData {
  String? ticker;
  String? company;
  String? cik;
  num? fiscalYear;
  num? fiscalQuarter;
  String? filingType;
  String? filingDate;
  String? periodEnd;
  CashflowDataCashflow? cashFlow;
  CashflowDataMetrics? metrics;
  CashflowDataFormatted? formatted;

  CashflowData({
    this.ticker,
    this.company,
    this.cik,
    this.fiscalYear,
    this.fiscalQuarter,
    this.filingType,
    this.filingDate,
    this.periodEnd,
    this.cashFlow,
    this.metrics,
    this.formatted,
  });

  factory CashflowData.fromJson(Map<String, dynamic> json) => CashflowData(
      ticker: json['ticker'],
      company: json['company'],
      cik: json['cik'],
      fiscalYear: json['fiscalYear'],
      fiscalQuarter: json['fiscalQuarter'],
      filingType: json['filingType'],
      filingDate: json['filingDate'],
      periodEnd: json['periodEnd'],
      cashFlow: json['cashFlow'] != null ? CashflowDataCashflow.fromJson(json['cashFlow']) : null,
      metrics: json['metrics'] != null ? CashflowDataMetrics.fromJson(json['metrics']) : null,
      formatted: json['formatted'] != null ? CashflowDataFormatted.fromJson(json['formatted']) : null,
    );
}

class CashflowDataCashflow {
  num? operatingCashFlow;
  num? capitalExpenditures;
  num? investingCashFlow;
  num? financingCashFlow;
  num? dividendsPaid;
  num? shareRepurchases;
  num? freeCashFlow;

  CashflowDataCashflow({
    this.operatingCashFlow,
    this.capitalExpenditures,
    this.investingCashFlow,
    this.financingCashFlow,
    this.dividendsPaid,
    this.shareRepurchases,
    this.freeCashFlow,
  });

  factory CashflowDataCashflow.fromJson(Map<String, dynamic> json) => CashflowDataCashflow(
      operatingCashFlow: json['operatingCashFlow'],
      capitalExpenditures: json['capitalExpenditures'],
      investingCashFlow: json['investingCashFlow'],
      financingCashFlow: json['financingCashFlow'],
      dividendsPaid: json['dividendsPaid'],
      shareRepurchases: json['shareRepurchases'],
      freeCashFlow: json['freeCashFlow'],
    );
}

class CashflowDataMetrics {
  num? fcfMargin;
  num? operatingCashFlowMargin;
  num? capexToRevenue;
  num? cashFlowToNetIncome;
  num? dividendPayoutRatio;
  num? fcfPerShare;

  CashflowDataMetrics({
    this.fcfMargin,
    this.operatingCashFlowMargin,
    this.capexToRevenue,
    this.cashFlowToNetIncome,
    this.dividendPayoutRatio,
    this.fcfPerShare,
  });

  factory CashflowDataMetrics.fromJson(Map<String, dynamic> json) => CashflowDataMetrics(
      fcfMargin: json['fcfMargin'],
      operatingCashFlowMargin: json['operatingCashFlowMargin'],
      capexToRevenue: json['capexToRevenue'],
      cashFlowToNetIncome: json['cashFlowToNetIncome'],
      dividendPayoutRatio: json['dividendPayoutRatio'],
      fcfPerShare: json['fcfPerShare'],
    );
}

class CashflowDataFormatted {
  String? operatingCashFlow;
  String? freeCashFlow;
  String? capitalExpenditures;

  CashflowDataFormatted({
    this.operatingCashFlow,
    this.freeCashFlow,
    this.capitalExpenditures,
  });

  factory CashflowDataFormatted.fromJson(Map<String, dynamic> json) => CashflowDataFormatted(
      operatingCashFlow: json['operatingCashFlow'],
      freeCashFlow: json['freeCashFlow'],
      capitalExpenditures: json['capitalExpenditures'],
    );
}

class CashflowRequest {
  String ticker;
  int? year;
  int? quarter;

  CashflowRequest({
    required this.ticker,
    this.year,
    this.quarter,
  });

  Map<String, dynamic> toJson() => {
      'ticker': ticker,
      if (year != null) 'year': year,
      if (quarter != null) 'quarter': quarter,
    };
}
