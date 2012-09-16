class Arduino
  def self.hello_world
    require 'serialport'

    puts 'started ruby code...'
    #params for serial port
    port_str = "/dev/tty.usbserial-A6004osT"  #may be different for you
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
    @@sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

    # wait for connection
    sleep(1)

    # print "How long for notes? "
    # note_duration = $stdin.gets.chomp.to_f
    note_duration = 0.05
  
    # print "How long for rest between rib & bon? "
    # ribbon_rest_duration = $stdin.gets.chomp.to_f
    ribbon_rest_duration = 0.1

    # print "How long for rest between bon & farm? "
    # farm_rest_duration = $stdin.gets.chomp.to_f
    farm_rest_duration = 0.2
    
    # voices = ['Agnes', 'Albert', 'Alex', 'Bad News', 'Bahh', 'Bells', 'Boing', 'Bruce', 'Bubbles', 'Cellos', 'Deranged', 'Fred', 'Good News', 'Hysterical', 'Junior', 'Kathy', 'Pipe Organ', 'Princess', 'Ralph', 'Trinoids', 'Vicki', 'Victoria', 'Whisper', 'Zarvox']
    
    # print "Which voice? "
    # voice = $stdin.gets.chomp
    voice = 'Vicki'    
    
    count = 0
    loop do
      print "Twitter handle? "
      twitter_handle = $stdin.gets.chomp
      twitterer = Twitter.user(twitter_handle)
      greeting = "#{twitterer.name} #{twitterer.location.blank? ? '' : 'from ' + twitterer.location} is at the Ribbon Farm door. #{twitterer.screen_name} #{twitterer.description}. It's #{Time.now.strftime('%I:%M%p') }."
      
      rib(note_duration)
      rest(ribbon_rest_duration)

      bon(note_duration)
      rest(farm_rest_duration)

      farm(note_duration)

      # `say -v #{voices[count % voices.length]} "#{greeting}"`
      `say -v Vicki "#{greeting}"`

      count += 1

      rest(1)
    end

    # close serial data line
    @@sp.close
    
    puts '...ended ruby code'

  end
  
  def self.rest(duration)
    sleep(duration)
  end
  def self.rib(duration)
    @@sp.write("1")
    sleep(duration)
    @@sp.write("0")
  end
  def self.bon(duration)
    @@sp.write("2")
    sleep(duration)
    @@sp.write("0")
  end
  def self.farm(duration)
    @@sp.write("3")
    sleep(duration)
    @@sp.write("0")
  end
end