class Game < ActiveRecord::Base
	# establish_connection :game
	  # include ActiveModel::Model
	  include ActiveModel::Serializers::JSON
	  include ActiveModel::Serializers::Xml
	has_many :tickets	
end