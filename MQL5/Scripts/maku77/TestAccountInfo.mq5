#property copyright "maku77"
#property link "https://maku77.github.io/"
#property version "1.00"
#property strict

string getAccountInfoStr() {
    // 口座番号
    long login = AccountInfoInteger(ACCOUNT_LOGIN);
    // 口座取引モード
    ENUM_ACCOUNT_TRADE_MODE tradeMode = (ENUM_ACCOUNT_TRADE_MODE) AccountInfoInteger(ACCOUNT_TRADE_MODE);
    // 口座レバレッジ
    long leverage = AccountInfoInteger(ACCOUNT_LEVERAGE);
    // アクティブな未決注文の最大許容数
    long limitOrders = AccountInfoInteger(ACCOUNT_LIMIT_ORDERS);
    // 許容された最小証拠金を設定するモード
    ENUM_ACCOUNT_STOPOUT_MODE marginSoMode = (ENUM_ACCOUNT_STOPOUT_MODE) AccountInfoInteger(ACCOUNT_MARGIN_SO_MODE);
    // 口座で取引が許可されているか
    bool tradeAllowed = AccountInfoInteger(ACCOUNT_TRADE_ALLOWED);
    // エキスパートアドバイザーで取引が許可されているか
    bool tradeExpert = AccountInfoInteger(ACCOUNT_TRADE_EXPERT);
    // 証拠金計算モード
    ENUM_ACCOUNT_MARGIN_MODE marginMode = (ENUM_ACCOUNT_MARGIN_MODE) AccountInfoInteger(ACCOUNT_MARGIN_MODE);
    // 取引結果を正確に表示するために必要な口座通貨の小数点以下の桁数
    int currencyDigits = (int) AccountInfoInteger(ACCOUNT_CURRENCY_DIGITS);
    // FIFOルールによってのみポジションを決済できることを示す
    bool fifoClose = AccountInfoInteger(ACCOUNT_FIFO_CLOSE);

    string s;
    StringConcatenate(s, "----- AccountInfoInteger -----"
        "\nACCOUNT_LOGIN = ", login,
        "\nACCOUNT_TRADE_MODE = ", tradeMode, " (", EnumToString(tradeMode), ")",
        "\nACCOUNT_LEVERAGE = ", leverage,
        "\nACCOUNT_LIMIT_ORDERS = ", limitOrders,
        "\nACCOUNT_MARGIN_SO_MODE = ", marginSoMode, " (", EnumToString(marginSoMode), ")",
        "\nACCOUNT_TRADE_ALLOWED = ", tradeAllowed,
        "\nACCOUNT_TRADE_EXPERT = ", tradeExpert,
        "\nACCOUNT_MARGIN_MODE = ", marginMode, " (", EnumToString(marginMode), ")",
        "\nACCOUNT_CURRENCY_DIGITS = ", currencyDigits,
        "\nACCOUNT_FIFO_CLOSE = ", fifoClose
    );
    return s;
}

string getAccountInfoDouble() {
    // 証拠金残高（円）
    double balance = AccountInfoDouble(ACCOUNT_BALANCE);
    // 信用額（円）
    double credit = AccountInfoDouble(ACCOUNT_CREDIT);
    // 損益（円）
    double profit = AccountInfoDouble(ACCOUNT_PROFIT);
    // 純資産（証拠金残高 - 損益）（円）
    double equity = AccountInfoDouble(ACCOUNT_EQUITY);
    // 必要証拠金（円）
    double margin = AccountInfoDouble(ACCOUNT_MARGIN);
    // 有効証拠金（円）
    double marginFree = AccountInfoDouble(ACCOUNT_MARGIN_FREE);
    // 証拠金維持率（％）
    double marginLevel = AccountInfoDouble(ACCOUNT_MARGIN_LEVEL);
    // マージンコール値（ACCOUNT_MARGIN_SO_MODE によってパーセントまたは預金通貨）
    double marginSoCall = AccountInfoDouble(ACCOUNT_MARGIN_SO_CALL);
    // 強制ロスカット値（ACCOUNT_MARGIN_SO_MODE によってパーセントまたは預金通貨）
    double marginSoSo = AccountInfoDouble(ACCOUNT_MARGIN_SO_SO);
    // 当初証拠金（全ての未決注文の証拠金をカバーするために口座内でリザーブされた額）
    double marginInitial = AccountInfoDouble(ACCOUNT_MARGIN_INITIAL);
    // 維持証拠金（全ての未決済ポジションの最小額をカバーするために口座内でリザーブされた最低資本金）
    double marginMaintenance = AccountInfoDouble(ACCOUNT_MARGIN_MAINTENANCE);
    // 流動資産？
    double assets = AccountInfoDouble(ACCOUNT_ASSETS);
    // 流動負債？
    double liabilities = AccountInfoDouble(ACCOUNT_LIABILITIES);
    // 拘束された手数料の額
    double commissionBlocked = AccountInfoDouble(ACCOUNT_COMMISSION_BLOCKED);

    // 文字列に結合して返す
    int digits = (int) AccountInfoInteger(ACCOUNT_CURRENCY_DIGITS);
    int soDigits = AccountInfoInteger(ACCOUNT_MARGIN_SO_MODE) == ACCOUNT_STOPOUT_MODE_PERCENT ? 1 : digits;
    string s;
    StringConcatenate(s, "----- AccountInfoDouble -----",
        "\nACCOUNT_BALANCE = ", DoubleToString(balance, digits),
        "\nACCOUNT_CREDIT = ", DoubleToString(credit, digits),
        "\nACCOUNT_PROFIT = ", DoubleToString(profit, digits),
        "\nACCOUNT_EQUITY = ", DoubleToString(equity, digits),
        "\nACCOUNT_MARGIN = ", DoubleToString(margin, digits),
        "\nACCOUNT_MARGIN_FREE = ", DoubleToString(marginFree, digits),
        "\nACCOUNT_MARGIN_LEVEL = ", DoubleToString(marginLevel, 1),
        "\nACCOUNT_MARGIN_SO_CALL = ", DoubleToString(marginSoCall, soDigits),
        "\nACCOUNT_MARGIN_SO_SO = ", DoubleToString(marginSoSo, soDigits),
        "\nACCOUNT_MARGIN_INITIAL = ", DoubleToString(marginInitial, digits),
        "\nACCOUNT_MARGIN_MAINTENANCE = ", DoubleToString(marginMaintenance, digits),
        "\nACCOUNT_ASSETS = ", DoubleToString(assets, digits),
        "\nACCOUNT_LIABILITIES = ", DoubleToString(liabilities, digits),
        "\nACCOUNT_COMMISSION_BLOCKED = ", DoubleToString(commissionBlocked, digits)
    );
    return s;
}

string getAccountInfoString() {
    // クライアント名
    string name = AccountInfoString(ACCOUNT_NAME);
    // 取引サーバー名
    string server = AccountInfoString(ACCOUNT_SERVER);
    // 口座の通貨名
    string currency = AccountInfoString(ACCOUNT_CURRENCY);
    // 口座を提供している会社名
    string company = AccountInfoString(ACCOUNT_COMPANY);

    return "---- AccountInfoString ----" +
        "\nACCOUNT_NAME = " + name +
        "\nACCOUNT_SERVER = " + server +
        "\nACCOUNT_CURRENCY = " + currency +
        "\nACCOUNT_COMPANY = " + company;
}

void OnStart() {
    Comment(getAccountInfoStr() + "\n\n" +
        getAccountInfoDouble() + "\n\n" +
        getAccountInfoString());
}
