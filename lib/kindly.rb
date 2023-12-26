# frozen_string_literal: true

require_relative 'core_ext/date'
require_relative 'kindly/utils'

module Kindly
  GITHUB_URL = 'https://github.com/delonnewman/kindly/'
  private_constant :GITHUB_URL

  # Return the GitHub url of the project.
  #
  # @return [Addressable::URI]
  def self.github_url
    @github_url ||= Addressable::URI.parse(GITHUB_URL)
  end

  # Return the current version of the system (based on git SHA).
  #
  # @return [String, nil]
  def self.version
    current_git_sha[0, 8]
  end

  # Return the current git SHA hash.  It will first look for the GIT_SHA environment variable
  # if this is not set then it will attempt to get the latest hash from git.
  #
  # @return [String]
  def self.current_git_sha
    @current_git_sha ||= ENV.fetch('GIT_SHA') { `git log -n 1 --format="%H"` } # use latest git hash as version
  end

  # Return the current release of the system (see RELEASE.txt in project root)
  #
  # @return [String]
  def self.release
    Rails.root.join('RELEASE.txt').read
  end
end
