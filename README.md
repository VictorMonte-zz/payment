# Payment

Payment is an app to provide payment for customer and checkout.
Only for study purpose, not ready for production.

# Features!

  - Endpoints
    - Create Buyers
    - Create Credit Card
    - Create Payments
      - Credit
      - Debit

  - Página de Checkout

### Tech

  I choose this stack, because it's not my actual stack as a developer. My
 background is mostly c#. The stack was compose by basic rails's stack, and 
little bit of bootstrap to help me building the checkout page.
  The architecture is based on MVC, but Service layer is used to avoid
 fat controllers. RSpec gem is my right hand to make unit testing.

  * Front end
    * [Html, Css, Bootstrap 4] - web apps with responsible layout.

  * Back end
    * [Ruby on Rails] - OOP enterpreted language.

  * Database
    * [Postgres] - relational DB

### Installation

  Payment required last version of Ruby 2.5 and Rails 5.1.4.
  ** Postgres must be running with a user, that can be configured in
database.yml

```sh
$ cd payment
$ bundle install
$ rails server
```

### Todos

  - Write more tests
  - Use more rails fetch
  - Alter instance for class methods
  - Less verbal services
  - Duck type
  - Avoid compositions

