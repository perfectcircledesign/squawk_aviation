module Devise
  module AfterSignInFix
    def after_sign_in_path_for(resource_or_scope)
      stored_url = stored_location_for(resource_or_scope).to_s
      stored_url.gsub("//", "/") || refinery.root_path
    end
  end
end
