declare module '@apiverve/cashflow' {
  export interface cashflowOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface cashflowResponse {
    status: string;
    error: string | null;
    data: CashFlowStatementData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface CashFlowStatementData {
      ticker:        null | string;
      company:       null | string;
      cik:           null | string;
      fiscalYear:    number | null;
      fiscalQuarter: number | null;
      filingType:    null | string;
      filingDate:    Date | null;
      periodEnd:     Date | null;
      cashFlow:      CashFlow;
      metrics:       Metrics;
      formatted:     Formatted;
  }
  
  interface CashFlow {
      operatingCashFlow:   number | null;
      capitalExpenditures: number | null;
      investingCashFlow:   number | null;
      financingCashFlow:   number | null;
      dividendsPaid:       number | null;
      shareRepurchases:    number | null;
      freeCashFlow:        number | null;
  }
  
  interface Formatted {
      operatingCashFlow:   null | string;
      freeCashFlow:        null | string;
      capitalExpenditures: null | string;
  }
  
  interface Metrics {
      fcfMargin:               number | null;
      operatingCashFlowMargin: number | null;
      capexToRevenue:          number | null;
      cashFlowToNetIncome:     number | null;
      dividendPayoutRatio:     number | null;
      fcfPerShare:             number | null;
  }

  export default class cashflowWrapper {
    constructor(options: cashflowOptions);

    execute(callback: (error: any, data: cashflowResponse | null) => void): Promise<cashflowResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: cashflowResponse | null) => void): Promise<cashflowResponse>;
    execute(query?: Record<string, any>): Promise<cashflowResponse>;
  }
}
