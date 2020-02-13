class User < ApplicationRecord
    validates :name, uniqueness: true   
    validates :name, presence: true
    validates :password_digest, presence: true

    has_many :notes
end
