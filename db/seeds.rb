# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


if Rails.env.development?
  trail = Trail.create!(name: "Test trail", description: "In this trail you'll be building a class that formats a phone number using Ruby and RSpec. You'll be extending its functionality and implementing concepts and principles (such as Single Responsibility) that will make the code easier to reuse")
  Exercise.create!(
    number: 1,
    github_repo_url: "https://github.com/marley-coder/test-exercise",
    trail: trail
  )

  trail = Trail.create!(name: "Rails routes", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
  Exercise.create!(
    number: 2,
    github_repo_url: "https://github.com/marley-coder/showing-all-books",
    trail: trail
  )

  Exercise.create!(
    number: 1,
    github_repo_url: "https://github.com/marley-coder/creating-a-route",
    trail: trail
  )

  Exercise.create!(
    number: 3,
    github_repo_url: "https://github.com/marley-coder/showing-all-booksa",
    trail: trail
  )

  Exercise.create!(
    number: 4,
    github_repo_url: "https://github.com/marley-coder/showing-all-booksb",
    trail: trail
  )

  Exercise.create!(
    number: 5,
    github_repo_url: "https://github.com/marley-coder/showing-all-booksc",
    trail: trail
  )

  Exercise.create!(
    number: 6,
    github_repo_url: "https://github.com/marley-coder/showing-all-booksd",
    trail: trail
  )

  trail = Trail.create!(name: "Test doubles", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
  Exercise.create!(
    number: 1,
    github_repo_url: "https://github.com/marley-coder/doing-a-double",
    trail: trail
  )

else

  trail = Trail.create!(name: "Phone number formatter", description: "In this trail you'll be building a class that formats a phone number using Ruby and RSpec. You'll be extending its functionality and implementing concepts and principles (such as Single Responsibility) that will make the code easier to reuse")
  Exercise.create!(
    number: 1,
    github_repo_url: "https://github.com/codelix-org/phone-number-exercise-1",
    trail: trail
  )

  Exercise.create!(
    number: 2,
    github_repo_url: "https://github.com/codelix-org/phone-number-exercise-2",
    trail: trail
  )

  Exercise.create!(
    number: 3,
    github_repo_url: "https://github.com/codelix-org/phone-number-exercise-3",
    trail: trail
  )
end

