require 'spec_helper'

describe Scene do

	before do
		@scene = FactoryGirl.create(:scene)
	end

  subject { @scene }

  it { should be_valid }
  it { should respond_to(:character_relationship) }

  describe "appearances" do
  	let(:character) { FactoryGirl.create(:character) }
  	before do
  		character.appear!(@scene)
  	end

  	its(:characters) { should include(character)}
  end

end
