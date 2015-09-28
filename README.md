# eCommerceOnRails
eCommerce on Rails  project is designed to showcase Ruby on Rails Framework in developing ecommerce platform. 

#Business Requirements

* Admin Services
  * Product Management
  * Category Management
  * Order Management
  * User Management

* Store Services
  * Product Listing
  * Category Listing
  * Shopping Cart
  * Order Placement

# Technical Requirements
The following is the list of services required to set up and run eCommerce on Rails project

* Frontend - in addition to out of the box Rails 4 gems such as Byebug, Turbolinks, SDoc, etc... the following frameworks are being utilized in the project
  * CSS Framework is based on Twitter Bootstrap 3 - http://getbootstrap.com
  * SASS Preprocessor - http://sass-lang.com
  * Image Upload Services utilizes PaperClip Gem - https://github.com/thoughtbot/paperclip
  * Authentication Services utilizes Devise Gem - https://github.com/plataformatec/devise
  * Friendly Url utilizes Friendly Id Gem - https://github.com/norman/friendly_id

* Backend
 * PostgreSQL is selected as RDBMS for this project

# Application Setup 
eCommerce on Rails is broken down into two Rails application each designed to fulfil business requirements outlined above. 

* Backend Rails application
  * Contains all of the models as well as migration files and seed data for eCommerce application
  * Requires the following Gems to be included in Gemfile in addition to standard Rails 4 out of the box Gems
    * gem "devise"
    * gem "paperclip", "~> 4.3"
    * gem "friendly_id", "~> 5.0.1"
    * gem "pg"
    
* Frontend Rails application
  * Contains eCommerce shopping cart and order placement code as well as sharing models from Backend Rails application
    * There is a specific Rake Task setup to synchronize all of the project models as well as assets from the Backend Application. This file is called sync.rake and is required to be run via rake `rake sync:copy` command every time new model is added to the Backend Rails application
    ```
    namespace :sync do
    
      desc 'Copy common models and tests from Master'
      task :copy do
        source_path = 'C:\DEV\eCommerceOnRails\backend'
        dest_path = 'C:\DEV\eCommerceOnRails\frontend'
    
        # Copy all models & tests
        %x{cp #{source_path}/app/models/*.rb #{dest_path}/app/models/}
        %x{cp #{source_path}/test/models/*_test.rb #{dest_path}/test/models/}
    
        # Fixtures
        %x{cp #{source_path}/test/fixtures/*.yml #{dest_path}/test/fixtures/}
    
        # Database YML
        %x{cp #{source_path}/config/database.yml #{dest_path}/config/database.yml}
    
        # CSS/JS
         %x{cp #{source_path}/vendor/assets/stylesheets/main.css #{dest_path}/vendor/assets/stylesheets/main.css}
    
        #Images recursive copy for uploaded assets
        %x{cp -r #{source_path}/public/system/images/assets/* #{dest_path}/public/system/images/assets/}
    
    
      end
    end
   ```
  * Requires the following Gems to be included in Gemfile in addition to standard Rails 4 out of the box Gems
    * gem "devise"
    * gem "paperclip", "~> 4.3"
    * gem "friendly_id", "~> 5.0.1"
    * gem "pg"



