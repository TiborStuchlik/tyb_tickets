module TybTickets
  class InstallGenerator < Rails::Generators::Base

    desc "Initial setting module tyb_tickets"

    def seed
      setup_gem
    end

    private

    def setup_gem
      generate "model", "Member", "email:string name:string", "--skip", "--skip-collision-check"
      generate "model", "TicketStatus", "name:string", "--skip", "--skip-collision-check"
      generate "model", "Ticket", "member_id:integer description:text customer_email:string closed_at:datetime ticket_status_id:integer", "--skip", "--skip-collision-check"
      rake "db:migrate"
    end

  end
end