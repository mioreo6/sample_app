class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成
    @list = List.new
  end
  def create
    # データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @list.save
    # トップ画面へリダイレクト
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def destroy
    list = List.find(params[:id]) #データ（レコード）を１件取得
    list.destroy #データ（レコード）を削除
    redirect_to '/lists' #投稿画面一覧へリダイレクト
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
