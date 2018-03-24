module Ribose
  class FileVersion < Ribose::Base
    include Ribose::Actions::Fetch

    # Fetch file version
    #
    # @params :space_id [UUID] The space Id
    # @params :file_id [UUID] The space file Id
    # @params :version_id [UUID] The file version Id
    # @returns [Sawyer::Resource] The file version
    #
    def self.fetch(space_id:, file_id:, version_id:, **options)
      new(
        file_id: file_id,
        space_id: space_id,
        resource_id: version_id,
        **options,
      ).fetch
    end

    private

    attr_reader :file_id, :space_id

    def resource
      nil
    end

    def extract_local_attributes
      @file_id = attributes.delete(:file_id)
      @space_id = attributes.delete(:space_id)
    end

    def resource_path
      [files_path, file_id, "versions", resource_id].join("/")
    end

    def files_path
      ["spaces", space_id, "file", "files"].join("/")
    end
  end
end
