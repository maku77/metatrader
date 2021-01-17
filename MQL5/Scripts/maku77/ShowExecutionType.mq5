#property copyright "maku77"
#property link "https://maku77.github.io/"
#property version "1.00"
#property strict

/**
 * 現在のシンボルの注文執行方式を文字列で取得します。
 */
string getExecutionModeStr() {
    ENUM_SYMBOL_TRADE_EXECUTION mode =
        (ENUM_SYMBOL_TRADE_EXECUTION) SymbolInfoInteger(Symbol(), SYMBOL_TRADE_EXEMODE);
    string jp;
    switch (mode) {
        case SYMBOL_TRADE_EXECUTION_MARKET:
            jp = "カウントダウン方式";
            break;
        case SYMBOL_TRADE_EXECUTION_INSTANT:
            jp = "成行方式";
            break;
        case SYMBOL_TRADE_EXECUTION_EXCHANGE:
            jp = "エクスチェンジ方式";
            break;
        case SYMBOL_TRADE_EXECUTION_REQUEST:
            jp = "リクエスト方式";
            break;
        default:
            jp = "不明な方式";
            break;
    }
    return StringFormat("%s (%s)", jp, EnumToString(mode));
}

void OnStart() {
    MessageBox(getExecutionModeStr());
}
