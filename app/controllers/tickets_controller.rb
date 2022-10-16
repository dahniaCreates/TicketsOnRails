class TicketsController < ApplicationController
  def index
    @tickets = Ticket.includes(:category).page(params[:page])
  end

  def show
    @ticket = Ticket.find(params[:id])
    @category_tickets = Category.where(id: @ticket.category_id)
    @officer_tickets = Officer.where(id: @ticket.officer_id)
    @ticket_on_streets = Street.where(id: @ticket.street_id)
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"

    @tickets = Ticket.where("ticket_number LIKE ?", wildcard_search)
  end
end
