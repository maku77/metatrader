#property copyright "maku77"
#property link "https://maku77.github.io"

#include <Arrays\ArrayString.mqh> // CArrayString
#include <Strings\String.mqh> // CString

namespace StrUtil {
    /** 文字列配列を結合して 1 つの文字列にします。 */
    string Join(const CArrayString& strArr, const string delim=", ") {
        CString s;
        const uint n = strArr.Total();
        for (uint i = 0;;) {
          s.Append(strArr.At(i));
          if (++i >= n) break;
          s.Append(delim);
        }
        return s.Str();
    }
}