if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms-subscriptions').blank?
      user.plugins.create(:name => 'refinerycms-subscriptions',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end


