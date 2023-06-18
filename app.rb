# frozen_string_literal: true

require 'securerandom'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'pg'

ID_NUMBER_ADJUSTMENT = 1 # 配列の要素番号とメモの番号のズレを調整
helpers do
  def h(text)
    Rack::Utils.escape_html(text) # XSS対策
  end

  def set_all_files
    @files = Dir.glob('../json/*').map do |file|
      JSON.parse(File.read(file))
    end
  end

  def make_json_file
    id = "#{Time.now.strftime('%Y%m%d_%H_%M_%S')}_#{SecureRandom.uuid}"
    File.open("../json/#{id}_note.json", 'w') do |file| # 新規投稿フォームの内容をjsonに保存
      hash = { id:, title: params[:title], content: params[:contents] }
      JSON.dump(hash, file)
    end
  end
end

get '/memos' do # トップ画面
  set_all_files
  erb :index
end

post '/memos' do # 新規メモデータの受け取り
  make_json_file
  set_all_files
  redirect to('/memos')
end

get '/memos/new' do # 新規登録
  erb :form
end

get '/memos/:id' do # 詳細画面
  set_all_files
  erb :show
end

delete '/memos/:id' do # 削除機能
  File.delete("../json/#{params[:id]}_note.json")
  redirect to('/memos')
end

get '/memos/:id/edit' do # 編集画面
  edit_memo = File.open("../json/#{params[:id]}_note.json", 'r+').read
  @edit_memo = JSON.parse(edit_memo)
  erb :edit_memo
end

patch '/memos/:id' do # 編集機能
  file = File.read("../json/#{params[:id]}_note.json")
  update_file = JSON.parse(file)
  update_file['title'] = params['title']
  update_file['content'] = params['content']
  File.open("../json/#{update_file['id']}_note.json", 'w') { |f| JSON.dump(update_file, f) }
  redirect to('/memos')
end
