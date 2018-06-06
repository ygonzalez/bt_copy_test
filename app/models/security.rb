class Security < ActiveRecord::Base
	belongs_to :account
	belongs_to :company

	def self.current
		where(current: true)
	end
end
