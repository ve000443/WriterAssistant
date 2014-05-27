class CharactersController < ApplicationController
	def new
  	@character = Character.new
  end

  def show
  	@character = Character.find(params[:id])
  end

  def index
    @characters = Character.paginate(page: params[:page])
  end

  def create
    @character = Character.new(character_params)
    if @character.save
    	flash[:success] = "Character creation successful !"
      redirect_to @character
    else
      render 'new'
    end
  end

  def destroy
    Character.find(params[:id]).destroy
    flash[:success] = "Character deleted."
    redirect_to characters_url
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    if @character.update_attributes(character_params)
      flash[:success] = "Character updated"
      redirect_to @character
    else
      render 'edit'
    end
  end

  private

    def character_params
      params.require(:character).permit(:name)
    end
end
