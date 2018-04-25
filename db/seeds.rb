# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Refinery::Pods::Engine.load_seed

Refinery::Videos::Engine.load_seed

# Added by Refinery CMS Portfolio Engine
Refinery::Portfolio::Engine.load_seed

Refinery::Banners::Engine.load_seed

# Added by Refinery CMS Inquiries engine
Refinery::Inquiries::Engine.load_seed

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by RefineryCMS Copywriting engine
Refinery::Copywriting::Engine.load_seed

# Added by Refinery CMS Employers extension
Refinery::Employers::Engine.load_seed

# Added by Refinery CMS Jobs extension
Refinery::Jobs::Engine.load_seed

# Added by Refinery CMS Products extension
Refinery::Products::Engine.load_seed

# Added by Refinery CMS Businesses extension
Refinery::Businesses::Engine.load_seed

# Added by Refinery CMS Customers extension
Refinery::Customers::Engine.load_seed

# Added by Refinery CMS Carts extension
Refinery::Carts::Engine.load_seed

# Added by Refinery CMS Orders extension
Refinery::Orders::Engine.load_seed

# Added by Refinery CMS Customer Files extension
Refinery::CustomerFiles::Engine.load_seed

# Added by Refinery CMS Aircrafts extension
Refinery::Aircrafts::Engine.load_seed

# Added by Refinery CMS Airlines extension
Refinery::Airlines::Engine.load_seed

# Added by Refinery CMS Articles extension
Refinery::Articles::Engine.load_seed

# Added by Refinery CMS Messages extension
Refinery::Messages::Engine.load_seed


# Added by Refinery CMS Languages extension
Refinery::Languages::Engine.load_seed

# Added by Refinery CMS Notifications extension
Refinery::Notifications::Engine.load_seed

# Added by Refinery CMS Faqs extension
Refinery::Faqs::Engine.load_seed

# Added by Refinery CMS Plans extension
Refinery::Plans::Engine.load_seed

# Added by Refinery CMS Route Experiences extension
Refinery::RouteExperiences::Engine.load_seed

# Added by Refinery CMS Subscriptions extension
Refinery::Subscriptions::Engine.load_seed

# Added by Refinery CMS Blog engine
Refinery::Blog::Engine.load_seed

# Added by Refinery CMS Invoices extension
Refinery::Invoices::Engine.load_seed
