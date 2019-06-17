# Jungle

A mini e-commerce application built with Rails 4.2. Users can select from a variety of quirky and unusual products, whose similarities indicate a satire of Millenial society.

## Pix

!["The front page"](https://github.com/thomas-boyer/jungle-rails/blob/master/docs/jungle-1.png)
---
!["Display product details"](https://github.com/thomas-boyer/jungle-rails/blob/master/docs/jungle-2.png)
---
!["View all products from admin mode"](https://github.com/thomas-boyer/jungle-rails/blob/master/docs/jungle-3.png)
---
!["View products by category"](https://github.com/thomas-boyer/jungle-rails/blob/master/docs/jungle-4.png)
---
!["View cart"](https://github.com/thomas-boyer/jungle-rails/blob/master/docs/jungle-5.png)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Rename ".env.example" to ".env"
4. Sign up for a Stripe account
5. Paste your Stripe publishable and secret keys, as well as your desired Admin login credentials, in the .env file as indicated
6. Run `bin/rake db:reset` to create, load and seed db
7. Create .env file based on .env.example
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
