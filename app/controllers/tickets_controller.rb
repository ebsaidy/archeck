class TicketsController < ApplicationController
			include ActionController::ImplicitRender
			skip_before_filter :verify_authenticity_token
			# respond_to :json
	
	
			def add_balls
				
				@day = Date.today.to_s[0..3]
				@month = Date.today.to_s[5..6]
				@yr = Date.today.to_s[8..9]

				@reference = @month+@day+@yr
				@td = TicketNumber.new(:date => @reference).save
				@ti = TicketNumber.maximum("id")
				@tn = TicketNumber.maximum("date")
				@ticket = Ticket.new(:game_id => params[:game_id], :first_ball => params[:first_ball], :second_ball => params[:second_ball], :third_ball => params[:third_ball], 
					:fourth_ball => params[:fourth_ball], :fifth_ball => params[:fifth_ball], :fortune_ball => params[:fortune_ball], :user => params[:user], :ticket_number => @tn.to_s+@ti.to_s, :source_ip =>request.remote_ip)
				if @ticket.save
					
					result = 1 
					
				else
					result = 0
				end
				output = {'result' => result, 'ticket_number' => @tn.to_s+@ti.to_s, 'created_at' => Time.now.strftime("%c")}
				render xml: output, :skip_types => true, :root => "output"
			end

			def get_tickets
				tickets = Ticket.find_by_sql("SELECT * FROM games LEFT JOIN tickets on games.id = tickets.game_id")
				
				render xml: tickets, :skip_types => true
			end

			def search
			
				@search = Ticket.where(ticket_number: params[:ticket_number]).first
				if !@search.blank?
				fisb = @search.first_ball
				sb = @search.second_ball
				tb = @search.third_ball
				fb = @search.fourth_ball
				fitb = @search.fifth_ball
				fob = @search.fortune_ball
				date = @search.created_at
				user = @search.user
				tkn = @search.ticket_number
				id = @search.game_id
				gameid = Game.where(id: id).first
				gamename = gameid.name_of_game

				output = {"name_of_game" => gamename,"first_ball" => fisb, "second_ball" => sb, "third_ball" => tb, "fourth_ball" => fb, "fifth_ball" => fitb, "fortune_ball" => fob, "created_at" => date, "user" => user, "ticket_number" => tkn}
				else 
					output = {'result' => 0}
				end
				render xml: output

				
			end

			def destroy
				
				ticket = Ticket.where(ticket_number: params[:ticket_number]).where(user: params[:user]).where('created_at >= ?', 5.minutes.ago).first
				if !ticket.blank?
					# ticket.destroy
					ticket.update_attributes(:deleted => 1)
				output = {'result' => 1}
				else
					
					output = {'result' => 0}
				end
				render xml: output
			end

			private
			def ball_params
				params.permit(:game_id, :first_ball, :second_ball, :third_ball, :fourth_ball, :fifth_ball, :fortune_ball, :user)
			end
end
