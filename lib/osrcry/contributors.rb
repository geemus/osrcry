module Osrcry
  class Contributors
    def self.execute
      collaborators = `git log --pretty=format:"* %an <%ae>" 2>&1`.split("\n").uniq.sort

      if collaborators.first == "fatal: your current branch 'master' does not have any commits yet"
        puts "Unable to create CONTRIBUTORS.md as there are no git commits.\nPlease add git commits and try again."
        return
      end

      File.open('CONTRIBUTORS.md', 'w') do |file|
        file.write(collaborators.join("\n"))
      end
    end
  end
end
