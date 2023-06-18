#property strict
#property copyright "maku77"
#property link "https://toushi.maku.blog/p/85rz2xr/"
#property version "1.00"

void OnStart() {
    MessageBox(
        "Language=" + TerminalInfoString(TERMINAL_LANGUAGE)
        + "\nCompany=" + TerminalInfoString(TERMINAL_COMPANY)
        + "\nName=" + TerminalInfoString(TERMINAL_NAME)
        + "\nPath=" + TerminalInfoString(TERMINAL_PATH)
        + "\nDataPath=" + TerminalInfoString(TERMINAL_DATA_PATH)
        + "\nCommonDataPath=" + TerminalInfoString(TERMINAL_COMMONDATA_PATH)
    );
}
