require "tyb_tickets"

namespace :tyb_tickets do
  desc "Create Migrations and Run db:migration."
  task :setup do
    puts "Setting Up. Please Wait..."

    Dir.chdir(TybTickets::Engine.root){
      puts %x[#{'rails g tyb_tickets:install'}]
    }
  end

  desc "Create Some Seeds."
  task :seeds do
    puts "Create Data. Please Wait..."
    puts TybTickets::VERSION

    create_members

    #Dir.chdir(TybTickets::Engine.root){
    #  puts %x[#{'rails g tyb_tickets:seeds'}]
    #}

  end

  private


  def create_members
    puts "creating members..."
    (1..5).each do |n|
      mail = "member#{n}@example.com"
      puts mail
      TybTickets::Member.find_or_create_by( email: mail)
    end
  end

end
