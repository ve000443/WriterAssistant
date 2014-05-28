class TagsController < ApplicationController
  def show
  	@tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.paginate(page: params[:page])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def destroy
    Tag.find(params[:id]).destroy
    flash[:success] = "Tag deleted."
    redirect_to tags_url
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      flash[:success] = "Tag updated"
      redirect_to @tag
    else
      render 'edit'
    end
  end

  private

    def tag_params
      params.require(:tag).permit(:name)
    end
end
