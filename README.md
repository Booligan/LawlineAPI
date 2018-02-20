# LawlineAPI

This application is a simple RESTful API that manages a database of users and products(coffee). Built with Ruby on Rails and MySQL DB.

##Installation
Follow commands to clone repo and set up the DB.

```
git clone git@github.com:Booligan/LawlineAPI.git
cd LawlineAPI
rails db:create 
rails db:migrate
rails db:seed
```
##Usage

The DB is seeded with data created from the FAKER gem. The admin account is: 
email: admin@lawline.com
password: '123456789'

We will use this account to navigate through the API.

###Authentication

To authenticate the user. Send a JSON POST request to http://localhost:3000/api/user_token
{
	"auth":{
		"email":"admin@lawline.com",
		"password": "123456789"
	}
}

 A JSON Web token will be returned: 

 {
    "jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MTkxOTY3OTcsInN1YiI6MX0.gWRuJtSG6lRkNI_BcVMrLI5JIFvt2nfixSNuu4NiWyw"
} 

*NOTE: Your token will be different, and expires after ONE day.*

### Routes

When making requests, you will need to include the Bearer + the JSON web token in the request header.

USING token from above as an example:

```
Key: Authorization
Value: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MTkxOTY3OTcsInN1YiI6MX0.gWRuJtSG6lRkNI_BcVMrLI5JIFvt2nfixSNuu4NiWyw
```
_ROUTES_

Add product: POST - http://localhost:3000/api/products
Update product: PUT - http://localhost:3000/api/products/{:product_id}
Delete product: DELETE - http://localhost:3000/api/products/{:product_id}
Get Product: GET - http://localhost:3000/api/products/{:product_id}
Upload Product Image: POST - http://localhost:3000/api/products/{:product_id}/image
List of all products: GET http://localhost:3000/api/products
Attach product to user: POST - http://localhost:3000/api/products/{:product_id}/add
Remove product from user: DELETE - http://localhost:3000/api/products/{:product_id}/remove
List of products attached to user: GET http://localhost:3000/api/users/{:user_id}/products

Product params require :product. Example:
{
	"product":{
		"image":"test_image"
	}
}

#License

Copyright &copy 2018 Alberto Mayanga, SEE [LICENSE](http://https://github.com/Booligan/Lawline/blob/master/LICENSE.md) for more details.

