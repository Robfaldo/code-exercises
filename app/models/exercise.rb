class Exercise < ApplicationRecord
  belongs_to :trail
  has_many :attempts, dependent: :destroy

  validates :number, presence: true
  validates :github_repo_url, presence: true

  validates_uniqueness_of :github_repo_url
end
