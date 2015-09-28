# eCommerceOnRails
eCommerce on Rails  project is designed to showcase Ruby on Rails Framework in developing ecommerce platform. 

#Business Requirements

* Admin Services
  * Product Management - CRUD
  * Category Management - CRUD
  * Order Management - View Only
  * User Management - Create/View Only

* Store Services
  * Product Listing - View Only
  * Category Listing - View Only
  * Shopping Cart - CRUD
  * Order Placement - Create Only

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

# Testing Approach
RSpec is used as our unit testing tool. This project has unit test setup to validate each project's models required fields as well as controllers for presence of required actions as outlined in business requirements. Test Database must be provisioned and synced up with the project development database via `rake db:migrate RAILS_ENV=test`

This project is tested via executing individual test files via `rake test TEST=path_to_test_file` command line. 
Manual testing was performed for visual as well as integration testing

* Tests types set up with backend and frontend Rails applications are: 
 * Required Fields Validations
 * Uniqueness of the fields validations
 * Controller actions validations
 * Index presence validations

# Project Priorities in the order of development
* Architecture Design
 1. Define project domain and outline models for Product, Categories, Images, Cart and Orders
 2. Select Frontend Frameworks and set it up
 3. Select authentication framework and set it up 
 4. Select gems for image upload and friendly url
 5. Decide on project breakdown into two Backend and Frontend Rails applications for better separation of concerns, scalability and security

* Backend Rails application development
 1. Created initial Model migrations files as well as Controllers for the backend project
 2. Added and run unit test to ensure validations have been set up for models and controllers
 3. Ensured appropriate validations have been set up
 4. Added Bootstrap templated solution to the project
 5. Created views for backend Rails application
 6. Set up Authentication with the help of Devise Gem
 7. Populated test data for products, categories, images via admin UI and perform manual test
 8.  Added Friendly Url via Friendly_id Gem

* Frontend Rails application development
 1. Created sync.rake file for Models synchronization for the fronted project based on backend project migration files
 2. Added unit tests for frontend application controllers
 3. Generated frontend controllers for viewing Catalog of products as well as Shopping Cart management and Order placement
 4. Created Cart and Order models via backend migrations files
 5. Added Bootstrap templated solution to the project
 6. Created views for handling catalog, shopping cart and order placement functionality
 7. Added Friendly Url via Friendly_id Gem
 8. Manually tested shopping cart and order placement

* Wrote documentation
 1. Business and Technical Requirements
 2. Application Setup
 3. Testing strategy

# Additional Information 

* Important project considerations
 * Products are set up to have corresponding Variants for handling of product combinations based on size/color or other options as may be required in the future of this project
 * Variants can be two types: master and secondary. 
 * Each product must have at least one variant
 * Images are assigned directly to product model for now but can be extended by adding images to specific product variants
 * Categories are assigned to Variants and Products are filtered via Variants affiliation with the category
 * Taxonomy model in the form of many to many relationship between Variant and Category models is set up but not currently used
 * CanCan gem will be preferred choice for authorization implementation for future development
 * FactoryGirl gem will be preferred choice for unit testing for future development
 * Added Devise authentication as an extra binus for the project
 * Missed managing stock level requirement during alloted timeframe but will add this functionality as post release addition
 * Free Bootrtap template used for CSS/HTML look and feel of the site 

* Credits
 * Bootstrap Free Template by Themeum - http://www.themeum.com/
 * Sharing models between two projects approach - http://hiltmon.com/blog/2013/10/14/rails-tricks-sharing-the-model


