#property copyright "maku77"
#property link "https://maku77.github.io/"
#property version "1.00"
#property strict

void OnStart() {
    int total = OrdersTotal();
    if (total == 0) {
        MessageBox("No orders");
    } else {
        MessageBox(StringFormat("OrdersTotal = %d", total));
    }
}
