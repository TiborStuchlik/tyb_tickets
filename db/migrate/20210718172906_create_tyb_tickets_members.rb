class CreateTybTicketsMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :tyb_tickets_members do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
