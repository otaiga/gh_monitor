require 'bundler/setup'
require 'dino'

# Simple class for arduino connection
class ArduinoClient
  def blink(duration = 5, sleep_count = 1)
    states.cycle(duration) do |switch|
      create_sound
      led_red.send(switch)
      sleep(sleep_count.to_i)
    end
  end

  def states
    [
      :on,
      :off
    ]
  end

  def create_sound
    [0.2, 0.1, 0.03, 0.5].each do |i|
      sound.send(:on)
      sleep(i)
      sound.send(:off)
      sleep(i)
    end
  end

  def led_red
    Dino::Components::Led.new(pin: 13, board: board)
  end

  def sound
    Dino::Components::Led.new(pin: 8, board: board)
  end

  def board
    Dino::Board.new(Dino::TxRx::Serial.new)
  end

  def run_alert(duration = 10, sleep_count = 1)
    blink(duration, sleep_count)
  end
end
