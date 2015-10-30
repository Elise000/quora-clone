require 'byebug'

class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :questions_votes
  has_many :answers_votes

  # EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def self.authenticate(email, password)
    @user= User.find_by(:email => email)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end
end
