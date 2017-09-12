class Security < ActiveRecord::Base
	belongs_to :account
	belongs_to :company
end
