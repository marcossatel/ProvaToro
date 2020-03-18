require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'report_builder'

@browser = ENV['BROWSER']

if @browser.eql?('headless')
  Capybara.javascript_driver = :selenium
  Capybara.run_server = false

  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    'chromeOptions' => {
      'args' => ['--no-default-browser-check']
    }
  )

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: 'http://selenium_server:4444/wd/hub',
      desired_capabilities: caps
    )
  end
end

Capybara.configure do |c|
  if @browser.eql?('headless')
    c.default_driver = :selenium_server
  elsif @browser.eql?('chrome')
    c.default_driver = :selenium_chrome
  end

  c.app_host = 'http://ninjamotors.herokuapp.com'
  c.default_max_wait_time = 5
end

ReportBuilder.configure do |config|
  config.input_path = 'log'
  config.report_path = 'my_test_report'
  config.report_types = [:retry, :html]
  config.report_title = 'My Test Results'
  config.additional_info = {browser: 'Chrome', environment: 'QA teste'}
end

ReportBuilder.build_report