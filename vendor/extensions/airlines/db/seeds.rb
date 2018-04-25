if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms-airlines').blank?
      user.plugins.create(:name => 'refinerycms-airlines',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end


url = "/airlines"
if defined?(::Refinery::Page) && ::Refinery::Page.where(:link_url => url).empty?
  page = ::Refinery::Page.create(
    :title => 'Airlines',
    :link_url => url,
    :deletable => false,
    :menu_match => "^#{url}(\/|\/.+?|)$"
  )
  Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
    page.parts.create(:title => default_page_part, :body => nil, :position => index)
  end
end

