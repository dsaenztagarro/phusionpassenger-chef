module Phusionpassenger
  module Helper
    include Chef::Mixin::ShellOut

    # Run command as if it had been invoked as a login shell
    # @param command [String] The command to run
    # @param options [Hash] The `shell_out` options
    # @return [Mixlib::ShellOut]
    def login_shell(command, options = {})
      shell_out("bash -l -c \"#{command}\"", options)
    end
  end
end

Chef::Recipe.send(:include, Phusionpassenger::Helper)
Chef::Resource.send(:include, Phusionpassenger::Helper)
