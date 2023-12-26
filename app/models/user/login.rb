# frozen_string_literal: true

# Generate user logins
class User::Login
  def initialize(name:, email:)
    @name = name.presence
    @email = email.presence
  end

  def to_s
    return from_name if @name
    return from_email if @email

    ''
  end

  def from_email
    Kindly::Utils.slug(@email.split('@').first)
  end

  def from_name
    Kindly::Utils.slug(@name)
  end
end
