class User < ApplicationRecord
  extend Enumerize
  has_many :collections, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :masqueradable

  enumerize :locale, in: [:en, :ru]
  enumerize :theme, in: [:light, :dark]
end
