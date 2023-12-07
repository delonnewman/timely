# frozen_string_literal: true

# Coordinate logins and identify users
class User < ApplicationRecord
  belongs_to :team
  has_many :groups, through: :team
  has_many :projects, through: :groups

  has_many :time_entries

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :confirmable

  validates :login, presence: true, uniqueness: true, length: { minimum: 5 }
  before_validation do
    self.login = Login.new(name:, email:) unless login
  end

  def to_s
    name
  end

  def first_name
    name.split(/\s+/).first
  end
  alias nickname first_name

  def earliest_entry_created_at
    time_entries.minimum(:created_at)
  end
end
