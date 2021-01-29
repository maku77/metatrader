#property copyright "maku77"
#property link "https://maku77.github.io/"
#property version "1.00"
#property strict

namespace Util {
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
}
