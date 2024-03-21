class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  enum status: { active: 0, inactive: 1, deleted: 2 }, _default: :active

  validates_presence_of :name
  validates :email, uniqueness: true
  
  def destroy
    self.update_attribute(:status, 2)
  end
end
