require 'spec_helper'

describe Character do


	before do
		@character = FactoryGirl.create(:character)
	end

  subject { @character }

  it { should be_valid }
  it { should respond_to(:character_relationship) }
  it { should respond_to(:appearances) }
  it { should respond_to(:appearing?) }
  it { should respond_to(:appear!) }
  it { should respond_to(:disappear!) }

  describe "appearance" do
    let(:scene) { FactoryGirl.create(:scene) }
    let(:scene2) { FactoryGirl.create(:scene) }
    before do
      @character.save
      @character.appear!(scene)
      @character.appear!(scene2)
    end

    it { should be_appearing(scene) }
    it { should be_appearing(scene2) }
    its(:appearances) { should include(scene) }
    its(:appearances) { should include(scene2) }

    describe "and disappearing" do
      before { @character.disappear!(scene) }

      it { should_not be_appearing(scene) }
      its(:appearances) { should_not include(scene) }
    end
  end
end
