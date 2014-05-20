require 'bundler/setup'
require 'dino'

class ArduinoClient
  def blink(duration=10, sleep_count=1)
    states.cycle(duration) do |switch|
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

  def led_red
    Dino::Components::Led.new(pin: 13, board: board)
  end

  def board
    Dino::Board.new(Dino::TxRx::Serial.new)
  end

  def run_alert(duration=10, sleep_count=1)
    blink(duration, sleep_count)
  end
end