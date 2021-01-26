#property copyright "maku77"
#property link "https://maku77.github.io/"
#property version "1.00"
#property strict

namespace Util {
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
