class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :bailleur
  has_one :preneur

  accepts_nested_attributes_for :bailleur, :preneur

  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= 0
  end

  def admin?
    role == 1 
  end
  
end
