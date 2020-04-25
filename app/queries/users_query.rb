# frozen_string_literal: true

class UsersQuery
  extend Dry::Initializer

  option :query_string, Types::Coercible::String, optional: true

  def call
    scope = User
    filter_by_string(scope) if query_string
  end

  private

  def filter_by_string(scope)
    scope.where('username LIKE :query_string OR email LIKE :query_string',
                query_string: "%#{query_string}%")
  end
end
