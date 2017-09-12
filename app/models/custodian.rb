class Custodian < ActiveRecord::Base
	has_many :plans

	def self.search(query)
  		where("name ilike ?", "%#{query}%") 
	end

end