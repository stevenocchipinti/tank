PPCLAIM=0x0000708b
PPDATADIR=0x40047090
PPWDATA=0x40017086
PPRELEASE=0x0000708c

p = open('/dev/parport0', 'w')
p.sync = true
p.ioctl(PPCLAIM)

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
    p.ioctl(PPDATADIR, [0].pack("i"))
    p.ioctl(PPWDATA, [s].pack("C"))
    sleep 0.1
  end
end

p.ioctl(PPRELEASE)
