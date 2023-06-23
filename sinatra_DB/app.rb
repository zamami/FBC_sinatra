# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pg'

connection = PG.connect(dbname: 'sinatra_memo_app')

ADJUSTMENT_INDEX_NUM = 1
get '/memos' do # トップ画面
  @all_memos = connection.exec('SELECT * FROM memos ORDER BY time asc;')
  @adjustment_index_num = ADJUSTMENT_INDEX_NUM
  erb :index
end

post '/memos' do # 新規メモデータの受け取り
  title = params[:title]
  contents = params[:contents]
  time = Time.new.strftime('%F %T')
  connection.exec_params('INSERT INTO memos(title, contents, time) VALUES ($1, $2, $3)', [title, contents, time])
  redirect to('/memos')
end

get '/memos/new' do # 新規登録
  erb :form
end

get '/memos/:id' do # 詳細画面
  sql = <<-SQL
    SELECT *
    FROM memos
    WHERE id = $1
  SQL
  @memo = connection.exec_params(sql, [params[:id]]).first
  erb :show
end

delete '/memos/:id' do # 削除機能
  sql = <<-SQL
    DELETE FROM memos
    WHERE id = $1
  SQL
  @memo = connection.exec_params(sql, [params[:id]])
  redirect to('/memos')
end

get '/memos/:id/edit' do # 編集画面
  sql = <<-SQL
    SELECT *
    FROM memos
    WHERE id = $1
  SQL
  @memo = connection.exec_params(sql, [params[:id]]).first
  erb :edit_memo
end

patch '/memos/:id' do # 編集機能
  sql = <<-SQL
  UPDATE memos
  SET title = $1, contents = $2
  WHERE id = $3
  SQL
  connection.exec_params(sql, [params['title'], params['content'], params[:id]])
  redirect to('/memos')
end
