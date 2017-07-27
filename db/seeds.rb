require 'json'

class_names = [ "organization", "user", "ticket" ]

class_names.each do |class_name|
  require_relative "../app/models/#{class_name}"

  file = File.read("assets/#{class_name + "s"}.json")
  instances_data = JSON.parse(file)

  instances_data.each do |instance_data|
    instance = eval(class_name.capitalize).find_or_initialize_by(_id: instance_data["_id"])
    instance.update(instance_data)
  end

  puts "Finished seeding #{class_name.capitalize}"
end
