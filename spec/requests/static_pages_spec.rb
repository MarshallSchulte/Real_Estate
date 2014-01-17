require 'spec_helper'

describe "StaticPages" do

  subject { page }
  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end
  
  describe "Home page" do
    before { visit root_path }
	let(:heading)	  { 'Shanon Kelly Real Estate' }
	let(:page_title)  { '' }
	
    it_should_behave_like "all static pages"
	it { should_not have_title('| Home') }
  end
  describe "Contact page" do
  
    it "should have content 'Shanon Kelly Real Estate" do
      
      visit contact_path
      expect(page).to have_content('Shanon Kelly Real Estate')
    end
		it "should have the right title" do
	  visit contact_path
	  expect(page).to have_title("Shanon Kelly Real Estate | Contact")
    end
  end
  describe "Listings page" do
  
    it "should have content 'Shanon Kelly Real Estate" do
      
      visit listings_path
      expect(page).to have_content('Shanon Kelly Real Estate')
    end
		it "should have the right title" do
	  visit listings_path
	  expect(page).to have_title("Shanon Kelly Real Estate | Listings")
    end
  end
  
end
