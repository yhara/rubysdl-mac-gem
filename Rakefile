PROJECT_NAME = "rubysdl"

begin
  require 'jeweler'
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Jeweler::Tasks.new do |gemspec|
  gemspec.name = "#{PROJECT_NAME}"
  gemspec.summary = "The simple ruby extension library to use SDL"
  gemspec.email = "ohai@kmc.gr.jp"
  gemspec.homepage = "http://www.kmc.gr.jp/~ohai/index.en.html"
  gemspec.description = gemspec.summary
  gemspec.authors = ["Ohbayashi Ippei"]
  #gemspec.files.concat Dir["vendor/plugins/**/*"]
  gemspec.extensions = ["rsdl/extconf.rb", "extconf.rb"]
end
