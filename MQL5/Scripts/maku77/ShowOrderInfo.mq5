#property copyright "maku77"
#property link "https://maku77.github.io/"
#property version "1.00"
#property strict

// 文字列系の待機注文情報を文字列にして返します。
string getOrderInfoStr() {
    // 注文対処のシンボル（銘柄）
    string symbol = OrderGetString(ORDER_SYMBOL);
    // 注文につけられたコメント
    string comment = OrderGetString(ORDER_COMMENT);

    string s;
    StringConcatenate(s,
        "ORDER_SYMBOL = ", symbol,
        "\nORDER_COMMENT = ", comment
    );
    return s;
}

// 整数系の待機注文情報を文字列にして返します。
string getOrderInfoInteger() {
    // 注文のチケット番号
    long ticket = OrderGetInteger(ORDER_TICKET);
    // 注文の種類（ORDER_TYPE_BUY_LIMIT など）
    ENUM_ORDER_TYPE type = (ENUM_ORDER_TYPE) OrderGetInteger(ORDER_TYPE);
    // 注文状態（ORDER_STATE_PLACED など）
    ENUM_ORDER_STATE state = (ENUM_ORDER_STATE) OrderGetInteger(ORDER_STATE);
    // 注文のフィル・ポリシー（ORDER_FILLING_RETURN など）
    ENUM_ORDER_TYPE_FILLING typeFilling = (ENUM_ORDER_TYPE_FILLING) OrderGetInteger(ORDER_TYPE_FILLING);
    // 注文の設定日時（datetime 値）
    datetime timeSetup = (datetime) OrderGetInteger(ORDER_TIME_SETUP);
    // 注文の設定日時（1970年からの経過ミリ秒）
    long timeSetupMsc = OrderGetInteger(ORDER_TIME_SETUP_MSC);
    // 注文の実行及びキャンセル日時（datetime 値）
    datetime timeDone = (datetime) OrderGetInteger(ORDER_TIME_DONE);
    // 注文の実行及びキャンセル日時（1970年からの経過ミリ秒）
    long timeDoneMsc = OrderGetInteger(ORDER_TIME_DONE_MSC);
    // 注文期限の種類（ORDER_TIME_GTC など）
    ENUM_ORDER_TYPE_TIME typeTime = (ENUM_ORDER_TYPE_TIME) OrderGetInteger(ORDER_TYPE_TIME);
    // 注文期限の日時
    datetime timeExpiration = (datetime) OrderGetInteger(ORDER_TIME_EXPIRATION);
    // 注文時に指定した EA マジックナンバー
    long magic = OrderGetInteger(ORDER_MAGIC);
    // 注文の理由またはソース（ORDER_REASON_CLIENT など）
    ENUM_ORDER_REASON reason = (ENUM_ORDER_REASON) OrderGetInteger(ORDER_REASON);
    // 実行後すぐに注文に設定される不変のポジション識別子
    long positionId = OrderGetInteger(ORDER_POSITION_ID);
    // 反対注文 (ORDER_TYPE_CLOSE_BY) 時の反対ポジションの識別子
    long positionById = OrderGetInteger(ORDER_POSITION_BY_ID);

    string s;
    StringConcatenate(s,
        "ORDER_TICKET = ", ticket,
        "\nORDER_TYPE = ", type, " (", EnumToString(type), ")",
        "\nORDER_STATE = ", state, " (", EnumToString(state), ")",
        "\nORDER_TYPE_FILLING = ", typeFilling, " (", EnumToString(typeFilling), ")",
        "\nORDER_TIME_SETUP = ", timeSetup,
        "\nORDER_TIME_SETUP_MSC = ", timeSetupMsc,
        "\nORDER_TIME_DONE = ", timeDone,
        "\nORDER_TIME_DONE_MSC = ", timeDoneMsc,
        "\nORDER_TYPE_TIME = ", typeTime, " (", EnumToString(typeTime), ")",
        "\nORDER_TIME_EXPIRATION = ", timeExpiration,
        "\nORDER_MAGIC = ", magic,
        "\nORDER_REASON = ", reason, " (", EnumToString(reason), ")",
        "\nORDER_POSITION_ID = ", positionId,
        "\nORDER_POSITION_BY_ID = ", positionById
    );
    return s;
}

// 浮動小数点数系の待機注文情報を文字列にして返します。
string getOrderInfoDouble() {
    // 初期の注文ボリューム（ロット数）
    double volumeInitial = OrderGetDouble(ORDER_VOLUME_INITIAL);
    // 現在の注文ボリューム（ロット数）
    double volumeCurrent = OrderGetDouble(ORDER_VOLUME_CURRENT);
    // 注文時に指定された価格
    double priceOpen = OrderGetDouble(ORDER_PRICE_OPEN);
    // 注文シンボルの現在の価格
    double priceCurrent = OrderGetDouble(ORDER_PRICE_CURRENT);
    // ストップリミット注文の場合の指値注文価格
    double priceStoplimit = OrderGetDouble(ORDER_PRICE_STOPLIMIT);
    // 損切用の逆指値価格
    double sl = OrderGetDouble(ORDER_SL);
    // 利確用の指値価格
    double tp = OrderGetDouble(ORDER_TP);

    string s;
    StringConcatenate(s,
        "ORDER_VOLUME_INITIAL = ", volumeInitial,
        "\nORDER_VOLUME_CURRENT = ", volumeCurrent,
        "\nORDER_PRICE_OPEN = ", priceOpen,
        "\nORDER_PRICE_CURRENT = ", priceCurrent,
        "\nORDER_PRICE_STOPLIMIT = ", priceStoplimit,
        "\nORDER_SL = ", sl,
        "\nORDER_TP = ", tp
    );
    return s;
}

void showOrderInfo(int orderIndex) {
    // 待機注文を選択状態にする
    if (OrderGetTicket(orderIndex) == 0) {
        Alert("インデックス ", orderIndex, " の待機注文の選択に失敗しました");
        return;
    }

    // 選択した待機注文の情報を表示
    string msg = StringFormat("%s\n%s\n%s",
        getOrderInfoStr(),
        getOrderInfoInteger(),
        getOrderInfoDouble()
    );
    //MessageBox(msg, StringFormat("Order[%d]", orderIndex));
    Alert(msg);
}

void OnStart() {
    const int total = OrdersTotal();
    if (total == 0) {
        MessageBox("待機注文はありません");
        return;
    }
    for (int i = 0; i < total; i++) {
        showOrderInfo(i);
    }
}
