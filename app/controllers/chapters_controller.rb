class ChaptersController < ApplicationController
  def new
  	@chapter = Chapter.new
  end

  def show
  	@chapter = Chapter.find(params[:id])
  end

  def index
    @chapters = Chapter.paginate(page: params[:page])
  end

  def create
    @chapter = Chapter.new(chapter_params)    # Not the final implementation!
    if @chapter.save
    	flash[:success] = "Chapter creation successful !"
      redirect_to @chapter
    else
      render 'new'
    end
  end

  def destroy
    Chapter.find(params[:id]).destroy
    flash[:success] = "Chapter deleted."
    redirect_to chapters_url
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.update_attributes(chapter_params)
      flash[:success] = "Chapter updated"
      redirect_to @chapter
    else
      render 'edit'
    end
  end

  private

    def chapter_params
      params.require(:chapter).permit(:number, :title)
    end
end
