class Parser
	def parse_file
		visits = {}
		sequences = {}
		file = File.open("logfile.txt")
		file.each do |line|
			data = line.split(/\s+/)
			if data.length == 2
				key = data[0].to_sym
				if visits.has_key?(key)
					visits[key] << data[1]
				else
					visits[key] = [data[1]]
				end
			end
		end

		visits.each do |user,record|
			if record.size >= 3
				pattern = record[0..2].join(" ")
				sequences.has_key?(pattern) ? sequences[pattern]+=1 : sequences[pattern]=1
				if record.size > 3
					for i in 1..record.size-3
						pattern = record[i..i+2].join(" ")
						sequences.has_key?(pattern) ? sequences[pattern]+=1 : sequences[pattern]=1
					end
				end
			end
		end

		pages = sequences.to_a.sort{|x,y| y[1]<=>x[1]}
		
		pages.each do |p|
			puts "count: #{p[1]} for sequence: #{p[0]}"
		end

	end

end

p = Parser.new

p.parse_file