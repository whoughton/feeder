class Entry < ActiveRecord::Base
	belongs_to :feed

	validates :name, presence: true, length: { minimum: 2 }
	validates :url, presence: true, length: { minimum: 8 }
	validates :feed_id, presence: true
end
