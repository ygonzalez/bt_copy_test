class Manager < ActiveRecord::Base
	has_many :accounts
	has_one :plan, through: :accounts
	has_many :asset_classes, through: :accounts

	def self.search(query)
  		where("man_name ilike ?", "%#{query}%") 
	end

	def total
		total = self.accounts.sum(:market_value)
	end

	def self.asset_class_find(asset_class_id)
		includes(:accounts).where('accounts.asset_class_id = ?', asset_class_id)
	end

end

