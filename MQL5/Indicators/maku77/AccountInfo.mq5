/*
 * Show account information as comment.
 */
#property copyright "maku77"
#property link "https://maku77.github.io/"
#property version "1.00"
#property strict
#property indicator_chart_window
#property indicator_plots 0 // Surpress "no indicator plot" warning

int OnInit() {
    return INIT_SUCCEEDED;
}

void ShowAccountInfo() {
    string currency = AccountInfoString(ACCOUNT_CURRENCY);
    double balance = AccountInfoDouble(ACCOUNT_BALANCE);
    double profit = AccountInfoDouble(ACCOUNT_PROFIT);
    double equity = AccountInfoDouble(ACCOUNT_EQUITY);
    double marginLevel = AccountInfoDouble(ACCOUNT_MARGIN_LEVEL);
    double margin = AccountInfoDouble(ACCOUNT_MARGIN);
    double freeMargin = AccountInfoDouble(ACCOUNT_MARGIN_FREE);

    string s = "";
    StringAdd(s, StringFormat("\nBalance: %.0f %s", balance, currency));
    StringAdd(s, StringFormat("\nProfit: %.0f", profit));
    StringAdd(s, StringFormat("\nEquity: %.0f", equity));
    StringAdd(s, "\n");
    StringAdd(s, StringFormat("\nMargin level: %.2f%%", marginLevel));
    StringAdd(s, StringFormat("\nMargin: %.0f", margin));
    StringAdd(s, StringFormat("\nFree margin: %.0f", freeMargin));
    Comment(s);
}

int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[]) {
    ShowAccountInfo();
    return rates_total;
}
