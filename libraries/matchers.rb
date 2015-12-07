if defined?(ChefSpec)

  # passenger_site

  def create_passenger_site(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:passenger_site, :create, resource_name)
  end

  def enable_passenger_site(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:passenger_site, :enable, resource_name)
  end
end
