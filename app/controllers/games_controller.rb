class GamesController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_action :logged_in_user

	def add_game
		name_of_game = 	params[:name_of_game]
		description  = 	params[:description]
		# no_of_balls  =	params[:no_of_balls]
		normal_ball  = 	params[:normal_ball]
		power_ball   = 	params[:power_ball]
		draw_day     = 	params[:draw_day]
		# status 		 = 	params[:status]
		# http://197.148.74.15:3005/api/games/add_game?name_of_game=Fantasy 5&description=Fantasy 5&no_of_balls=6&normal_ball=35&power_ball=0&draw_day=2017-07-21&status=1
		url = "http://197.148.74.15:3005/api/games/add_game?name_of_game=#{name_of_game}&description=#{description}&no_of_balls=0&normal_ball=#{normal_ball}&power_ball=#{power_ball}&draw_day=#{draw_day}&status=1"
		response = HTTParty.post(url).parsed_response
			
		if response.hash == 0

			flash[:danger] = "error"
			
		else
			flash[:success] = "Game Successfully added"
			render 'new'
		end
		
	end
	
	def new
		
	end

	def index
		url = "http://197.148.74.15:3005/api/games/get_games?"
		response = HTTParty.get(url).parsed_response.to_xml
		

		doc = Nokogiri::XML(response)
		
			

			hash = {}
			message = doc.at('objects')
			nameGame = message.search('object').map do |name|
			  name_of_game = name.at('name-of-game').text 
			 
			end
			@n = nameGame
			desc = message.search('object').map do |d|
			  
			  description = d.at('description').text

			end
			@d = desc


			noball = message.search('object').map do |n|
			  
			  no_balls = n.at('normal-ball').text

			end
			@nob = noball

			poball = message.search('object').map do |n|
			  
			  po_balls = n.at('power-ball').text

			end
			@pob = poball

			id = message.search('object').map do |n|
			  
			  i_d = n.at('id').text

			end
			@gameid = id

			@a = @n,@d,@nob,@pob,@gameid
		
	end

	def add_balls
		url = "http://197.148.74.15:3005/api/games/get_games?"
		response = HTTParty.get(url).parsed_response.to_xml
		

		doc = Nokogiri::XML(response)

			hash = {}
			message = doc.at('objects')
			nameGame = message.search('object').map do |name|
			  name_of_game = name.at('name-of-game').text 
			 
			end
			@n = nameGame

	end

	def winning_balls
		game_name 	= 	params[:game_name]
		first_ball  = 	params[:first_ball]
		second_ball =	params[:second_ball]
		third_ball  = 	params[:third_ball]
		fourth_ball =   params[:fourth_ball]
		fifth_ball  = 	params[:fifth_ball]
		power_ball  = 	params[:power_ball]
		draw_date  = 	params[:draw_date]
		url = "http://197.148.74.15:3005/api/games/winning_balls?game_name=#{game_name}&first_ball=#{first_ball}&second_ball=#{second_ball}&third_ball=#{third_ball}&fourth_ball=#{fourth_ball}&fifth_ball=#{fifth_ball}&power_ball=#{power_ball}&draw_date=#{draw_date}"
		
		response = HTTParty.post(url).parsed_response
			
		if response.hash == 0

			flash[:danger] = "error"
			
		else
			flash[:success] = "Winning Balls Successfully added"
			redirect_to (:back)
		end
	end

	def get_balls

		url = "http://197.148.74.15:3005/api/games/get_balls"
		response = HTTParty.get(url).parsed_response.to_xml
		

		doc = Nokogiri::XML(response)
		
			

			hash = {}
			ball = doc.at('objects')

			nameGame = ball.search('object').map do |name|
			  name_of_game = name.at('game-name').text 
			 
			end
			@n = nameGame

			firstBall = ball.search('object').map do |f|
			  f_ball = f.at('first-ball').text 
			 
			end
			@fb = firstBall
			secondBall = ball.search('object').map do |d|
			  
			  s_ball = d.at('second-ball').text

			end
			@sb = secondBall


			thirdBall = ball.search('object').map do |n|
			  
			  t_ball = n.at('third-ball').text

			end
			@tb = thirdBall

			fourthBall = ball.search('object').map do |n|
			  
			  ft_ball = n.at('fourth-ball').text

			end
			@ftb = fourthBall

			fifthBall = ball.search('object').map do |n|
			  
			  fifth_ball = n.at('fifth-ball').text

			end
			@ffb = fifthBall

			powerBall = ball.search('object').map do |n|
			  
			  p_ball = n.at('power-ball').text

			end
			@pb = powerBall

			createdAt = ball.search('object').map do |n|
			  
			  created_at = n.at('draw-date').text

			end
			@c_at = createdAt

			id = ball.search('object').map do |n|
			  
			  i_d = n.at('id').text

			end
			@gameid = id
			

			@a = @n,@fb,@sb,@tb,@ftb,@ffb,@pb,@c_at,@gameid
		
	end

	def show
		
	end

	def edit
		url = "http://197.148.74.15:3005/api/games/edit?id=#{params[:id]}"
		response = HTTParty.get(url).parsed_response.to_xml
		doc = Nokogiri::XML(response)
		doc.xpath("//hash").each do |node|
			@id = node.at('id').content.to_s
			@name = node.at('name-of-game').content.to_s
			@desc = node.at('description').content.to_s
			@normalBall = node.at('normal-ball').content.to_s
			@powerBall = node.at('power-ball').content.to_s
			@drawDay = node.at('draw-day').content
		end

	end

	def edit_balls
		url = "http://197.148.74.15:3005/api/games/edit_balls?id=#{params[:id]}"
		response = HTTParty.get(url).parsed_response.to_xml
		doc = Nokogiri::XML(response)
		doc.xpath("//hash").each do |node|
			@id = node.at('id').content.to_s
			@name = node.at('name-of-game').content.to_s
			@firstBall = node.at('first-ball').content.to_s
			@secondBall = node.at('second-ball').content.to_s
			@thirdBall = node.at('third-ball').content.to_s
			@fourthBall = node.at('fourth-ball').content.to_s
			@fifthBall = node.at('fifth-ball').content.to_s
			@powerBall = node.at('power-ball').content.to_s
			@drawDate = node.at('draw-date').content
		end

	end

	def update_balls
		id 			= params[:id]
		game_name 	= 	params[:game_name]
		first_ball  = 	params[:first_ball]
		second_ball =	params[:second_ball]
		third_ball  = 	params[:third_ball]
		fourth_ball =   params[:fourth_ball]
		fifth_ball  = 	params[:fifth_ball]
		power_ball  = 	params[:power_ball]
		draw_date  = 	params[:draw_date]
		url = "http://197.148.74.15:3005/api/games/update_balls?id=#{id}&game_name=#{game_name}&first_ball=#{first_ball}&second_ball=#{second_ball}&third_ball=#{third_ball}&fourth_ball=#{fourth_ball}&fifth_ball=#{fifth_ball}&power_ball=#{power_ball}&draw_date=#{draw_date}"
		
		response = HTTParty.post(url).parsed_response
		if response.hash == 0

			flash[:danger] = "error"
			
		else
			flash[:success] = "Games Successfully Updated"
			# redirect_to (:back)
			redirect_to :controller => "games", :action => "get_balls"
		end
	end

	def update
		id 			 = params[:id]
		name_of_game = 	params[:name_of_game]
		description  = 	params[:description]
		# no_of_balls  =	params[:no_of_balls]
		normal_ball  = 	params[:normal_ball]
		power_ball   = 	params[:power_ball]
		draw_day     = 	params[:draw_day]
		url = "http://197.148.74.15:3005/api/games/update?id=#{id}&name_of_game=#{name_of_game}&description=#{description}&no_of_balls=0&normal_ball=#{normal_ball}&power_ball=#{power_ball}&draw_day=#{draw_day}&status=1"
		
		response = HTTParty.post(url).parsed_response
		if response.hash == 0

			flash[:danger] = "error"
			
		else
			flash[:success] = "Games Successfully Updated"
			# redirect_to (:back)
			redirect_to :controller => "games", :action => "index"
		end
	end

	def destroy
		url = "http://197.148.74.15:3005/api/games/destroy?id=#{params[:id]}"

		response = HTTParty.post(url).parsed_response
			
		if response.hash == 0

			flash[:danger] = "error"
			
		else
			flash[:success] = "Games Successfully Deleted"
			redirect_to (:back)
		end
	end
	
end