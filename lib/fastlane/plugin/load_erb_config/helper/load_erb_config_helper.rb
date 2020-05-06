require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class LoadErbConfigHelper
      # class methods that you define here become available in your action
      # as `Helper::LoadErbConfigHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the load_erb_config plugin helper!")
      end
    end
  end
end
