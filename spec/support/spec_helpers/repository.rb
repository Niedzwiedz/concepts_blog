module SpecHelpers
  module Repository
    def fetch_parsed_module(repository_class)
      repository_class
        .to_s
        .gsub("::", "")
        .sub("Repository", "")
        .underscore
        .to_sym
    end
  end
end

RSpec.configure do |config|
  config.include SpecHelpers::Repository
end
