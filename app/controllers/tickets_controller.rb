class TicketsController < ApplicationController
	before_action :logged_in_user
	def index
		
		url = "http://197.148.74.15:3005/api/tickets/get_tickets?"
		response = HTTParty.get(url).parsed_response.to_xml
		

		doc = Nokogiri::XML(response)
		
			

			hash = {}
			tickets = doc.at('tickets')

			gameName = tickets.search('ticket').map do |name|
			  game_name = name.at('name-of-game').text 
			 
			end
			@gameName = gameName

			ticket = tickets.search('ticket').map do |name|
			  f_ball = name.at('first-ball').text 
			 
			end
			@fb = ticket
			secondBall = tickets.search('ticket').map do |d|
			  
			  s_ball = d.at('second-ball').text

			end
			@sb = secondBall


			thirdBall = tickets.search('ticket').map do |n|
			  
			  t_ball = n.at('third-ball').text

			end
			@tb = thirdBall

			fourthBall = tickets.search('ticket').map do |n|
			  
			  ft_ball = n.at('fourth-ball').text

			end
			@ftb = fourthBall

			fifthBall = tickets.search('ticket').map do |n|
			  
			  fifth_ball = n.at('fifth-ball').text

			end
			@ffb = fifthBall

			powerBall = tickets.search('ticket').map do |n|
			  
			  p_ball = n.at('fortune-ball').text

			end
			@pb = powerBall

			createdAt = tickets.search('ticket').map do |n|
			  
			  created_at = n.at('created-at').text

			end
			@c_at = createdAt

			user = tickets.search('ticket').map do |n|
			  
			  u = n.at('user').text

			end
			@us = user

			ticketNumber = tickets.search('ticket').map do |n|
			  
			  tk = n.at('ticket-number').text

			end
			@tkn = ticketNumber

			@a = @gameName,@fb,@sb,@tb,@ftb,@ffb,@pb,@c_at,@us,@tkn
	end
	
	# def search
	# 	url = "http://197.148.74.15:3005/api/tickets/search?ticket_number=#{params[:ticket_number]}"
	# 	response = HTTParty.get(url).parsed_response.to_xml
	# 	doc = Nokogiri::XML(response)
	# 	doc.xpath("//hash").each do |node|
	# 		@id = node.at('id').content.to_s
	# 		@name = node.at('name-of-game').content.to_s
	# 		@firstBall = node.at('first-ball').content.to_s
	# 		@secondBall = node.at('second-ball').content.to_s
	# 		@thirdBall = node.at('third-ball').content.to_s
	# 		@fourthBall = node.at('fourth-ball').content.to_s
	# 		@fifthBall = node.at('fifth-ball').content.to_s
	# 		@fortuneBall = node.at('fortune-ball').content.to_s
	# 		@createdAt = node.at('created-at').content
	# 		@user = node.at('user').content.to_s
	# 		@ticketNumber = node.at('ticket-number').content.to_s
	# 	end
		
	# end

	def show
		url = "http://197.148.74.15:3005/api/tickets/search?ticket_number=#{params[:ticket_number]}"
		response = HTTParty.get(url).parsed_response.to_xml
		doc = Nokogiri::XML(response)
		doc.xpath("//hash").each do |node|
			@name = node.at('name-of-game').content.to_s
			@firstBall = node.at('first-ball').content.to_s
			@secondBall = node.at('second-ball').content.to_s
			@thirdBall = node.at('third-ball').content.to_s
			@fourthBall = node.at('fourth-ball').content.to_s
			@fifthBall = node.at('fifth-ball').content.to_s
			@fortuneBall = node.at('fortune-ball').content.to_s
			@createdAt = node.at('created-at').content
			@user = node.at('user').content.to_s
			@ticketNumber = node.at('ticket-number').content.to_s
		end
	end
end