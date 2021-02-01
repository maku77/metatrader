// Returns trade server return code description.
string TradeServerReturnCodeDescription(int return_code) {
    switch (return_code) {
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

