class CharacterRelationshipsController < ApplicationController

  def destroy
    scene = CharacterRelationship.find(params[:id]).scene
    character = CharacterRelationship.find(params[:id]).character
    character.disappear!(scene)
    if params[:commit].to_s == "Disappear from scene"
    	redirect_to character
	else
		redirect_to scene
	end
  end

  def create
    if params[:commit].to_s == "Appear in scene"
	    scene = Scene.find(params[:scene][:scene_id])
	    character = Character.find(params[:character_relationship][:character_id])
	    character.appear!(scene)
    	redirect_to character
	else
		scene = Scene.find(params[:character_relationship][:scene_id])
	    character = Character.find(params[:character][:character_id])
	    character.appear!(scene)
		redirect_to scene
	end
  end
end
