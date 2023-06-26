module AdminHelpers
  def given_i_am_signed_as_an_admin
    page.driver.browser.authorize ENV.fetch("ADMIN_USERNAME", nil), ENV.fetch("ADMIN_PASSWORD", nil)
  end
end
