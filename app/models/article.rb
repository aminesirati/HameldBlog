class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 4 }
	validates :content, presence: true, length: { minimum: 30}
end
