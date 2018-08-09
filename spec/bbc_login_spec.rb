require_relative 'spec_helper'

describe 'BBC login functionality' do

  before(:each) do
    @bbc_site = BBCSite.new
  end

  context 'check functionality of user login' do

    # it 'should allow the user to log in with correct details' do
    #   @bbc_site.bbc_home_page.visit_home_page
    #   @bbc_site.bbc_home_page.click_sign_in
    #   @bbc_site.bbc_accounts_page.input_username # INPUT VALID EMAIL ADDRESS STRING HERE
    #   @bbc_site.bbc_accounts_page.input_password # INPUT VALID PASSWORD HERE
    #   @bbc_site.bbc_accounts_page.click_submit
    #   sleep 3
    #   expect(@bbc_site.bbc_accounts_page.signed_in?).to be true
    # end

    it 'should produce an error message when entering an incorrect password to a valid account' do
      @bbc_site.bbc_home_page.visit_home_page
      @bbc_site.bbc_home_page.click_sign_in
      @bbc_site.bbc_accounts_page.input_username 'acooke@spartaglobal.com'
      @bbc_site.bbc_accounts_page.input_password 'testing12!'
      @bbc_site.bbc_accounts_page.click_submit
      sleep 3
      expect(@bbc_site.bbc_accounts_page.incorrect_pw_message).to be true
    end

  end

  context 'check functionality of new account registration' do
    it 'should accept users details up to email' do
      @bbc_site.bbc_home_page.visit_home_page
      @bbc_site.bbc_home_page.click_sign_in
      @bbc_site.bbc_accounts_page.click_register
      @bbc_site.bbc_accounts_page.confirm_over_13
      @bbc_site.bbc_accounts_page.enter_dob '30', '12', '1956'
      sleep 3
      @bbc_site.bbc_accounts_page.submit_dob
      @bbc_site.bbc_accounts_page.enter_email 'p2249320@nwytg.com'
    end

    it 'should respond with an error message if the password is too short' do
      @bbc_site.bbc_accounts_page.enter_password 'abcde'
      expect(@bbc_site.bbc_accounts_page.get_password_error_message).to be true
      sleep 1
      @bbc_site.bbc_accounts_page.clear_password
    end

    it 'should respond with an error message if the password is too simple' do
    end
    it 'should respond with an error message if the password is only letters' do
    end
    it 'should respond with an error message if the password is only numbers' do
    end

  end


end
