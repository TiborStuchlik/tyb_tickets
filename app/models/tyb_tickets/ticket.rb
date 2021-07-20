module TybTickets

  class Ticket < ApplicationRecord
    # A relace
    belongs_to :ticket_status, required: false
    belongs_to :member, required: false

    ##
    # Get closed tickets
    scope :closed, -> { where.not( closed_at: nil) }
    ##
    # Get average time of all tickets
    scope :average_work_time, -> { select("AVG( TIMESTAMPDIFF(MINUTE, created_at, closed_at)) as average")}
    #scope :members_stats, -> { select(:member_id, "COUNT(*) as tickets_count").group( :member_id).order(:member_id) }

    ##
    # Retrieves customer statistics with the total amount of task time
    scope :customer_stats, ->(from_date, to_date) {
      closed
          .group( :customer_email)
          .select( :customer_email,
                   "SUM(TIMESTAMPDIFF(MINUTE, created_at, closed_at)) as seconds_diff_sum",
                   "COUNT(*) as tickets_count"
          )
          .where("closed_at BETWEEN ? AND ?", from_date, to_date)
          .order("seconds_diff_sum DESC")
    }
    ##
  end
end


