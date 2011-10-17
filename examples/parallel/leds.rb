p = open('/dev/port', 'w')
p.sync = true

sequence = [
  0b00000000,
  0b00000010, 0b00001010, 0b00101010,
  0b10101010,
  0b00101010, 0b00001010, 0b00000010,
  0b00000000,
  0b00000001, 0b00000101, 0b00010101,
  0b01010101,
  0b00010101, 0b00000101, 0b00000001,
  0b00000000,
]

3.times do
  sequence.each do |s|
    p.seek(0x378, IO::SEEK_SET)
    p.putc(s)
    sleep 0.1
  end
end
