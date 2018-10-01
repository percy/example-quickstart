require 'bundler/setup'
require 'rack/file'
require 'capybara'
require 'percy/capybara'

unless ENV['PERCY_TOKEN']
  puts
  puts \
    'Whoops! It looks like you need to setup the PERCY_PROJECT and PERCY_TOKEN ' \
    'environment variables.'
  exit -1
end

# This example test simply works with HTML/CSS and does not include tests for JavaScript behaviors.
# For a more complete tutorial or example app, see https://percy.io/docs/tutorials/example-apps

# Setup a plain Rack app to serve the files from the current directory.
app = Rack::File.new(File.dirname(__FILE__))

Percy::Capybara.use_loader(
  :filesystem,
  # Configure Percy to load compiled assets from this local directory:
  assets_dir: File.expand_path('../assets', __FILE__),
  # (Optional) Configure the base URL of where the assets are served from the webserver:
  base_url: '/assets',
)

page = Capybara::Session.new(:rack_test, app)
build = Percy::Capybara.initialize_build

page.visit('/index.html')
Percy::Capybara.snapshot(page, widths: [375, 1280])

Percy::Capybara.finalize_build

puts
puts 'Done! Percy is now processing the snapshots...'
puts
puts '-->'
puts "--> #{build['data']['attributes']['web-url']}"
puts '-->'
puts
puts 'Try editing /index.html and running this command again!'
puts 'Percy will highlight any pixels changed.'
