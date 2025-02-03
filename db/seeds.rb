# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
User.find_or_create_by!(email: "alice@email.com") do |user|
  user.name = "Alice Gamer"
  user.password = "password123"
  user.password_confirmation = "password123"
  user.time_zone = "Eastern Time (US & Canada)"
end

User.find_or_create_by!(email: "bob@email.com") do |user|
  user.name = "Bob Player"
  user.password = "securepass"
  user.password_confirmation = "securepass"
  user.time_zone = "Pacific Time (US & Canada)"
end
