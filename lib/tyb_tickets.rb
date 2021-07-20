require "tyb_tickets/version.rb"
require "tyb_tickets/engine"
#require_relative '../app/models/tyb_tickets/member'
#require "tyb_tickets/railtie"

module TybTickets

  # Add new ticket status to table
  #   TybTickets.addTicketStatus("Done")
  def self.add_ticket_status( name)
    TicketStatus.create( name: name)
  end

  # Add new member to table
  #   TybTickets.add_member("member1@example.com")
  def self.add_member( email)
    Member.create( email: email)
  end

  # Add new ticket to table with id of member, customer email, and description of ticket.
  #   TybTickets.add_ticket( 1, "customer1@example.com", "Our web send NOT FOUND")
  def self.add_ticket( member_id, customer_email, description)
    Ticket.create( member_id: member_id, customer_email: customer_email, description: description)
  end

  ##
  # Close ticket with id, and set closed status
  def self.close_ticket( ticket_id, ticket_status_id)
    ticket = Ticket.find(ticket_id)
    ticket.ticket_status_id = ticket_status_id
    ticket.closed_at = Time.now
    ticket.save
  end

  ##
  # Get average time of all tickets
  def self.average_work_time
    Ticket.closed.average_work_time.take.average
  end

  ##
  # Retrieves member statistics with the number of completed tasks in the specified period
  def self.members_stats( from_date, to_date )
    Member.stats( from_date, to_date)
  end

  ##
  # Retrieves customer statistics with the total amount of task time oh time range in the specified period
  def self.customers_stats( from_date, to_date)
    Ticket.customer_stats( from_date, to_date)
  end

end
