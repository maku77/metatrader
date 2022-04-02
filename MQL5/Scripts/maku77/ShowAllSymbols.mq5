#property copyright "maku77"
#property link      "https://maku77.github.io"
#property version   "1.00"
#property strict

#include <Arrays\ArrayString.mqh> // CArrayString
#include <maku77\StrUtil.mqh>

/** スクリプトのエントリポイント */
void OnStart() {
    CArrayString names;
    getAllSymbolNames(names, false);
    ::MessageBox(StrUtil::Join(names));  
}

/**
 * すべてのシンボル名を取得します。
 *
 * @param symbols このバッファにシンボル名が格納されます
 * @param onlyInMarketWatch  「気配値表示」内のシンボルに限定するのであれば true
 */
int getAllSymbolNames(CArrayString& names, bool onlyInMarketWatch=true) {
    int n = ::SymbolsTotal(onlyInMarketWatch);
    names.Resize(n);
    for (int i = 0; i < n; ++i) {
        names.Add(::SymbolName(i, onlyInMarketWatch));
    }
    names.Sort();
    return n;
}
