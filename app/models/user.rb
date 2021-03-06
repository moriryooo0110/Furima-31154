class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity
  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[a-z])(?=.*?[0-9]).{6,70}$/

    errors.add :password, 'Complexity requirement not met. Length should be 6-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :nickname
    validates :birthday
  end

  has_many :items
  has_many :item_purchases
end
