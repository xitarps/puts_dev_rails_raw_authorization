class Customer < ApplicationRecord
  has_one :user, as: :userable, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :user
end
