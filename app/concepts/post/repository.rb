# frozen_string_literal: true

module Post
  class Repository
    delegate :all,     to: :adapter
    delegate :create,  to: :adapter
    delegate :create!, to: :adapter
    delegate :delete,  to: :adapter

    attr_reader :adapter

    def initialize(adapter: )
      @adapter = adapter
    end

    def one_for_id(id)
      adapter.find(id)
    end
  end
end
