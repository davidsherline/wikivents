class Event < ApplicationRecord
  belongs_to :day

  validates :title, presence: true
  validates :summary, presence: true
end
