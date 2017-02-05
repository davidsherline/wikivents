class Day < ApplicationRecord
  validates :date, presence: true, uniqueness: true
end
