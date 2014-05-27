require 'spec_helper'

describe Chapter do
  before { @chapter = Chapter.new(number: 1, title: "First Chapter") }

  subject { @chapter }

  it { should respond_to(:number) }
  it { should respond_to(:title) }
  it { should respond_to(:id) }

  it { should be_valid }

  describe "when number is not present" do
    before { @chapter.number = " " }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before do
    	@chapter.title = " "
    	@chapter.number = 1
    end
    it { should_not be_valid }
  end

  describe "when number is already taken" do
    before do
      chapter_with_same_number = @chapter.dup
      chapter_with_same_number.save
    end

    it { should_not be_valid }
  end
end
