# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "esaidy",
			full_name: "Ebrima Saidy",
			department: "Sales",
			password: "$2a$10$CfUI/a1VinFZrlKf4.lKO.oCp35s/sIUvW4hzL/om8dBJoBemJjga",
			password_confirmation: "$2a$10$CfUI/a1VinFZrlKf4.lKO.oCp35s/sIUvW4hzL/om8dBJoBemJjga",
			role: "admin",
			remember_digest: "",
			report_role: "super",
			added_by: "esaidy")