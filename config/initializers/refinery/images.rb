Refinery::Images.configure do |config|
  # Configures the maximum allowed upload size (in bytes) for an image
  # config.max_image_size = 5242880

  # Configure how many images per page should be displayed when a dialog is presented that contains images
  # config.pages_per_dialog = 18

  # Configure how many images per page should be displayed when a dialog is presented that
  # contains images and image resize options
  # config.pages_per_dialog_that_have_size_options = 12

  # Configure how many images per page should be displayed in the list of images in the admin area
  # config.pages_per_admin_index = 20

  # Configure image sizes
  # config.user_image_sizes = {:small=>"110x110>", :medium=>"225x255>", :large=>"450x450>"}

  # Configure white-listed mime types for validation
  # config.whitelisted_mime_types = ["image/jpeg", "image/png", "image/gif", "image/tiff"]

  # Configure image view options
  # config.image_views = [:grid, :list]

  # Configure default image view
  # config.preferred_image_view = :grid

  # Configure S3 (you can also use ENV for this)
  # The s3_backend setting by default defers to the core setting for this but can be set just for images.

  # Configure Dragonfly
  # This is where in the middleware stack to insert the Dragonfly middleware
  # config.dragonfly_insert_before = "ActionDispatch::Callbacks"
  # config.dragonfly_secret = "b23f75be0d32c5b02cea2fa03c2a6968491b1ff4c9152cd0"
  # If you decide to trust file extensions replace :ext below with :format
  # config.dragonfly_url_format = "/system/images/:job/:basename.:ext"
  # config.datastore_root_path = "C:/Dev/Workspace/jetcrew360/jetcrew360/public/system/refinery/images"
  # config.trust_file_extensions = false

end
