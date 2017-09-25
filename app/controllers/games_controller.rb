# module Api
	# module V1
		class GamesController < ApplicationController
			include ActionController::ImplicitRender
			skip_before_filter :verify_authenticity_token
			def add_game
				@game = Game.new(:name_of_game => params[:name_of_game], :description=> params[:description], :no_of_balls => params[:no_of_balls], :normal_ball => params[:normal_ball], :power_ball => params[:power_ball], :draw_day => params[:draw_day], :status => 1)

				if @game.save
					
					result = {'Gam Millions' => game_params}

				else
					result = {'Gam Millions' => 0}
				end
				render xml: result
			end

			def winning_balls

				@ticket = Ball.new(:game_name => params[:game_name], :first_ball => params[:first_ball], :second_ball => params[:second_ball], :third_ball => params[:third_ball], 
					:fourth_ball => params[:fourth_ball], :fifth_ball => params[:fifth_ball], :power_ball => params[:power_ball], :draw_date => params[:draw_date])
				if @ticket.save
					
					result = 1 
					
				else
					result = 0
				end
				output = {'result' => result}
				render xml: output, :skip_types => true, :root => "output"

				
			end

			def get_game

				@date =  Game.where(status: 1)#.first

				
				 # output = {'output' => @date}

				 # render xml: output, :skip_types => true
				 # render xml: output
				render xml: @date, root: 'objects', children: 'object', skip_types: true

				
			end

			def get_balls
				#@ball = Ball.find_by_sql('SELECT id, game_name, first_ball, second_ball, third_ball, fourth_ball, fifth_ball, power_ball, draw_date FROM `balls` ORDER BY draw_date DESC;')
				@ball = Ball.order('draw_date DESC').all
				render xml: @ball, root: 'objects', children: 'object'#, skip_types: true
			end
			def get_games

				# url = "http://192.168.30.179:3005/api/vasservice/get_game?"
				# options = {basic_auth: {username: "VasService", password: "Afr1c3llv@s"}}
				# response = HTTParty.get(url,options).parsed_response.to_xml
				# render xml: response, :skip_types => true, root: 'output', :skip_types => true, :skip_instruct => true
				@date =  Game.where(status: 1)
				render json: @date, root: 'objects', children: 'object'
			end

			def edit
				@game = Game.find(params[:id])
				if !@game.blank?
					id = @game.id
					name = @game.name_of_game
					description = @game.description
					normal_ball = @game.normal_ball
					power_ball = @game.power_ball
					draw_day = @game.draw_day
					output = {'id' => id, 'name_of_game' => name, 'description' => description, 'normal_ball' => normal_ball, 'power_ball' => power_ball, 'draw_day' => draw_day}
					render xml: output
				end
				
			end

			def update
				@game = Game.find(params[:id])
				if @game.update_attributes(game_params)
					result = 1
					output = {'result' => 1}
				
					render xml: output
			# 	else
			# 		render 'edit'
				end
			end

			def edit_balls
				@ball = Ball.find(params[:id])
				if !@ball.blank?
					id = @ball.id
					name = @ball.game_name
					firstBall = @ball.first_ball
					secondBall = @ball.second_ball
					thirdBall = @ball.third_ball
					fourthBall = @ball.fourth_ball
					fifthBall = @ball.fifth_ball
					powerBall = @ball.power_ball
					draw_date = @ball.draw_date
					output = {'id' => id, 'name_of_game' => name, 'first_ball' => firstBall, 'second_ball' => secondBall, 'third_ball' => thirdBall, 'fourth_ball' => fourthBall, 'fifth_ball' => fifthBall, 'power_ball' => powerBall, 'draw_date' => draw_date}
					render xml: output
				end
			end

			def update_balls
				@ball = Ball.find(params[:id])
				if @ball.update_attributes(ball_params)
					result = 1
					output = {'result' => 1}
				
					render xml: output
			# 	else
			# 		render 'edit'
				end
			end

			def destroy
			Game.find(params[:id]).destroy

			result = 1
			output = {'result' => 1}
			# flash[:success] = "Game deleted"
			# redirect_to users_url
			render xml: output
			end

			private
			def game_params
				params.permit(:name_of_game, :description, :no_of_balls, :normal_ball, :power_ball, :draw_day, :status)
			#params.permit(:data)
			end

			def ball_params
				params.permit(:game_name, :first_ball, :second_ball, :third_ball, 
					:fourth_ball, :fifth_ball, :power_ball, :draw_date)
				
			end

		end
	# end
# end