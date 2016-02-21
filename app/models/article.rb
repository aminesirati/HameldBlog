class Article < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 4 }
	validates :content, presence: true, length: { minimum: 30}
end
