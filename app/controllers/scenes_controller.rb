class ScenesController < ApplicationController
	def new
  	@scene = Scene.new
  end

  def show
  	@scene = Scene.find(params[:id])
  end

  def index
    @scenes = Scene.paginate(page: params[:page])
  end

  def create
    @scene = Scene.new(scene_params)
    if @scene.save
    	flash[:success] = "Scene creation successful !"
      redirect_to @scene
    else
      render 'new'
    end
  end

  def destroy
    Scene.find(params[:id]).destroy
    flash[:success] = "Scene deleted."
    redirect_to scenes_url
  end

  def edit
    @scene = Scene.find(params[:id])
  end

  def update
    @scene = Scene.find(params[:id])
    if @scene.update_attributes(scene_params)
      flash[:success] = "Scene updated"
      redirect_to @scene
    else
      render 'edit'
    end
  end

  private

    def scene_params
      params.require(:scene).permit(:location, :period, :content)
    end
end
