users = []
File.open('logfile.txt', 'r').each_line do |line|
	users << line.chomp.split(' ')
end


hash=Hash.new
users.each do |user_id, page_visited|
	if hash.has_key?(user_id)
	 hash[user_id] << page_visited
	 else 
	 hash[user_id] = [page_visited]
	end
end

sequencecounter = Hash.new

hash.each do |user_id, page_visited|
	start_index = 0
	end_index = 2
	(page_visited.length-2).times do
		sequencer = page_visited[start_index..end_index].join(" ")
		start_index += 1
		#same as
		#start_index = start_index + 1
		end_index += 1
		if sequencecounter.has_key?(sequencer)
			sequencecounter[sequencer] +=1
		else
			sequencecounter[sequencer] = 1
		end
	end
end

puts sequencecounter.to_a.sort{|x,y| y[1]<=>x[1]}