class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy
  has_many :chat_rooms, through: :messages

  after_create :assign_role

  def assign_role
    if student
      Student.create!(email: email, user: self, name: name)
    # else
    #   Facility.create!(email:email, user: self)
    end
  end


end

