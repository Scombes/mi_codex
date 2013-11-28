require 'spec_helper'

describe "Static Pages" do
  describe "Home page" do
    it "should have the content 'Mi Codex'" do
      visit '/static_pages/home'
      expect(page).to have_content('Mi Codex')
    end

    it "should have the title 'Home'" do
    	visit '/static_pages/home'
    	expect(page).to have_title("Mi Codex | Home")
    end
  end

  describe "Help Page" do
  	it "should have the content 'Mi Codex Help'" do
  		visit '/static_pages/help'
  		expect(page).to have_content('Mi Codex Help')
  	end

  	it "should have the title 'Help'" do
    	visit '/static_pages/help'
    	expect(page).to have_title("Mi Codex | Help")
    end
  end

  describe "Contact Page" do
  	it "should have the content 'Contact Mi Codex'" do
  		visit '/static_pages/contact'
  		expect(page).to have_content('Contact Mi Codex')
  	end

  	it "should have the title 'Contact'" do
    	visit '/static_pages/contact'
    	expect(page).to have_title("Mi Codex | Contact")
    end
  end

end
