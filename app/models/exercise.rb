class Exercise < ApplicationRecord
  belongs_to :trail

  validates :name, presence: true
  validates :github_repo_url, presence: true
end
