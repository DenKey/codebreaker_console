class Helper
  class << self
    def numeric?(lookAhead)
      lookAhead =~ /[[:digit:]]/
    end

    def view_stats file = 'game.json'
	  if File.exist? file
	    array = []
	      File.open(file, "r") do |infile|
	        while (line = infile.gets)
	          array << JSON.parse(line)
	        end
	      end
	    array
	  end
	end

	def save file = 'game.json', game
	  begin
	    file = File.open(file, "a")
	    data = game.user_data
	    file.puts(data.to_json) 
	  rescue IOError => e
	    puts "Can't save data into file".color(:red)
	  ensure
	    file.close unless file.nil?
	  end
	end

  end	
end