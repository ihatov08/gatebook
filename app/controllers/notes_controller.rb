class NotesController < ApplicationController
  def new
  end
  def create
    @note = Note.new
    @note.title = params[:title]
    @note.content = params[:content]
    @note.save
  end

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end
end
