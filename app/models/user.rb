class User < ApplicationRecord
    #Necessary to authenticate
    has_secure_password

    has_many :user_products
    has_many :products, through: :user_products

    #Validations
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :email
    
    validates :email, uniqueness: true
    
    def add_product(product)
        self.products << product
    end
end
