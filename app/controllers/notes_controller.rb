class NotesController < ApplicationController
  def new
  end
  def create
    @title = params[:title]
    @content = params[:content]
  end
end
