class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity
  def password_complexity
# Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
  return if password.blank? || password =~ /^(?=.*?[a-z])(?=.*?[0-9]).{6,70}$/
      errors.add :password, 'Complexity requirement not met. Length should be 6-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  with_options presence: true do
    validates :first_name ,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name ,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana,format: {with: /\A[ァ-ヶー－]+\z/}
    validates :last_name_kana,format: {with: /\A[ァ-ヶー－]+\z/}
  end

  validates :nickname, presence: true
  validates :birthday, presence: true
end
