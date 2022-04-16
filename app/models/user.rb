class User < ApplicationRecord
    #データを保存する前にメアドを小文字にする。
    before_save { email.downcase! }
    # name は必ず存在し、長さが50字以内であること
    validates :name, presence: true, length: { maximum: 50 }
    # メールアドレスのフォーマットを「正規表現」を使って指定
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #email は必ず存在し、長さが255字以内
    #メールアドレスのフォーマットになっている
    #メールアドレスはユニーク（同じデータが存在してはいけない）
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
