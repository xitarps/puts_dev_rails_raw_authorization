class User < ApplicationRecord
  USERABLES = %i[Root Admin Customer]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :userable, polymorphic: true
  accepts_nested_attributes_for :userable

  def userable_attributes=(attributes)
    if userable_type.nil?
      userable_type = 'Customer'
      self.userable_type = 'Customer'
    end
    if USERABLES.include?(userable_type.to_sym)
      self.userable ||= self.userable_type.constantize.new
      self.userable.assign_attributes(attributes)
    end
  end
end
