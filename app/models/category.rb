class Category < ApplicationRecord
	has_many :fanpages, dependent: :destroy
end
