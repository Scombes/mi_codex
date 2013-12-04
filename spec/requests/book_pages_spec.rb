require 'spec_helper'

describe "Book Pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user}

  describe "book creation" do
  	before { visit root_path }

  	describe "with invalid information" do

  		it "should not create a book" do
  			expect { click_button "Shelf" }.not_to change(Book, :count)
  		end

  		describe "error message" do
  			before { click_button "Shelf" }
  			it { should have_content('error') }
  		end
  	end

  	
  end
end
