class OfficersController < ApplicationController
  def index
    @officers = Officer.all
  end

  def show
    @officer = Officer.find(params[:id])
    @ticketswritten = Ticket.where(officer_id: params[:id])
  end
end
