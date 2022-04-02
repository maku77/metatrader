metatrader
====

MetaTrader による自動トレード用のエキスパートアドバイザおよびカスタムインジケータです。


インストール方法
----

### ソースコードのクローン

```
cd /d D:\gitwork
git clone https://github.com/maku77/metatrader
```

### MT5 から参照できるようにする

MetaTrader のデータディレクトリから、シンボリックリンクを張ることで、各ソースコードを参照できるようにします。
シンボリックリンクの作成は、`create-symlinks` バッチファイルで自動化してあります。
バッチファイルのパラメータとして、MetaTrader のデータディレクトリのパスを指定してください（MetaTrader 上で `Ctrl+Shift+D` で確認できます）。

シンボリックリンクの作成に管理者権限が必要になるので、__`Win + R`__ → __`cmd`__ → __`Ctrl + Shift + Enter`__ でコマンドプロンプトを起動します。

```console
cd /d D:\gitwork\metatrader
create-symlinks C:\Users\maku\AppData\Roaming\MetaQuotes\Terminal\84E63...30A1E
```

`create-symlinks` バッチファイルを実行することにより、次のようにシンボリックリンクが張られます。

```
<DataDir>\MQL5\Experts\maku77    → <GitDir>\MQL5\Experts\maku77
<DataDir>\MQL5\Images\maku77     → <GitDir>\MQL5\Images\maku77
<DataDir>\MQL5\Include\maku77    → <GitDir>\MQL5\Include\maku77
<DataDir>\MQL5\Indicators\maku77 → <GitDir>\MQL5\Indicators\maku77
<DataDir>\MQL5\Libraries\maku77  → <GitDir>\MQL5\Libraries\maku77
<DataDir>\MQL5\Scripts\maku77    → <GitDir>\MQL5\Scripts\maku77
```

各ディレクトリには、コンパイル前のソースコード (`.mq5`) しか入っていないので、実行する前に MetaEditor 上でコンパイル (`F7`) して実行ファイル (`.ex5`) を作成する必要があります。

