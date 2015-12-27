class Seller < ActiveRecord::Base
	has_many :addresses, dependent: :destroy
	validates :name , presence: {message: "should not be blank"}
	validates :price, numericality: {message: "should not be blank and it should be a number"}
  #   validate :custom_validation
 
  # def custom_validation
  # 	if self.name
  # 		errors.add(:name, "not blank")
  # 	end 
  # end
end
