require "rails_helper"

RSpec.describe Sport, :type => :model do

  
	# test associations
	it { should have_many(:leagues) }
	it { should have_many(:matches) }
  it { should belong_to(:user_favorite) }
	

	before(:each) do |example|
		@sport = FactoryBot.build(:sport)
	end

	# test validations
 	it "should be valid when built with all required attributes" do
    expect(@sport).to be_valid
  end

  it "should not be valid when built without a name" do
  	@sport.name = nil
    expect(@sport).not_to be_valid
  end





end

