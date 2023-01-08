class Trail < ApplicationRecord
  has_many :exercises, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates_uniqueness_of :name
end
