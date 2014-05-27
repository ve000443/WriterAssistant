require 'spec_helper'

describe "Chapter pages" do

  subject { page }

  describe "overview page" do
    let(:chapter) { FactoryGirl.create(:chapter) }
    before { visit chapter_path(chapter) }

    it { should have_content(chapter.title) }
  end

  describe "new chapter access" do
  	before { visit newchap_path }

  	it { should have_content('New Chapter')}
  	#it { should have_title(full_title('Create Chapter'))}
  end

  describe "chapter creation" do
  	before { visit newchap_path }

  	let(:submit) { "Create chapter" }

  	describe "with invalid information" do
      it "should not create a chapter" do
        expect { click_button submit }.not_to change(Chapter, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Number",       with: 2
        fill_in "Title",        with: "The Second Chapter"
      end

      it "should create a chapter" do
        expect { click_button submit }.to change(Chapter, :count).by(1)
      end
    end
  end

  describe "chapter edit" do
    let(:chapter) { FactoryGirl.create(:chapter) }
    before { visit edit_chapter_path(chapter) }

    describe "page" do
      it { should have_content("Update the Chapter details") }
      it { should have_title("Edit chapter") }
    end

    describe "with invalid information" do
      before do 
      	chap = Chapter.new()
      	chap.title = "Title"
      	chap.number = 2
      	chap.save()
      	fill_in "Number",       with: 2
      	click_button "Save changes"
      end

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_number)  { 5 }
      let(:new_title) { "Chapter New Title" }
      before do
        fill_in "Number",            with: new_number
        fill_in "Title",           	 with: new_title
        click_button "Save changes"
      end

      it { should have_selector('div.alert.alert-success') }
      specify { expect(chapter.reload.number).to  eq new_number }
      specify { expect(chapter.reload.title).to 	eq new_title }
    end
  end

  describe "chapter index" do
    before do
      FactoryGirl.create(:chapter)
      FactoryGirl.create(:chapter, number: 2, title: "Title 1")
      FactoryGirl.create(:chapter, number: 3, title: "Title 3")
      visit chapters_path
    end

    it { should have_content('All Chapters') }

    it "should list each chapter" do
      Chapter.all.each do |chapter|
        expect(page).to have_selector('li', text: chapter.number)
      end
    end
  end
end
