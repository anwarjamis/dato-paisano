class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user = current_user
    if @suggestion.save
      redirect_to thanks_path
    else
      render 'new'
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:networking, :mentoring, :partnership, :investors, :subsidies, :growth, :start, :others)
  end
end
