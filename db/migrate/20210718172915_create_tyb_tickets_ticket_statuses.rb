class CreateTybTicketsTicketStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :tyb_tickets_ticket_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
