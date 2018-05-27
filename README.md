# Jungle

A mini e-commerce application built with Rails 4.2. New users can sign up and ensure their passwords have been encrypted. Admin users will be forced to put in a key and a password when attempting to visit the Admin page. As a user you are able to purchase items and will be sent an email reciept with your items and your total. As a user you are able to review and rate products. Users can delete only comments that they wrote.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Screenshots

!["Products list"](https://github.com/devnorris/jungle-rails/blob/master/app/docs/products_list.png)
!["Product"](https://github.com/devnorris/jungle-rails/blob/master/app/docs/product_page.png)
!["Delete own comment only"](https://github.com/devnorris/jungle-rails/blob/master/app/docs/delete_own_comment.png)
!["cart"](https://github.com/devnorris/jungle-rails/blob/master/app/docs/cart.png)
!["Order reciept"](https://github.com/devnorris/jungle-rails/blob/master/app/docs/order_reciept.png)

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
