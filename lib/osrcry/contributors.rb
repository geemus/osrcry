module Osrcry
  class Contributors
    def self.execute
      require 'excon'
      require 'json'

      `git remote -v`.split("\n").detect do |remotes|
        remotes =~ /github.com[:\/](\w+)\/(\w+)/
      end
      user, repo = $1, $2

      data = JSON.parse(
        Excon.get(
          "https://api.github.com/repos/#{user}/#{repo}/collaborators",
          :headers => {'User-Agent' => 'osrcry'}
        ).body
      )
      collaborators = data.map do |datum|
        "[#{datum['login']}](#{datum['html_url']})"
      end.sort

      File.open('CONTRIBUTORS.md', 'w') do |file|
        file.write(collaborators.join("\n"))
      end
    end
  end
end
