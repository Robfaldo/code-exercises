class Trail < ApplicationRecord
  has_many :exercises, dependent: :destroy

  validates :name, presence: true
end
