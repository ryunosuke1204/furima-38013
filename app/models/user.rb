class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         #has_many :purchase_managements
         has_many :items

         validates :nickname, presence: true
         validates :last_name, presence: true,format:{with:/[^\x01-\x7Eｦ-ﾟ]+/,message:"Please enter in full-width."}   
         validates :first_name, presence: true,format:{with:/[^\x01-\x7Eｦ-ﾟ]+/,message:"Please enter in full-width."}     
         validates :last_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
         validates :first_name_kana, presence: true,  format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
         validates :birth_day, presence: true
         validates :password,presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Password must include both single-byte alphanumerical characters" }
        end
