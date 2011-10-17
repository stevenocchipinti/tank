import time

# Constants
FWD = '\x05' # bin = 0b0101
REV = '\x0A' # bin = 0b1010
LFT = '\x06' # bin = 0b0110
RHT = '\x09' # bin = 0b1001

# Get access to the parallel port
f = open('/dev/port', 'wb')

# Write the byte to the parallel port
def set(hexstr):
  f.seek(0x378)
  f.write(hexstr)
  f.flush()


# A demo sequence

print "Going forward"
set(FWD)
time.sleep(2)

print "Going left"
set(LFT)
time.sleep(2)

print "Going right"
set(RHT)
time.sleep(2)

print "Going backward"
set(REV)
time.sleep(2)

set('\x00')
