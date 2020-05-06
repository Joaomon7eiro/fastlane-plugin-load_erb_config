require 'fastlane/action'
require_relative '../helper/load_erb_config_helper'

module Fastlane
  module Actions
    class LoadErbConfigAction < Action
      def self.run(params)
        require 'yaml'
        object = JSON.parse(YAML::load_file(params[:file_path]).to_json, object_class: OpenStruct)
        return object
      end

      def self.description
        "Fastlane plugin to load configuration object from yml file"
      end

      def self.authors
        ["Joaomon7eiro"]
      end

      def self.return_value
        "Loads yml configuration data"
      end

      def self.details
        # Optional:
        ""
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :file_path,
                                  env_name: "LOAD_ERB_FILE_PATH",
                               description: "The relative path to the erb file",
                                  optional: false,
                                      type: String,    
                              verify_block: proc do |value|
                                        value = File.expand_path(value)
                                        UI.user_error!("Couldn't find ERB file at path '#{value}'") unless File.exist?(value)
                                      end)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
