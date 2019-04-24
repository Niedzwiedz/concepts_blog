module DryContainer
  def container
    Container.instance
  end
end

RSpec.configure do |config|
  config.include(DryContainer)
end
