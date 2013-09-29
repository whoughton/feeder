class User < ActiveRecord::Base
	has_many :feeds
	has_many :entries, through: :feeds
	
	validates :name, presence: true, length: { minimum: 2 }
end
