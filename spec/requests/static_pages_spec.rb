require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
  
    it "should have content 'Shanon Kelly Real Estate" do
      
      visit '/static_pages/home'
      expect(page).to have_content('Shanon Kelly Real Estate')
    end
  end
end
