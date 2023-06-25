# sinatra_memos_app
 sinatraでメモアプリを作りました。
 構成は画像のようになっております。

![sinatra_memo_app.004.jpeg](https://bootcamp.fjord.jp/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMkFPQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--8b4e08e344cf79074924207eda0942626f520fb0/sinatra_memo_app.004.jpeg)

# Requirement
* ruby(3.2.2)
* sinatra (3.0.6)
* sinatra-contrib (3.0.6)
* pg (1.5.3)
* psql (PostgreSQL) 14.7
 
# Installation

1. PostgresSQL のデフォルトユーザーでsinatra_memo_appというデータベースを作成し、``` CREATE TABLE memos (id serial, title varchar(10), contents varchar(10), time timestamp);```を実行してください。
3. git clone https://github.com/zamami/FBC_sinatraを実行して任意のディレクトリに複製して下さい。
FBC_sinatraディレクトリに移動して下さい。
4. bundle installを実行して下さい。Gemfile 記載のsinatra、sinatra-contrib、pgおよびthinがインストールされます。
5. FBC_sinatraディレクトリでbundle exec ruby app.rbを実行してください。
6. 任意のブラウザでhttp://localhost:4567/memosにアクセスしてください。

# Usage

![スクリーンショット 0005-06-01 15.30.49.png](https://bootcamp.fjord.jp/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMkVPQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--35140dd4c347e440e0dc979be85292072eb06e84/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%200005-06-01%2015.30.49.png)

1、青色のバー「追加」を押すとメモの新規作成画面に移動します。

![スクリーンショット 0005-06-01 15.32.20.png](https://bootcamp.fjord.jp/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMklPQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--d51f9c08cb991cbceb788ca29c79abf91572a447/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%200005-06-01%2015.32.20.png)

2、タイトルと内容を入力後、「保存」ボタンをクリックするとトップ画面に移動します。

![スクリーンショット 0005-06-01 15.35.03.png](https://bootcamp.fjord.jp/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMk1PQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--89dd377a5d58e8ab6abb35412a8cec11d4ad8c5e/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%200005-06-01%2015.35.03.png)


![スクリーンショット 0005-06-01 15.35.15.png](https://bootcamp.fjord.jp/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMlFPQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--b1225eb9a8cf831ee03b1d25448e46a348557c26/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%200005-06-01%2015.35.15.png)



3、編集、削除を行いたいときには特定のメモを選択し「更新」、「削除」ボタンを押してください。操作後トップ画面に戻ります。

![スクリーンショット 0005-06-01 15.35.31.png](https://bootcamp.fjord.jp/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBMlVPQXc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--36604114aaa19fd4e0c60837de4ca3aa8f1a762c/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%200005-06-01%2015.35.31.png)


 

 
# Author
 
* r.zamami
* s1413115@gmail.com
 