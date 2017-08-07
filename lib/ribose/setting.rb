require "ribose/actions"

module Ribose
  class Setting
    include Ribose::Actions::All

    private

    def resource_path
      "settings"
    end
  end
end