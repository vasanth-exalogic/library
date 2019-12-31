class Book < ApplicationRecord
    has_many :records
    has_many :users, through: :records
end
