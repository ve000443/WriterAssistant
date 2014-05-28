class AnecdotesController < ApplicationController
	def new
  	@anecdote = Anecdote.new
  end

  def show
  	@anecdote = Anecdote.find(params[:id])
  end

  def index
    @anecdotes = Anecdote.paginate(page: params[:page])
  end

  def create
    @anecdote = Anecdote.new(anecdote_params)    # Not the final implementation!
    if @anecdote.save
    	flash[:success] = "Anecdote creation successful !"
      redirect_to @anecdote
    else
      render 'new'
    end
  end

  def destroy
    Anecdote.find(params[:id]).destroy
    flash[:success] = "Anecdote deleted."
    redirect_to anecdotes_url
  end

  def edit
    @anecdote = Anecdote.find(params[:id])
  end

  def update
    @anecdote = Anecdote.find(params[:id])
    if @anecdote.update_attributes(anecdote_params)
      flash[:success] = "Anecdote updated"
      redirect_to @anecdote
    else
      render 'edit'
    end
  end

  private

    def anecdote_params
      params.require(:anecdote).permit(:subject, :content)
    end
end
