# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.  This is the updated version, with bug fixes and features added!.

Bugs fixed are: 
- Money Formatting - Fixed errors were currency ($) symbol was not showing up.
- Missing Admin Security - Making sure only the admin had access to admin controls.

UI Updates are:
- Added a page for the cart if the cart is empty to re-direct the user back to the products page
- Added a sold out badge and made the Add to Cart button disabled if an item's inventory was 0.
- Added additional information about previous orders for a user to look over what they have ordered in the past.

Features added are:
- Admin Dashboard Counts - Provide an inventory and category count for the admin
- About Page - added an about page for the user to learn about the people behind Jungle!
- Admin Categories - added a feature allowing an admin to make new categories
- User Authentication - added a login and register pages, and logout option and created a new database table to handle users.

Tested with RSpec and Cypress.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server if in a VM, or `bin/rails s -p PORT`

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- RMagick