module Osrcry
  class License
    def self.execute
      unix_times = `git log --pretty=format:"%at"`.split("\n")
      first_year, last_year = Time.at(unix_times.first.to_i).utc.year, Time.at(unix_times.last.to_i).utc.year
      year_range = if first_year == last_year
        first_year.to_s
      else
        "#{first_year}-#{last_year}"
      end

      license = <<-LICENSE
The MIT License (MIT)

Copyright (c) #{year_range} [CONTRIBUTORS.md](https://github.com/geemus/oscrcy/blob/master/CONTRIBUTORS.md)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
LICENSE

      File.open('LICENSE.md', 'w') do |file|
        file.write(license)
      end
    end
  end
end
