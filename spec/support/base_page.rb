class BasePage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize(path = root_path)
    @path = path
  end

  def open
    visit @path
    self
  end
end
