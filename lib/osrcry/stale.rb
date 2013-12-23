module Osrcry
  class Stale
    def self.execute
      url = "https://github.com/#{Osrcry.user}/#{Osrcry.repo}/search?type=Issues&q=state:open+updated:<"
      updated = case ARGV[1]
      when 'days'
        Time.now.utc - 86400 # 60 * 60 * 24
      when 'weeks'
        Time.now.utc - 604800 # 60 * 60 * 24 * 7
      when 'months'
        Time.now.utc - 2592000 # 60 * 60 * 24 * 30
      when 'years'
        Time.now.utc - 31536000 # 60 * 60 * 24 * 365
      else
        puts "Please specify: `days`, `months` or `years`"
      end
      if updated
        url << updated.strftime("%Y-%m-%d")
        puts url
        `open "#{url}"`
      end
    end
  end
end
