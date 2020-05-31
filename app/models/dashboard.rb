class Dashboard < ApplicationRecord
  belongs_to :user

  validates :headline, presence: true
end
