#property copyright "maku77"
#property link "https://maku77.github.io/"
#property version "1.00"
#property strict

string getPositionInfoStr() {
    // ポジションのシンボル名（"USDJPY" など）
    string symbol = PositionGetString(POSITION_SYMBOL);
    // ポジションのコメント（オプショナル）
    string comment = PositionGetString(POSITION_COMMENT);
    // 外部の取引システム（取引所）におけるポジション ID
    string externalId = PositionGetString(POSITION_EXTERNAL_ID);

    string s;
    StringConcatenate(s,
        "POSITION_SYMBOL = ", symbol,
        "\nPOSITION_COMMENT = ", comment,
        "\nPOSITION_EXTERNAL_ID = ", externalId
    );
    return s;
}

string getPositionInfoInteger() {
    // ポジションのチケット番号（MqlTradeRequest.position で使う）
    long ticket = PositionGetInteger(POSITION_TICKET);
    // リオープンされても変化しないポジションの ID
    long identifier = PositionGetInteger(POSITION_IDENTIFIER);
    // ポジションをオープンした日時の datetime 値
    datetime time = (datetime) PositionGetInteger(POSITION_TIME);
    // ポジションをオープンした日時の　1970 年からの経過ミリ秒
    long timeMsc = PositionGetInteger(POSITION_TIME_MSC);
    // ポジションの最終更新日時の datetime 値
    datetime timeUpdate = (datetime) PositionGetInteger(POSITION_TIME_UPDATE);
    // ポジションの最終更新日時の 1970 年からの経過ミリ秒
    long timeUpdateMsc = PositionGetInteger(POSITION_TIME_UPDATE_MSC);
    // ポジションの種類
    ENUM_POSITION_TYPE type = (ENUM_POSITION_TYPE) PositionGetInteger(POSITION_TYPE);
    // ポジションの EA マジックナンバー
    long magic = PositionGetInteger(POSITION_MAGIC);
    // ポジションが何によって作られたか（モバイルアプリ、EAなど）
    ENUM_POSITION_REASON reason = (ENUM_POSITION_REASON) PositionGetInteger(POSITION_REASON);

    string s;
    StringConcatenate(s,
        "POSITION_TICKET = ", ticket,
        "\nPOSITION_IDENTIFIER = ", identifier,
        "\nPOSITION_TIME = ", time,
        "\nPOSITION_TIME_MSC = ", timeMsc,
        "\nPOSITION_TIME_UPDATE = ", timeUpdate,
        "\nPOSITION_TIME_UPDATE_MSC = ", timeUpdateMsc,
        "\nPOSITION_TYPE = ", type, " (", EnumToString(type), ")",
        "\nPOSITION_MAGIC = ", magic,
        "\nPOSITION_REASON = ", reason, " (", EnumToString(reason), ")"
    );
    return s;
}

string getPositionInfoDouble() {
    // ポジションのボリューム（ロット数）
    double volume = PositionGetDouble(POSITION_VOLUME);
    // ポジションオープン時の価格
    double priceOpen = PositionGetDouble(POSITION_PRICE_OPEN);
    // 対象シンボルの現在価格
    double priceCurrent = PositionGetDouble(POSITION_PRICE_CURRENT);
    // ポジションの損切価格 (Stop loss level)
    double sl = PositionGetDouble(POSITION_SL);
    // ポジションの利確価格 (Take profit level)
    double tp = PositionGetDouble(POSITION_TP);
    // このポジションでの損益
    double profit = PositionGetDouble(POSITION_PROFIT);
    // このポジションでの累積スワップ
    double swap = PositionGetDouble(POSITION_SWAP);

    // ポジションの価格を小数点数以下何桁まで表示すればいいか
    int symbolDigits = (int) SymbolInfoInteger(PositionGetString(POSITION_SYMBOL), SYMBOL_DIGITS);
    // 損益と累積スワップをどの通貨で表示すればいいか
    string accountCurrency = AccountInfoString(ACCOUNT_CURRENCY);
    int accountDigits = (int) AccountInfoInteger(ACCOUNT_CURRENCY_DIGITS);

    string s;
    StringConcatenate(s,
        "POSITION_VOLUME = ", volume,
        "\nPOSITION_PRICE_OPEN = ", DoubleToString(priceOpen, symbolDigits),
        "\nPOSITION_PRICE_CURRENT = ", DoubleToString(priceCurrent, symbolDigits),
        "\nPOSITION_SL = ", sl,
        "\nPOSITION_TP = ", tp,
        "\nPOSITION_PROFIT = ", DoubleToString(profit, accountDigits), " ", accountCurrency,
        "\nPOSITION_SWAP = ", DoubleToString(swap, accountDigits), " ", accountCurrency
    );
    return s;
}

void showPositionInfo(int posIndex) {
    // ポジションを選択状態にする
    if (PositionGetSymbol(posIndex) == "") {
        Alert("インデックス ", posIndex, " のポジションの選択に失敗しました");
        return;
    }

    // 選択したポジションの内容を表示
    string msg = StringFormat("%s\n%s\n%s",
        getPositionInfoStr(),
        getPositionInfoInteger(),
        getPositionInfoDouble()
    );
    MessageBox(msg, StringFormat("Position[%d]", posIndex));
}

void OnStart() {
    const int total = PositionsTotal();
    if (total == 0) {
        MessageBox("ポジションはありません");
        return;
    }
    for (int i = 0; i < total + 1; i++) {
        showPositionInfo(i);
    }
}
