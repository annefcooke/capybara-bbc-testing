class BBCHomePage

  include Capybara::DSL

  HOMEPAGE_URL = 'https://bbc.co.uk'

  def visit_home_page
    visit HOMEPAGE_URL
  end

  def click_sign_in
    click_link 'idcta-link'
  end



end
