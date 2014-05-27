require 'spec_helper'

describe CharacterRelationship do
	let(:scene) { FactoryGirl.create(:scene) }
  let(:character) { FactoryGirl.create(:character) }
  let(:relationship) { scene.character_relationship.build(character_id: character.id, scene_id: scene.id) }

  subject { relationship }

  it { should be_valid }

  describe "methods" do
    it { should respond_to(:scene) }
    it { should respond_to(:character) }
    its(:character) { should eq character }
    its(:scene) { should eq scene }
  end
end
