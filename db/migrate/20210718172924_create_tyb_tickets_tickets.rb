class CreateTybTicketsTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tyb_tickets_tickets do |t|
      t.integer :member_id
      t.text :description
      t.string :customer_email
      t.datetime :closed_at
      t.integer :ticket_status_id

      t.timestamps
    end
  end
end
