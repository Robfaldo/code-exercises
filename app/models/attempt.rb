class Attempt < ApplicationRecord
  belongs_to :exercise

  validates :github_pr_url, presence: true
  validates :github_repo_url, presence: true
end
