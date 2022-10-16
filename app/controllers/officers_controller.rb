class OfficersController < ApplicationController
  def index
    @officers = Officer.all.page(params[:page])
  end

  def show
    @officer = Officer.find(params[:id])
    @ticketswritten = Ticket.where(officer_id: params[:id]).page(params[:page])
  end
end
