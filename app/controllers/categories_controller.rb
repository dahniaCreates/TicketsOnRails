class CategoriesController < ApplicationController
  def index
    @categories = Category.all.page(params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @tickets_in_category = Ticket.where(category_id: params[:id])
    @streets_in_category = StreetCategory.where(category_id: params[:id])
    @distinct_streets_in_category = @streets_in_category.select(:street_id).distinct
  end
end
