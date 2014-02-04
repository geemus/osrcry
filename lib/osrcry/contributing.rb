module Osrcry
  class Contributing
    def self.execute

      contributing = <<-CONTRIBUTING
## Getting Involved

New contributors are always welcome, when it doubt please ask questions. We strive to be an open and welcoming community. Please be nice to one another.

### Coding

* Pick a task:
  * Offer feedback on open [pull requests](https://github.com/#{Osrcry.user}/#{Osrcry.repo}/pulls).
  * Review open [issues](https://github.com/#{Osrcry.user}/#{Osrcry.repo}/issues) for things to help on.
  * [Create an issue](https://github.com/#{Osrcry.user}/#{Osrcry.repo}/issues/new) to start a discussion on additions or features.
* Fork the project, add your changes and tests to cover them in a topic branch.
* Commit your changes and rebase against `#{Osrcry.user}/#{Osrcry.repo}` to ensure everything is up to date.
* [Submit a pull request](https://github.com/#{Osrcry.user}/#{Osrcry.repo}/compare/).

### Non-Coding

* Offer feedback on open [issues](https://github.com/#{Osrcry.user}/#{Osrcry.repo}/issues).
* Organize or volunteer at events.
CONTRIBUTING

      File.open('CONTRIBUTING.md', 'w') do |file|
        file.write(contributing)
      end
    end
  end
end
