dir = File.dirname(__FILE__)
require File.join(dir, 'osrcry', 'contributors')
require File.join(dir, 'osrcry', 'license')
require File.join(dir, 'osrcry', 'stale')
require File.join(dir, 'osrcry', 'version')

module Osrcry

  def self.remote
    @remote ||= `git remote -v`.split("\n").detect {|line| line =~ /^origin/}
  end

  def self.repo
    @repo ||= remote.match(%r{github.com[:\/](\w+)\/(\w+)}).captures.last
  end

  def self.user
    @user ||= remote.match(%r{github.com[:\/](\w+)\/(\w+)}).captures.first
  end

end
