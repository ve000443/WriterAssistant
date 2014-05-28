class TagRelationshipsController < ApplicationController

	def destroy
    tag = TagRelationship.find(params[:id]).tag
    anecdote = TagRelationship.find(params[:id]).anecdote
    anecdote.untag!(tag)
    if tag.appearances.count == 0
    	tag.destroy
    end
    redirect_to anecdote
  end

  def create
  	anecdote = Anecdote.find(params[:tag_relationship][:anecdote_id])
  	tag = Tag.find_by(name: params[:tag_relationship][:tag_name])
  	if tag == nil
  		tag = Tag.new
  		tag.name = params[:tag_relationship][:tag_name]
  		tag.save
		end

		anecdote.tag!(tag)
		redirect_to anecdote
  end
end
