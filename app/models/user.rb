require 'byebug'

class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  # EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def self.authenticate(email, password)
    @u= User.find_by(:email => email)
    if @u && @u.password == password
      @u
    else
      nil
    end
  end
end
