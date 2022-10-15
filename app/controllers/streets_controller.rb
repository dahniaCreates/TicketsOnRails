class StreetsController < ApplicationController
  def index
    @streets = Street.includes(:categories).all
  end

  def show
    @street = Street.find(params[:id])
    @streetcategories = StreetCategory.where(street_id: params[:id])
    @distinct_street_categories = @streetcategories.select(:category_id).distinct
    @tickets_on_street = Ticket.where(street_id: params[:id])
  end
end
