class Feed < ActiveRecord::Base
	belongs_to :user
	has_many :entries

	validates :name, presence: true, length: { minimum: 2 }
	validates :user_id, presence: true
end
