require_dependency "tyb_tickets/application_controller"

module TybTickets
  class MainController < ApplicationController
    def index
      render inline: "ENGINE TYB_TICKETS"
    end
  end
end
