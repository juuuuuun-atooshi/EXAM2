class PicturesController < ApplicationController
  before_action :set_picture, only:[:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  def new
    @picture = Picture.new
  end

  def index
    @pictures = Picture.all
  end

  def edit
  end

  def create
    @picture = Picture.create(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "写真を投稿しました！"
    else
      render 'new'
    end
  end

  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "投稿を更新しました！"
    else
      render 'new'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました"
  end

  private
    def pictures_params
      params.require(:picture).permit(:title, :content, :image)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end

end
