task :assetclass => [:environment] do
	@accounts = Account.all
	@accounts.each do |account|
		ac = account.asset_class
		puts "asset_class = #{ ac }"
		ac_id = AssetClass.find_by("name = ?", ac)
		account.update_attributes(asset_class_id: ac_id.id)
	end
end