# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


MnState.create([{ :name => 'Sacramento', :zip => 94203},
                { name: 'Los Angeles', :zip => 90001 },
                { name: 'Denver', :zip => 80201 }
               ])