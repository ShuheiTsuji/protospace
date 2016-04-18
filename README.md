#users table

name                string  
password            string  
works               text  
created_at          date  
updated_at          date  
member              string  
profile             text  
avatar              text  

#products table

catch_copy          text  
concept             text  
updated_at          date  
created_at          date  
title               string  

#comments table

comment             text  
product_id          integer  
user_id             integer  

#images table
name                text  
product_id          integer  


#likes

user_id             integer  
product_id          integer  

#association

product has_many commments  
product has_many likes  
user has_many products  
user has_many comments  
user has_many likes  

*comments belongs to product  
likes belongs to product  
products belongs to user  
comments belongs to user  
likes belongs to user  