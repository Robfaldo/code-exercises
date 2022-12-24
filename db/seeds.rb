# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |i|
  trail = Trail.create!(name: "Test trail #{i}")

  3.times do |ei|
    Exercise.create!(
      name: "Test exercise #{ei}",
      github_repo_url: "https://github.com/marley-coder/test-exercise",
      trail: trail
    )
  end
end

