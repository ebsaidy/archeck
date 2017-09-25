class Ticket < ActiveRecord::Base
	# establish_connection :game
	# include ActiveModel::Serializers::JSON
	# include ActiveModel::Serializers::Xml
	belongs_to :game, :class_name => 'Game', :foreign_key => 'game_id'
	
end