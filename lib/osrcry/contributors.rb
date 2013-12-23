module Osrcry
  class Contributors
    def self.execute
      collaborators = `git log --pretty=format:"* [%an](mailto:%ae)"`.split("\n").uniq.sort

      File.open('CONTRIBUTORS.md', 'w') do |file|
        file.write(collaborators.join("\n"))
      end
    end
  end
end
