require 'csv'  

task :import_master_accounts => [:environment] do
csv_text = File.read('lib/tasks/Manager_Account_Master_List.csv')
csv = CSV.parse(csv_text, :headers => true)
	csv.each do |row|
		acctid = row[0]
		man_name = row[1]
		manager = Manager.find_by(name: man_name)
		name = row[2]
		asset_class = row[3]
		puts "Account = #{ name }"
		Account.create(manager_id: manager.id, asset_class: asset_class, acctid: acctid, name: name, plan_id: 3)
	end
end