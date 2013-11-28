require 'spec_helper'

describe "Static Pages" do

  subject { page }

	let(:base_title) { "Mi Codex"}

  describe "Home page" do
    before { visit root_path}
    it {should have_content('Mi Codex')}
    it {should have_title("#{base_title}")}
    it {should_not have_title('| Home')}
  end

  describe "Help Page" do
    before { visit help_path}
    it {should have_content('Mi Codex Help')}
    it {should have_title("#{base_title} | Help")}
  end

  describe "Contact Page" do
    before { visit contact_path}
    it {should have_content('Contact Mi Codex')}
    it {should have_title("#{base_title} | Contact")}
  end

end
