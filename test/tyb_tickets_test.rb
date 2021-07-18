require "test_helper"

class TybTicketsTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert TybTickets::VERSION
  end

  test "It has Member model" do
    assert TybTickets::Member
  end

  test "It has TicketStatus model" do
    assert TybTickets::TicketStatus
  end

  test "It has Ticket model" do
    assert TybTickets::Tickets
    member = TybTickets::Member.new
    assert TybTickets::Tickets.new.member = member
  end


end
