class Day < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :date, presence: true, uniqueness: true
end
