require 'spec_helper'

describe "StaticPages" do
	subject { page }

	describe "Home page" do
		before { visit root_path }

		it { should have_title full_title('') }
		it { should have_selector('h1', text:'Sample App') }
	end

	describe "About page" do
		before { visit about_path }

		it { should have_title full_title 'About us' }
		it { should have_selector('h1', text:'About us') }
	end

	describe "Layout" do
		before { visit root_path }

		it "should have the main links on the layout page" do
			click_link "About"
			should have_title 'About us'

			click_link "Help"
			should have_title full_title('Help')

			click_link "sample app"
			should have_selector 'h1', text: 'Sample App'

			click_link "Sign up now"
			should have_title full_title('Sign Up')
		end
	end
end