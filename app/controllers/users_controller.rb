class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_actionでcorrect_userメソッドを呼び出してください
  before_action :correct_user, only: [ :edit, :update]

  before_action :set_user, only: [:show, :edit, :update, :like_notes]

  def index
    @users = User.all
  end

  def show
    @notes = @user.notes
    @title = "投稿一覧"
  end

  def edit
  end

  def update
    file = params[:user][:image]
    @user.set_image(file)

    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました'
    else
      render :edit
    end
  end

  def like_notes
    @notes = @user.like_notes
    @title = "いいね！一覧"
    render :show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end

    # correct_userメソッドを定義してください。
    def correct_user
      user = User.find(params[:id])
      # 以下のリダイレクト部分をif文で囲ってください。
      if !current_user?(user)
        redirect_to root_path, alert: '許可されていないページです'
      end
    end

end
