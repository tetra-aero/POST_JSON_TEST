# POST_JSON_TEST
HTTP POST method TEST for Windows PowerShell

特定のアドレスにあるNode-REDサーバーURLに対して、HTTP通信によるPOSTメソッドでJSONデータを100ms毎に送信する。

[JSON BODY]
{
  "parameter2": nn,
  "parameter1": nn
}

nn = (0-100)までの整数。インクリメント（＋１）動作する
