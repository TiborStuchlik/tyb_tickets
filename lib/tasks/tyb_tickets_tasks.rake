require "tyb_tickets"
require_relative "../../app/models/tyb_tickets/application_record"
require_relative "../../app/models/tyb_tickets/member"
require_relative "../../app/models/tyb_tickets/ticket_status"

namespace :tyb_tickets do

  desc "Create Some Seeds."
  task :seeds__xxx do
    conn = ActiveRecord::Base.establish_connection(:tyb).connection
    puts "TybTicket v. #{TybTickets::VERSION}"
    puts
    puts "Create Data. Please Wait..."

    #create_ticket_statuses
    #create_members

  end

  private

  def create_ticket_statuses
    puts "create ticket statuses x..."
    ['vyřešeno', "zamítnuto", "duplicita"].each do |i|
      TybTickets::TicketStatus.find_or_create_by( name: i )
      puts i
    end
  end

  def create_members
    puts "creating members..."
    (1..5).each do |n|
      mail = "member#{n}@example.com"
      puts mail
      Member.find_or_create_by( email: mail)
    end
  end

end
