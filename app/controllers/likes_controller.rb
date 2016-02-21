class LikesController < ApplicationController
  def like
    note = Note.find(params[:note_id])
    # 変数likeに、current_userとbuildを用いてLikeインスタンスを代入してください
    like = current_user.likes.build(note_id: note.id)
    # saveメソッドで、likeを保存してください
    like.save
    redirect_to note
  end
  def unlike
    note = Note.find(params[:note_id])
    # 変数likeに、current_userとfind_byを用いてLikeインスタンスを代入してください
    like = current_user.likes.find_by(note_id: note.id)
    # destroyメソッドで、likeを削除してください
    like.destroy
    redirect_to note
  end
end
