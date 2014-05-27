class ChaptersController < ApplicationController
  def new
  end

  def index
    @chapters = Chapter.paginate(page: params[:page])
  end
end
