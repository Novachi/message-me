# frozen_string_literal: true

module Types
  include Dry::Types.module

  # Borrowed from https://gist.github.com/rx/a4440130089bc64c1fcea99d43627155
  UUID = Types::Strict::String.constrained(
    format: /\A[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-4[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}\z/i
  )
end
