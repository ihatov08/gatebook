class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [ :edit, :update]

  def create
    @note = Note.new(note_params)
    if @note.save
    redirect_to @note, notice: "投稿が保存されました"
  else
    render :new
  end
  end

  def show
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to @note, notice: '投稿が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private
   def set_note
    @note = Note.find(params[:id])
   end

   def note_params
    params.require(:note).permit(:title, :content, :user_id)
   end

   def correct_user
      note = Note.find(params[:id])
      # noteを投稿したユーザーを取得し、current_user?メソッドの引数に渡してください
      if !current_user?(note.user)
        redirect_to root_path, alert: '許可されていないページです'
      end
    end


end
