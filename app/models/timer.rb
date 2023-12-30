# frozen_string_literal: true

# Keep track of timer state
class Timer < ApplicationRecord
  belongs_to :project
end
