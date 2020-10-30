class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  
  with_options presence: true do
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :nickname
    validates :first_name
    validates :last_name
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ンー－]+\z/, message: '全角カタカナを使用してください' } do
      validates :first_name_kana
      validates :last_name_kana
    end
    validates :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' , length: { minimum: 6, }
end
