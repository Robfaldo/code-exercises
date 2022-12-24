# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

trail = Trail.create!(name: "Test trail")
Exercise.create!(
  name: "Test exercise",
  github_repo_url: "https://github.com/marley-coder/test-exercise",
  trail: trail
)

trail = Trail.create!(name: "Rails routes")
Exercise.create!(
  name: "Creating a route",
  github_repo_url: "https://github.com/marley-coder/creating-a-route",
  trail: trail
)
Exercise.create!(
  name: "Showing all books",
  github_repo_url: "https://github.com/marley-coder/showing-all-books",
  trail: trail
)

trail = Trail.create!(name: "Test doubles")
Exercise.create!(
  name: "Doing a double",
  github_repo_url: "https://github.com/marley-coder/doing-a-double",
  trail: trail
)
