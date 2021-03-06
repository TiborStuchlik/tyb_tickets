module TybTickets
  class SeedsGenerator < Rails::Generators::Base

    desc "Create some initial data tyb_tickets"

    def seed
      create_ticket_statuses
      create_members
      create_tickets
    end

    private

    def create_members
      puts "creating members..."
      (1..5).each do |n|
        mail = "member#{n}@example.com"
        puts mail
        Member.find_or_create_by( email: mail)
      end
    end

    def create_ticket_statuses
      puts "create ticket statuses x..."
      ['vyřešeno', "zamítnuto", "duplicita"].each do |i|
        TicketStatus.find_or_create_by( name: i )
        puts i
      end
    end

    def create_tickets
      puts "create tickets..."

      month_sec = 60 * 60 * 24 * 30
      hour_5 = 60 * 60 * 5

      ed = Time.new.to_i
      sd = ed - month_sec
      mids = Member.pluck(:id)
      tsids = TicketStatus.pluck(:id)

      10.times do |n|

        d_s = Time.at( sd + rand(month_sec) )
        d_e = Time.at( d_s + rand(hour_5))
        cid = rand 4
        cid += 1
        rnd = rand 10

        mid = mids[rand(mids.size - 1)]
        tsid = tsids[rand(tsids.size - 1)]
        cust = "customer#{cid}@example.com"

        if rnd > 1
          ticket_sid = tsid
          closed = d_e
          puts "TSID: #{ticket_sid} ID: #{mid} FROM: #{d_s} TO: #{closed} CUST: #{cust}"
        else
          ticket_sid = nil
          closed = nil
          d_s = Time.at( (Time.now - hour_5 + rand( hour_5)))
          puts "--- ID: #{mid} FROM: #{d_s} TO: #{closed} CUST: #{cust}"
        end

        Ticket.create!(
            member_id: mid,
            customer_email: cust,
            description: "problem_#{rand 10}_#{rand 100000}",
            created_at: d_s,
            closed_at: closed,
            ticket_status_id: ticket_sid

        )

      end
    end

  end
end