class Company < ActiveRecord::Base
	has_many :securities
	has_many :plans, through: :securities
	validates :cusip, uniqueness: true

	def self.search(query)
  		where("name ilike ?", "%#{query}%") 
	end


end
