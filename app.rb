# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'pg'

connection = PG.connect(dbname: 'sinatra_memo_app')

get '/memos' do # トップ画面
  @all_memos = connection.exec('SELECT * FROM memos ORDER BY create_time asc;')
  erb :index
end

post '/memos' do # 新規メモデータの受け取り
  title = params[:title]
  content = params[:content]
  time = Time.new
  if params[:content].empty?
    redirect to('/memos/new')
  else
    connection.exec_params('INSERT INTO memos(title, content, create_time) VALUES ($1, $2, $3)', [title, content, time])
    redirect to('/memos')
  end
end

get '/memos/new' do # 新規登録
  erb :form
end

get '/memos/:id' do # 詳細画面
  sql = 'SELECT * FROM memos WHERE id = $1'
  @memo = connection.exec_params(sql, [params[:id]]).first
  erb :show
end

delete '/memos/:id' do # 削除機能
  sql = 'DELETE FROM memos WHERE id = $1'
  connection.exec_params(sql, [params[:id]])
  redirect to('/memos')
end

get '/memos/:id/edit' do # 編集画面
  sql = 'SELECT * FROM memos WHERE id = $1'
  @memo = connection.exec_params(sql, [params[:id]]).first
  erb :edit_memo
end

patch '/memos/:id' do # 編集機能
  sql = 'UPDATE memos SET title = $1, content = $2 WHERE id = $3'
  connection.exec_params(sql, [params['title'], params['content'], params[:id]])
  redirect to('/memos')
end
