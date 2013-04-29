require "pi_piper"

puts "Hello!"
pin = PiPiper::Pin.new(:pin => 23, :direction => :out)

50.times do
  print "off... "
  pin.off
  sleep 1
  print "on... "
  pin.on
  sleep 1
end
