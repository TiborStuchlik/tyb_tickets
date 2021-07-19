require './tyb_tickets/app/models/tyb_tickets/application_record'
puts Dir.pwd
module TybTickets
  class Member < ApplicationRecord
    ##
    # Members tickets
    has_many :tickets
    ##
    # Retrieves membership statistics with the number of completed tasks
    scope :stats, ->(from_date, to_date) {
      joins(:tickets)
          .group(:member_id)
          .select("tyb_tickets_members.*, COUNT(*) as tickets_count")
          .where("closed_at BETWEEN ? AND ?", from_date, to_date)
          .order(tickets_count: :desc) }


  end
end


