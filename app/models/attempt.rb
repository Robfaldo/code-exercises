class Attempt < ApplicationRecord
  belongs_to :exercise
  belongs_to :user

  validates :github_pr_url, presence: true
  validates :github_repo_url, presence: true
end
