require_relative 'pages/bbc_home_page'
require_relative 'pages/bbc_accounts_page'

class BBCSite

  def bbc_home_page
    BBCHomePage.new
  end

  def bbc_accounts_page
    BBCAccountsPage.new
  end

end
