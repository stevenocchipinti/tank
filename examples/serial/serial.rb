require 'serialport'

# http://stackoverflow.com/questions/4113992/write-byte-to-arduino-from-ruby-over-serial?rq=1

#params for serial port
port_str = "/dev/ttyACM0"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

i = 31

loop do
  sp.putc(i)
  puts 'Wrote: %d = %bb' % [ i, i ]
  i = (i == 31) ? 0 : (i + 1)
  sleep(1)
end

#s = SerialPort.new "/dev/ttyACM0", 9600, 8, 1, SerialPort::NONE
#s.putc(15)

#sleep 3
