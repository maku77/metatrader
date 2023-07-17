/**
 * Print all indicator events.
 */
#property copyright "maku77"
#property link      "https://toushi.maku.blog"
#property version   "1.00"
#property strict
#property indicator_chart_window
#property indicator_plots 0  // Surpress "no indicator plot" warning

int OnInit() {
    Print("OnInit()");
    EventSetTimer(10);  // Call OnTimer() every 10 seconds
    return INIT_SUCCEEDED;
}

void OnDeinit(const int reason) {
    string s = "";
    switch (reason) {
        case REASON_PROGRAM: s = "REASON_PROGRAM"; break; // 0
        case REASON_REMOVE: s = "REASON_REMOVE"; break; // 1
        case REASON_RECOMPILE: s = "REASON_RECOMPILE"; break; // 2
        case REASON_CHARTCHANGE: s = "REASON_CHARTCHANGE"; break; // 3 
        case REASON_CHARTCLOSE: s = "REASON_CHARTCLOSE"; break; // 4
        case REASON_PARAMETERS: s = "REASON_PARAMETERS"; break; // 5
        case REASON_ACCOUNT: s = "REASON_ACCOUNT"; break; // 6
        case REASON_TEMPLATE: s = "REASON_TEMPLATE"; break; // 7
        case REASON_INITFAILED: s = "REASON_INITFAILED"; break; // 8
        case REASON_CLOSE: s = "REASON_CLOSE"; break; // 9
        default: s = "UNKNOWN"; break;
    }
    PrintFormat("OnDeinit(reason=%s(%d))", s, reason);
    EventKillTimer();
}

int OnCalculate(
    const int rates_total,
    const int prev_calculated,
    const int begin,
    const double &price[]
) {
    PrintFormat("OnCalculate(rates_total=%d, prev_calculated=%d, begin=%d, price[0]=%f)",
        rates_total, prev_calculated, begin, price[0]);
    return rates_total;
}

void OnTimer() {
    Print("OnTimer()");
}

void OnChartEvent(
    const int id,
    const long &lparam,
    const double &dparam,
    const string &sparam
) {
    PrintFormat("OnChartEvent(id=%d, lparam=%lld, dparam=%f, sparam=%s)",
        id, lparam, dparam, sparam);
}

void OnBookEvent(const string& symbol) {
    PrintFormat("OnBookEvent(symbol=%s)", symbol);
}
