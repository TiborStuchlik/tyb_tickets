
month_sec = 60 * 60 * 24 * 30
hour_5 = 60 * 60 * 5

ed = Time.new.to_i
sd = ed - month_sec

2.times do |n|

  d_s = Time.at( sd + rand(month_sec) )
  d_e = Time.at( d_s + rand(hour_5))

  puts "FROM: #{d_s} TO: #{d_e}"

end
#User.create!( :email => 'host@example.com', :password => 'hosthost', :password_confirmation => 'hosthost')
