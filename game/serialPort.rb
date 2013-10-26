#simplest ruby program to read from arduino serial,
#using the SerialPort gem
#(http://rubygems.org/gems/serialport)
 
require 'serialport'
require 'observer'

class SerialObservable
  include Observable
#params for serial port
 
  #just read forever
  def start_observing
    @port_str = "/dev/ttyACM0"  #may be different for you
    @baud_rate = 9600
    @data_bits = 8
    @stop_bits = 1
    @parity = SerialPort::NONE
    @sp = SerialPort.new(@port_str, @baud_rate, @data_bits, @stop_bits, @parity)
    @sp ||= ''
    @prev = 1 
    #puts i.class #String
  end
  
  def observe_trigger
    while (i = @sp.gets)
      if (i =~ /^(\d+)/)
        changed
        if $1.include? "1"
          notify_observers("Player trigger 1")
        end
        if $1.include? "2"
          notify_observers("Player trigger 2")
        end
      end
    end
  end

  def observe_sensors
    while (i = @sp.gets)
      if (i =~ /^(\d+)/)
        changed
        if $1.include? "3"
          notify_observers("Player1 sens 1")
        end
        if $1.include? "4"
          notify_observers("Player1 sens 0")
        end
        if $1.include? "5"
          notify_observers("Player2 sens 1")
        end
        if $1.include? "6"
          notify_observers("Player2 sens 0")
        end
      end
    end
  end

  def stop_observing
    @sp.close    
  end
end
  
