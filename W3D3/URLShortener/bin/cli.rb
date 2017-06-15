require_relative "../app/models/user"
require_relative "../app/models/shortened_url"
require_relative "../app/models/visit"

puts "Input your email: "
print "> "

email = gets.chomp

if User.find_by(email: email)
   user = User.find_by(email: email)
else
  user = User.create(email: email)
end

puts "What do you want to do?"
puts "0. Create shortened URL"
puts "1. Visit shortened URL"
print "> "

choice = gets.chomp

if choice == '0'
  puts "Type in your long url"
  print "> "

  long_url = gets.chomp

  url_obj = ShortenedUrl.create_short_url(user, long_url)

  puts "Short url is: #{url_obj.short_url}"
  puts "Goodbye!"

elsif choice == '1'

  puts "Type in the shortend URL"
  print "> "
  short_url = gets.chomp

  long_url = ShortenedUrl.where(short_url: short_url).select(:long_url).first.long_url
  p long_url
  puts "Launching #{long_url} ..."
  puts "Goodbye!"
end
