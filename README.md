#users table
user_id             integer
name                string
password            string
works               text
created_at          date
updated_at          date
member              string
profile             text
avatar              text

#products table
catch copy          text
concept             text
img_url             text
updated_at          date
created_at          date
title               string

#comments table
comment             text
product_id          integer
user_id             integer

#tags gem
tag name            string
product_id          integer
user_id             integer

#likes
user_id             integer
product_id          integer

#association
product has_many commments
product has_many tags
product has_many likes
user has_many products
user has_many comments
user has_many likes
tag has_many products