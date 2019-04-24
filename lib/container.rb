# frozen_string_literal: true

class Container
  class DryContainer
    include Dry::Container::Mixin
  end

  attr_reader :app, :container
  delegate :[], to: :container

  class << self
    attr_reader :instance
  end

  def self.configure
    container = DryContainer.new
    yield(container)
    @instance = new(Rails.application, container)
    freeze unless Rails.env.development?
  end

  def initialize(app, container)
    @app = app
    @container = container
  end
end
