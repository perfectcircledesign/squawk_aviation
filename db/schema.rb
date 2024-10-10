# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20241010082350) do

  create_table "article_job_lookups", :force => true do |t|
    t.integer  "job_id"
    t.integer  "airline_id"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "aviation_certification_details", :force => true do |t|
    t.string   "license_type"
    t.string   "license_number"
    t.string   "country_of_issue"
    t.date     "date_of_issue"
    t.date     "date_of_expiry"
    t.integer  "customer_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "license_authority"
    t.boolean  "mcc",               :default => false
    t.boolean  "dangerous_goods",   :default => false
    t.boolean  "crm",               :default => false
    t.boolean  "tcas_acas",         :default => false
    t.boolean  "lvo",               :default => false
    t.boolean  "rnav_gnss",         :default => false
    t.boolean  "rvsm",              :default => false
    t.boolean  "cfit_gpws",         :default => false
    t.boolean  "etops",             :default => false
    t.integer  "file_id"
  end

  create_table "aviation_education_details", :force => true do |t|
    t.string   "program"
    t.string   "institution"
    t.string   "period"
    t.integer  "customer_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "education_type"
  end

  create_table "aviation_records", :force => true do |t|
    t.string   "employer"
    t.string   "aircraft"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "ca"
    t.string   "fo"
    t.string   "total"
    t.string   "reason_for_leaving"
    t.integer  "customer_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "current_work",       :default => false
    t.string   "notice_period"
    t.string   "position_held"
  end

  create_table "cabin_certifications", :force => true do |t|
    t.string   "license_authority"
    t.boolean  "first_aid"
    t.boolean  "CRM"
    t.boolean  "SEPT"
    t.boolean  "DG"
    t.boolean  "Ditching"
    t.boolean  "Fire_fighting"
    t.integer  "file_id"
    t.integer  "customer_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "credit_cards", :force => true do |t|
    t.integer  "customer_id"
    t.string   "bin"
    t.string   "last_digits"
    t.string   "holder"
    t.string   "exp_month"
    t.string   "exp_year"
    t.string   "brand"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "token"
  end

  create_table "favourites", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "airline_id"
    t.integer  "job_id"
    t.string   "who_favourite"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "flying_hours", :force => true do |t|
    t.string   "mtow"
    t.string   "aircraft"
    t.date     "date_first_flown"
    t.date     "date_last_flown"
    t.string   "total"
    t.integer  "customer_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "aircraft_id"
    t.float    "ca"
    t.float    "fo"
    t.float    "cruise_only_pilot"
  end

  create_table "flying_hours_cabins", :force => true do |t|
    t.integer  "aircraft_id"
    t.date     "date_first_flown"
    t.date     "date_last_flown"
    t.string   "total_hours"
    t.integer  "customer_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "flight_attendant"
    t.integer  "purser"
    t.integer  "chief_purser"
  end

  create_table "maintenance_certifications", :force => true do |t|
    t.string   "license_authority"
    t.string   "license_type"
    t.integer  "customer_id"
    t.integer  "file_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "maintenance_hours", :force => true do |t|
    t.integer  "aircraft_id"
    t.boolean  "airframe"
    t.boolean  "power_plant"
    t.boolean  "fuel"
    t.boolean  "pneumatic"
    t.boolean  "hydraulics"
    t.boolean  "avionics"
    t.boolean  "electrical"
    t.boolean  "interiors"
    t.integer  "total_hours"
    t.integer  "customer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "references", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "contact_details"
    t.string   "job_position"
    t.integer  "customer_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "email"
  end

  create_table "refinery_aircrafts", :force => true do |t|
    t.string   "name"
    t.string   "weight"
    t.string   "engine"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_airlines", :force => true do |t|
    t.string   "name"
    t.string   "contact_number"
    t.integer  "position"
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "airline_name"
    t.text     "head_office_address"
    t.integer  "logo_id"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "googleplus"
    t.string   "website"
    t.text     "description"
    t.integer  "last_notification_id"
    t.integer  "views_count",            :default => 0
    t.boolean  "valid_airline",          :default => false
    t.string   "company_size"
    t.integer  "image1_id"
    t.integer  "image2_id"
    t.integer  "image3_id"
    t.integer  "image4_id"
    t.integer  "image5_id"
    t.integer  "sliver_id"
  end

  add_index "refinery_airlines", ["email"], :name => "index_refinery_airlines_on_email", :unique => true
  add_index "refinery_airlines", ["reset_password_token"], :name => "index_refinery_airlines_on_reset_password_token", :unique => true

  create_table "refinery_airlines_customers", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "airline_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "refinery_airlines_customers", ["airline_id"], :name => "index_refinery_airlines_customers_on_airline_id"
  add_index "refinery_airlines_customers", ["customer_id"], :name => "index_refinery_airlines_customers_on_customer_id"

  create_table "refinery_articles", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "image_id"
    t.integer  "airline_id"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "url"
  end

  create_table "refinery_banners", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "description"
    t.integer  "image_id"
    t.string   "url"
    t.boolean  "is_active"
    t.date     "start_date"
    t.date     "expiry_date"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "refinery_banners_pages", :id => false, :force => true do |t|
    t.integer "page_id"
    t.integer "banner_id"
  end

  add_index "refinery_banners_pages", ["banner_id"], :name => "index_refinery_banners_pages_on_banner_id"
  add_index "refinery_banners_pages", ["page_id"], :name => "index_refinery_banners_pages_on_page_id"

  create_table "refinery_blog_categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "cached_slug"
    t.string   "slug"
  end

  add_index "refinery_blog_categories", ["id"], :name => "index_refinery_blog_categories_on_id"
  add_index "refinery_blog_categories", ["slug"], :name => "index_refinery_blog_categories_on_slug"

  create_table "refinery_blog_categories_blog_posts", :force => true do |t|
    t.integer "blog_category_id"
    t.integer "blog_post_id"
  end

  add_index "refinery_blog_categories_blog_posts", ["blog_category_id", "blog_post_id"], :name => "index_blog_categories_blog_posts_on_bc_and_bp"

  create_table "refinery_blog_comments", :force => true do |t|
    t.integer  "blog_post_id"
    t.boolean  "spam"
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.string   "state"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "refinery_blog_comments", ["id"], :name => "index_refinery_blog_comments_on_id"

  create_table "refinery_blog_posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "draft"
    t.datetime "published_at"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "user_id"
    t.string   "cached_slug"
    t.string   "custom_url"
    t.text     "custom_teaser"
    t.string   "source_url"
    t.string   "source_url_title"
    t.integer  "access_count",     :default => 0
    t.string   "slug"
    t.integer  "image_id"
  end

  add_index "refinery_blog_posts", ["access_count"], :name => "index_refinery_blog_posts_on_access_count"
  add_index "refinery_blog_posts", ["id"], :name => "index_refinery_blog_posts_on_id"
  add_index "refinery_blog_posts", ["slug"], :name => "index_refinery_blog_posts_on_slug"

  create_table "refinery_businesses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "refinery_carts", :force => true do |t|
    t.integer  "customer_id"
    t.boolean  "is_current"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "coupon_id"
  end

  create_table "refinery_copywriting_phrase_translations", :force => true do |t|
    t.integer  "refinery_copywriting_phrase_id"
    t.string   "locale"
    t.text     "value"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "refinery_copywriting_phrase_translations", ["locale"], :name => "index_copywriting_phrase_translations_on_locale"
  add_index "refinery_copywriting_phrase_translations", ["refinery_copywriting_phrase_id"], :name => "index_c8fbec01a288d0aef8ba987126084c4d06953304"

  create_table "refinery_copywriting_phrases", :force => true do |t|
    t.string   "name"
    t.text     "default"
    t.text     "value"
    t.string   "scope"
    t.integer  "page_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "phrase_type"
    t.date     "last_access_at"
  end

  add_index "refinery_copywriting_phrases", ["name", "scope"], :name => "index_copywriting_phrases_on_name_and_scope"

  create_table "refinery_customer_files", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.integer  "position"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "customer_id"
  end

  create_table "refinery_customers", :force => true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "contact_number"
    t.string   "fax_number"
    t.boolean  "is_company",                  :default => true
    t.string   "company_name"
    t.string   "company_registration_number"
    t.string   "company_vat_number"
    t.integer  "position"
    t.string   "email",                       :default => "",    :null => false
    t.string   "encrypted_password",          :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "province"
    t.string   "sport"
    t.boolean  "register_for_wholesale"
    t.boolean  "is_wholesale"
    t.string   "dob"
    t.integer  "age"
    t.string   "nationality"
    t.string   "gender"
    t.date     "ppc_date"
    t.date     "ppc_expiry_date"
    t.date     "ir_date"
    t.date     "ir_expiry_date"
    t.string   "pass_12_months_hours_flown"
    t.string   "dual_nationality_details"
    t.string   "marital_period"
    t.string   "notice_period"
    t.string   "icao"
    t.boolean  "military_commitment"
    t.boolean  "previously_interviewed"
    t.boolean  "previously_employed"
    t.boolean  "any_aircraft_accident"
    t.boolean  "any_criminal_records"
    t.string   "current_position"
    t.string   "current_aircraft"
    t.string   "current_airline"
    t.text     "address"
    t.string   "customer_country"
    t.string   "interviewed_if_yes"
    t.string   "employed_if_yes"
    t.text     "accident_if_yes"
    t.string   "online_application_number"
    t.integer  "profile_image_id"
    t.date     "date_of_birth"
    t.text     "cover_letter"
    t.float    "p1"
    t.float    "p2"
    t.float    "p3"
    t.boolean  "turbine",                     :default => false
    t.boolean  "more_than",                   :default => false
    t.string   "other_number"
    t.string   "phone_extension1"
    t.string   "phone_extension2"
    t.integer  "last_notification_id"
    t.integer  "views_count",                 :default => 0
    t.string   "career_path"
    t.integer  "total_flying_time"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_image_url"
    t.string   "small_facebook_image_url"
    t.string   "linkedin_image_url"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "agree_tc"
    t.date     "trial_start_at"
    t.date     "trial_end_at"
    t.boolean  "free_user",                   :default => false
  end

  add_index "refinery_customers", ["confirmation_token"], :name => "index_refinery_customers_on_confirmation_token", :unique => true
  add_index "refinery_customers", ["email"], :name => "index_refinery_customers_on_email", :unique => true
  add_index "refinery_customers", ["reset_password_token"], :name => "index_refinery_customers_on_reset_password_token", :unique => true

  create_table "refinery_customers_languages", :id => false, :force => true do |t|
    t.integer "customer_id"
    t.integer "language_id"
  end

  add_index "refinery_customers_languages", ["customer_id"], :name => "index_refinery_customers_languages_on_customer_id"
  add_index "refinery_customers_languages", ["language_id"], :name => "index_refinery_customers_languages_on_language_id"

  create_table "refinery_customers_routes", :id => false, :force => true do |t|
    t.integer "customer_id"
    t.integer "route_experience_id"
  end

  add_index "refinery_customers_routes", ["customer_id"], :name => "index_refinery_customers_routes_on_customer_id"
  add_index "refinery_customers_routes", ["route_experience_id"], :name => "index_refinery_customers_routes_on_route_experience_id"

  create_table "refinery_employers", :force => true do |t|
    t.string   "name"
    t.integer  "image_id"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_faqs", :force => true do |t|
    t.text     "question"
    t.text     "answer"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_images", :force => true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.string   "image_ext"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "refinery_inquiries_inquiries", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.boolean  "spam",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "refinery_inquiries_inquiries", ["id"], :name => "index_refinery_inquiries_inquiries_on_id"

  create_table "refinery_invoices", :force => true do |t|
    t.string   "invoice_number"
    t.string   "trans_number"
    t.string   "sub_type"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "price_dollar"
    t.string   "price_rand"
    t.string   "card_last_digits"
    t.integer  "customer_id"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "refinery_jobs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "airline_id"
    t.text     "benefits"
    t.text     "requirements"
    t.boolean  "active"
    t.string   "location"
    t.string   "salary"
    t.date     "published_date"
    t.date     "expiry_date"
    t.string   "career_path"
    t.string   "contract_type"
  end

  create_table "refinery_languages", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_line_items", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",   :default => 1
    t.integer  "position"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "refinery_messages", :force => true do |t|
    t.text     "message"
    t.integer  "airline_id"
    t.integer  "customer_id"
    t.boolean  "seen"
    t.string   "sender"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "refinery_notifications", :force => true do |t|
    t.string   "notification_type"
    t.string   "url"
    t.integer  "receiver_id"
    t.string   "receiver_class"
    t.integer  "sender_id"
    t.string   "sender_class"
    t.boolean  "seen",              :default => false
    t.integer  "position"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "refinery_order_items", :force => true do |t|
    t.string   "product_name"
    t.string   "product_stock_code"
    t.string   "product_supplier_stock_code"
    t.decimal  "price",                       :precision => 10, :scale => 2
    t.integer  "order_id"
    t.integer  "quantity"
    t.decimal  "total",                       :precision => 10, :scale => 2
    t.integer  "position"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "refinery_orders", :force => true do |t|
    t.string   "order_number"
    t.integer  "customer_id"
    t.string   "order_status"
    t.decimal  "grand_total",             :precision => 10, :scale => 2
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "suburb"
    t.string   "city"
    t.string   "postal_code"
    t.string   "payment_type"
    t.integer  "position"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "delivery_option_name"
    t.decimal  "delivery_cost",           :precision => 10, :scale => 2
    t.string   "delivery_waybill_number"
  end

  create_table "refinery_page_part_translations", :force => true do |t|
    t.integer  "refinery_page_part_id"
    t.string   "locale"
    t.text     "body"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "refinery_page_part_translations", ["locale"], :name => "index_refinery_page_part_translations_on_locale"
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], :name => "index_f9716c4215584edbca2557e32706a5ae084a15ef"

  create_table "refinery_page_parts", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_parts", ["id"], :name => "index_refinery_page_parts_on_id"
  add_index "refinery_page_parts", ["refinery_page_id"], :name => "index_refinery_page_parts_on_refinery_page_id"

  create_table "refinery_page_translations", :force => true do |t|
    t.integer  "refinery_page_id"
    t.string   "locale"
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "refinery_page_translations", ["locale"], :name => "index_refinery_page_translations_on_locale"
  add_index "refinery_page_translations", ["refinery_page_id"], :name => "index_d079468f88bff1c6ea81573a0d019ba8bf5c2902"

  create_table "refinery_pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.boolean  "draft",               :default => false
    t.boolean  "skip_to_first_child", :default => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "footer",              :default => false
  end

  add_index "refinery_pages", ["depth"], :name => "index_refinery_pages_on_depth"
  add_index "refinery_pages", ["id"], :name => "index_refinery_pages_on_id"
  add_index "refinery_pages", ["lft"], :name => "index_refinery_pages_on_lft"
  add_index "refinery_pages", ["parent_id"], :name => "index_refinery_pages_on_parent_id"
  add_index "refinery_pages", ["rgt"], :name => "index_refinery_pages_on_rgt"

  create_table "refinery_pages_pods", :id => false, :force => true do |t|
    t.integer "page_id"
    t.integer "pod_id"
  end

  add_index "refinery_pages_pods", ["page_id"], :name => "index_refinery_pages_pods_on_page_id"
  add_index "refinery_pages_pods", ["pod_id"], :name => "index_refinery_pages_pods_on_pod_id"

  create_table "refinery_plans", :force => true do |t|
    t.string   "name"
    t.float    "cost"
    t.string   "currency"
    t.string   "duration"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "refinery_pods", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.string   "url"
    t.integer  "image_id"
    t.string   "pod_type"
    t.integer  "portfolio_entry_id"
    t.integer  "video_id"
    t.integer  "position"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "refinery_pods", ["image_id"], :name => "index_refinery_pods_on_image_id"
  add_index "refinery_pods", ["pod_type"], :name => "index_refinery_pods_on_pod_type"
  add_index "refinery_pods", ["portfolio_entry_id"], :name => "index_refinery_pods_on_portfolio_entry_id"
  add_index "refinery_pods", ["video_id"], :name => "index_refinery_pods_on_video_id"

  create_table "refinery_portfolio_galleries", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_portfolio_gallery_translations", :force => true do |t|
    t.integer  "refinery_portfolio_gallery_id"
    t.string   "locale"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "refinery_portfolio_gallery_translations", ["locale"], :name => "index_refinery_portfolio_gallery_translations_on_locale"
  add_index "refinery_portfolio_gallery_translations", ["refinery_portfolio_gallery_id"], :name => "index_dacf6685c3221de568049c599f2a69d1c1f9dd25"

  create_table "refinery_portfolio_item_translations", :force => true do |t|
    t.integer  "refinery_portfolio_item_id"
    t.string   "locale"
    t.string   "title"
    t.text     "caption"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "refinery_portfolio_item_translations", ["locale"], :name => "index_refinery_portfolio_item_translations_on_locale"
  add_index "refinery_portfolio_item_translations", ["refinery_portfolio_item_id"], :name => "index_2f72df747b84672dbcc6cb153c8031486c5de521"

  create_table "refinery_portfolio_items", :force => true do |t|
    t.string   "title"
    t.string   "caption"
    t.integer  "image_id",   :null => false
    t.integer  "gallery_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "refinery_products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "refinery_resources", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "refinery_roles", :force => true do |t|
    t.string "title"
  end

  create_table "refinery_roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_roles_users", ["role_id", "user_id"], :name => "index_refinery_roles_users_on_role_id_and_user_id"
  add_index "refinery_roles_users", ["user_id", "role_id"], :name => "index_refinery_roles_users_on_user_id_and_role_id"

  create_table "refinery_route_experiences", :force => true do |t|
    t.string   "continent"
    t.string   "airport"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "refinery_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",     :default => true
    t.string   "scoping"
    t.boolean  "restricted",      :default => false
    t.string   "form_value_type"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "refinery_settings", ["name"], :name => "index_refinery_settings_on_name"

  create_table "refinery_subscriptions", :force => true do |t|
    t.integer  "customer_id"
    t.date     "exp_date"
    t.integer  "position"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "credit_card_id"
    t.integer  "plan_id"
    t.integer  "fail_payment_count"
    t.boolean  "suspend",            :default => false
  end

  create_table "refinery_transactions", :force => true do |t|
    t.string   "unique_guid"
    t.integer  "order_id"
    t.decimal  "amount",                :precision => 10, :scale => 2
    t.boolean  "is_payment_successful",                                :default => false
    t.text     "notes"
    t.integer  "position"
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
  end

  create_table "refinery_user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_user_plugins", ["name"], :name => "index_refinery_user_plugins_on_name"
  add_index "refinery_user_plugins", ["user_id", "name"], :name => "index_refinery_user_plugins_on_user_id_and_name", :unique => true

  create_table "refinery_users", :force => true do |t|
    t.string   "username",               :null => false
    t.string   "email",                  :null => false
    t.string   "encrypted_password",     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "refinery_users", ["id"], :name => "index_refinery_users_on_id"

  create_table "refinery_videos", :force => true do |t|
    t.string   "name"
    t.string   "youtube_url"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "route_experiences", :force => true do |t|
    t.string   "continent_flown_to"
    t.text     "city_destinations"
    t.integer  "customer_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "seo_meta", :force => true do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "seo_meta", ["id"], :name => "index_seo_meta_on_id"
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], :name => "index_seo_meta_on_seo_meta_id_and_seo_meta_type"

  create_table "subscription_transactions", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "subscription_id"
    t.integer  "credit_card_id"
    t.string   "amount"
    t.string   "notes"
    t.string   "transaction_status"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "trans_logs", :force => true do |t|
    t.integer  "subscription_transaction_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.text     "request"
    t.text     "response"
  end

end
