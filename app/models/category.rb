class Category < ActiveRecord::Base
	has_many :article
end
