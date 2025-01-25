# Write your solution here!
require "rqrcode"

input_number = "0"
acceptable_numbers = ["1", "2", "3", "4"]

while !(acceptable_numbers.include? input_number)
  # Get the number from user
  puts "What kind of QR code would you like to generate?\n1. Open a URL\n2. Join a wifi network\n3. Send a text message\nPress 4 to exit"
  input_number = gets.chomp

  if acceptable_numbers.include? input_number
    if input_number == "1"
      puts "Please insert your url."
      encoding = gets.chomp
    elsif input_number == "2"
      puts "What's the Wifi name?"
      wifi_name = gets.chomp
      puts "What's the Wifi password?"
      wifi_password = gets.chomp
      encoding = "WIFI:T:WPA;S:#{wifi_name};P:#{wifi_password};;"
    elsif input_number == "3"
      puts "What number do you want to message?"
      number = gets.chomp
      puts "Insert your message"
      message = gets.chomp
      encoding = "SMSTO:#{number}:#{message}"
    elsif input_number == "4"
      exit
    # else
    end

    puts "Insert a name for your QR code"
    name = gets.chomp

    # Use the RQRCode::QRCode class to encode some text
    qrcode = RQRCode::QRCode.new(encoding)

    # Use the .as_png method to create a 500 pixels by 500 pixels image
    png = qrcode.as_png({ :size => 500 })

    # Write the image data to a file
    IO.binwrite("#{name}.png", png.to_s)
  end
  input_number = "0"
  puts "-"*50
end
# More notes
# qrcode = RQRCode::QRCode.new("wikipedia qr code")
# qrcode = RQRCode::QRCode.new("https://en.wikipedia.org/wiki/QR_code")
# qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:NETGEAR19-5G;P:elatedplanet227;;")
