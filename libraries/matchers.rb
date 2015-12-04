if defined?(ChefSpec)

  # passenger_virtualhost

  def create_passenger_virtualhost(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:passenger_virtualhost, :create, resource_name)
  end

  def enable_passenger_virtualhost(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:passenger_virtualhost, :enable, resource_name)
  end
end
