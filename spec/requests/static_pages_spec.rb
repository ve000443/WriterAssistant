require 'spec_helper'

describe "StaticPages" do
	subject { page }

	describe "Visit Home Page" do
		before { visit root_path }
		let(:heading)    { 'Writing Assistant' }
    let(:page_title) { '' }

    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
	end
end
