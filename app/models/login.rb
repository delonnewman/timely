# frozen_string_literal: true

# Generate user logins
class Login
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
    Timely::Utils.slug(@email.split('@').first)
  end

  def from_name
    Timely::Utils.slug(@name)
  end
end
