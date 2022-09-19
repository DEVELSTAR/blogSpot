class Article < ApplicationRecord
    include Visible
	validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10, too_short: "must contain atleast %{count} characters", 
                                               maximum: 500 , too_long: "may not exceed %{count} characters"}
    
    has_many :comments
end