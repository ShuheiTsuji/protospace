#table

##users table

name                string  
password            string  
works               text  
created_at          date  
updated_at          date  
member              string  
profile             text  
avatar              text  

##products table

catch_copy          text  
concept             text  
updated_at          date  
created_at          date  
title               string  
user_id             references  

##comments table

text                text  
product_id          references  
user_id             references  

##images table
role                integer  
image               text  
product_id          references  


##likes table

user_id             references  
product_id          references  

#association

product has_many commments  
product has_many likes  
product has_many images  
user has_many products  
user has_many comments  
user has_many likes  

comments belongs to product  
likes belongs to product  
products belongs to user  
comments belongs to user  
likes belongs to user  
images belongs to product  

