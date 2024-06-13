class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about]

  def home
    @businesses = Business.order(id: :desc).limit(12)
  end

  def about
  end
end
