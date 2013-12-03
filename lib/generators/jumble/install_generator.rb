module Jumble
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      def copy_config_file
        copy_file 'jumble.yml', 'config/jumble.yml'
      end

    end
  end
end
