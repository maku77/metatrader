#property copyright "maku77"
#property link "https://maku77.github.io/"
#property version "1.00"
#property strict

namespace Util {
    /** 指定したシンボル（あるいはカレントシンボル）の Ask 値を取得します。 */
    double Ask(string symbol=NULL) {
        if (symbol == NULL) symbol = _Symbol;
        MqlTick tick;
        SymbolInfoTick(symbol, tick);
        return tick.ask;
    }

    /** 指定したシンボル（あるいはカレントシンボル）の Bid 値を取得します。 */
    double Bid(string symbol=NULL) {
        if (symbol == NULL) symbol = _Symbol;
        MqlTick tick;
        SymbolInfoTick(symbol, tick);
        return tick.bid;
    }

    /**
     * プログラムがデモ口座で実行されているか調べ、そうでなければ警告を表示します。
     */
    bool IsDemoAccount() {
        if (AccountInfoInteger(ACCOUNT_TRADE_MODE) == ACCOUNT_TRADE_MODE_DEMO) {
            return true;
        }
        Alert("Operation is not allowed on a live account!");
        return false;
    }

    /**
     * 指定したシンボルで選択可能なフィル・ポリシーをひとつ返します。
     * 優先度は IOC、FOK、RETURN の順です（IOC が有効なら IOC を返す）。
     */
    ENUM_ORDER_TYPE_FILLING SelectFillPolicy(string symbol) {
        long modes = SymbolInfoInteger(symbol, SYMBOL_FILLING_MODE);
        if ((modes & SYMBOL_FILLING_IOC) != 0) return ORDER_FILLING_IOC;
        if ((modes & SYMBOL_FILLING_FOK) != 0) return ORDER_FILLING_FOK;
        return ORDER_FILLING_RETURN;
    }

    /**
     * 指定したマジックナンバーで入っている注文の数を調べます。
     */
    int GetOrdersTotalByMagic(long magic) {
        const int total = OrdersTotal();
        int totalByMagic = 0;
        for (int i = 0; i < total; i++) {
            OrderGetTicket(i);
            if (OrderGetInteger(ORDER_MAGIC) == magic) {
                totalByMagic += 1;
            }
        }
        return totalByMagic;
    }

    /** Returns trade server return code description. */
    string TradeServerReturnCodeDescription(int returnCode) {
        switch (returnCode) {
            case TRADE_RETCODE_REQUOTE:            return "Requote";
            case TRADE_RETCODE_REJECT:             return "Request rejected";
            case TRADE_RETCODE_CANCEL:             return "Request canceled by trader";
            case TRADE_RETCODE_PLACED:             return "Order placed";
            case TRADE_RETCODE_DONE:               return "Request completed";
            case TRADE_RETCODE_DONE_PARTIAL:       return "Only part of the request was completed";
            case TRADE_RETCODE_ERROR:              return "Request processing error";
            case TRADE_RETCODE_TIMEOUT:            return "Request canceled by timeout";
            case TRADE_RETCODE_INVALID:            return "Invalid request";
            case TRADE_RETCODE_INVALID_VOLUME:     return "Invalid volume in the request";
            case TRADE_RETCODE_INVALID_PRICE:      return "Invalid price in the request";
            case TRADE_RETCODE_INVALID_STOPS:      return "Invalid stops in the request";
            case TRADE_RETCODE_TRADE_DISABLED:     return "Trade is disabled";
            case TRADE_RETCODE_MARKET_CLOSED:      return "Market is closed";
            case TRADE_RETCODE_NO_MONEY:           return "There is not enough money to complete the request";
            case TRADE_RETCODE_PRICE_CHANGED:      return "Prices changed";
            case TRADE_RETCODE_PRICE_OFF:          return "There are no quotes to process the request";
            case TRADE_RETCODE_INVALID_EXPIRATION: return "Invalid order expiration date in the request";
            case TRADE_RETCODE_ORDER_CHANGED:      return "Order state changed";
            case TRADE_RETCODE_TOO_MANY_REQUESTS:  return "Too frequent requests";
            case TRADE_RETCODE_NO_CHANGES:         return "No changes in request";
            case TRADE_RETCODE_SERVER_DISABLES_AT: return "Autotrading disabled by server";
            case TRADE_RETCODE_CLIENT_DISABLES_AT: return "Autotrading disabled by client terminal";
            case TRADE_RETCODE_LOCKED:             return "Request locked for processing";
            case TRADE_RETCODE_FROZEN:             return "Order or position frozen";
            case TRADE_RETCODE_INVALID_FILL:       return "Invalid order filling type";
            case TRADE_RETCODE_CONNECTION:         return "No connection with the trade server";
            case TRADE_RETCODE_ONLY_REAL:          return "Operation is allowed only for live accounts";
            case TRADE_RETCODE_LIMIT_ORDERS:       return "The number of pending orders has reached the limit";
            case TRADE_RETCODE_LIMIT_VOLUME:       return "The volume of orders and positions for the symbol has reached the limit";
        }
        return "Invalid return code of the trade server";
    }

}
