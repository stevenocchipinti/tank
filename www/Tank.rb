class Tank

  P_ADDR=0x378
  P_FILE="/tmp/port"
  DEFAULT_TIME=2

  def initialize()
    # Open the parallel port
    @p = open(P_FILE, 'w')
    @p.sync = true
  end

  # ============================================================================
  # Movement methods
  # ============================================================================

  def forward(time=DEFAULT_TIME)
    write(0b10100000)
    sleep(time)
    stop
  end

  def reverse(time=DEFAULT_TIME)
    write(0b11110000)
    sleep(time)
    stop
  end

  def left(time=DEFAULT_TIME)
    write(0b11100000)
    sleep(time)
    stop
  end

  def right(time=DEFAULT_TIME)
    write(0b10110000)
    sleep(time)
    stop
  end

  def stop
    write(0b00000000)
  end

  # ============================================================================
  # Turret methods
  # ============================================================================

  def clockwise(time=DEFAULT_TIME)
    write(0b00001000)
    sleep(time)
    stop
  end

  def anticlockwise(time=DEFAULT_TIME)
    write(0b00001100)
    sleep(time)
    stop
  end

  def up(time=DEFAULT_TIME)
    write(0b00000010)
    sleep(time)
    stop
  end

  def down(time=DEFAULT_TIME)
    write(0b00000011)
    sleep(time)
    stop
  end

  # TODO: Not enough pins to implement this, so just fake some recoil! (lol)
  def fire
    write(0b11110000)
    sleep(0.5)
    write(0b10100000)
    stop
  end

  # ============================================================================
  # Demos
  # ============================================================================

  # Nice demo sequence for testing/showing-off LEDs (not motors)
  def led_demo
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
      sequence.each do |byte|
        write(byte)
        sleep(0.1)
      end
    end
  end

  # Make the tank test all its movement methods
  def movement_demo
    forward
    up
    down
    left
    forward
    clockwise
    anticlockwise
    anticlockwise
    clockwise
    right
    right
    forward
    left
  end


  private

    def write(byte)
      @p.seek(P_ADDR, IO::SEEK_SET)
      @p.putc(byte)
    end

end