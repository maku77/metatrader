#property copyright "maku77"
#property link "https://maku77.github.io/"
#property version "1.00"
#property strict

/** MQL プログラム作成中に使うデバッグ用関数群です。 */
namespace Debug {
    /*
     * EA の OnChartEvent 関数に渡されたパラメータの内容を出力します。
     */
    void PrintOnChartEvent(int id, long lparam, double dparam, const string& sparam) {
        string eventName;
        if (CHARTEVENT_CUSTOM <= id && id <= CHARTEVENT_CUSTOM_LAST) {
            eventName = "CUSTOM";
        } else {
            eventName = EnumToString(ENUM_CHART_EVENT(id));
        }
        printf("OnChartEvent: id=%d(%s), lparam=%I64d, dparam=%.1f, sparam=%s",
            id, eventName, lparam, dparam, sparam);
    }

    /*
     * MqlTradeRequest 構造体の内容を出力します。
     */
    void DumpTradeRequest(const MqlTradeRequest& request) {
        string s;
        StringConcatenate(s,
            "MqlTradeRequest {\n",
            "Not implemented yet"
        );
        MessageBox(s);
    }

    /*
     * MqlTradeResult 構造体の内容を出力します。
     */
    void DumpTradeResult(const MqlTradeResult& r) {
        string s;
        StringConcatenate(s,
            "MqlTradeResult {\n",
            "  uint request_id = ", r.request_id, ",\n",  // Request ID set by the terminal during the dispatch
            "  uint retcode = ", r.retcode, ",\n",  // Return code of a trade server
            "  string comment = ", r.comment, ",\n",  // Broker comment to operation
            "  uint retcode_external = ", r.retcode_external, ",\n",  // Return code of an external trading system
            "  ulong order = ", r.order, ",\n",  // Order ticket, if it is placed
            "  ulong deal = ", r.deal, ",\n",  // Deal ticket, if it is performed
            "  double volume = ", r.volume, ",\n",  // Deal volume, confirmed by broker
            "  double price = ", r.price, ",\n",  // Deal price, confirmed by broker
            "  double bid = ", r.bid, ",\n",  // Current Bid price
            "  double ask = ", r.ask, ",\n",  // Current Ask price
            "}"
        );
        MessageBox(s);
    }
}
