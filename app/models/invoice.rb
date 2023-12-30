# frozen_string_literal: true

# Keep track of invoicing workflows
class Invoice < ApplicationRecord
  belongs_to :project
end
