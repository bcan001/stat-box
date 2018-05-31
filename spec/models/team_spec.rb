require "rails_helper"

RSpec.describe Team, :type => :model do

  # test associations
  it { should have_many(:team1s).class_name('Team').with_foreign_key('team1_id') }
	it { should have_many(:team2s).class_name('Team').with_foreign_key('team2_id') }
  it { should belong_to(:league) }
  it { should belong_to(:sport) }
	

	before(:each) do |example|
		@team = FactoryBot.build(:team)
	end

	# test validations
 	it "should be valid when built with all required attributes" do
    expect(@team).to be_valid
  end

  it "should not be valid when built without a name" do
  	@team.name = nil
    expect(@team).not_to be_valid
  end





end

