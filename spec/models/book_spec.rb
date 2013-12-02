require 'spec_helper'

describe Book do

  let(:user) { FactoryGirl.create(:user) }
  before { @book = user.books.build(title: "Lorem ipsum") }

  subject { @book }

  it { should respond_to(:title) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @book.user_id = nil }
    it { should_not be_valid }
  end
end
