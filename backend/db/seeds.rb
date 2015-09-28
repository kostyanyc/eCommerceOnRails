# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Order.delete_all
CartLineItem.delete_all
Cart.delete_all


Category.delete_all
Category.create(id: 1, title: 'Paintings', slug: 'paintings', description: 'Paniting by Famouse artists', sort_order: 1, meta_title: 'Paintings', meta_description: 'Paniting by Famouse artists', meta_keywords: 'paintings')
Category.create(id: 2, title: 'Photos', slug: 'photos', description: 'Photos by Famouse artists', sort_order: 2, meta_title: 'Photos', meta_description: 'Photos by Famouse artists', meta_keywords: 'paintings')

Product.delete_all
Product.create(id:1, title: 'Tulips', slug: 'tulips', description: 'Photo of Tulips for sale', meta_title: 'Tulips', meta_description: 'Photo of Tulips for sale', meta_keywords: 'tulips')
Product.create(id:2, title: 'Desert', slug: 'desert', description: 'Photo of Desert for sale', meta_title: 'Desert', meta_description: 'Photo of Desert for sale', meta_keywords: 'desert')
Product.create(id:3, title: 'Penguins', slug: 'penguins', description: 'Photo of Penguins for sale', meta_title: 'Penguins', meta_description: 'Photo of Penguins for sale', meta_keywords: 'penguins')

Image.delete_all
Image.create(id:1, file_name: 'tulips.jpg', title: 'Tulips', description: 'Photo of Tulips for sale', meta_alt: 'Tulips', product_id: 1, asset_file_name: 'Tulips.jpg', asset_content_type: 'image/jpg', asset_file_size: 620888, asset_updated_at: '2015-09-22')
Image.create(id:2, file_name: 'desert.jpg', title: 'Desert', description: 'Paintings of Desert for sale', meta_alt: 'Desert', product_id: 2, asset_file_name: 'Desert.jpg', asset_content_type: 'image/jpg', asset_file_size: 845941, asset_updated_at: '2015-09-22')
Image.create(id:3, file_name: 'penguins.jpg', title: 'Penguins', description: 'Photo of Penguins for sale', meta_alt: 'Penguins', product_id: 3, asset_file_name: 'Penguins.jpg', asset_content_type: 'image/jpg', asset_file_size: 777835, asset_updated_at: '2015-09-22')

Variant.delete_all
Variant.create(id:1, sku: 'sku001', price: '15.00', stock_level: '10', is_prime: true, product_id: '1', category_id: '1')
Variant.create(id:2, sku: 'sku002', price: '30.00', stock_level: '10', is_prime: true, product_id: '2', category_id: '1')
Variant.create(id:3, sku: 'sku003', price: '45.00', stock_level: '10', is_prime: true, product_id: '3', category_id: '2')