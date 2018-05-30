require "rails_helper"

RSpec.describe League, :type => :model do

  # test associations
  it { should belong_to(:sport) }
  it { should belong_to(:user_favorite) }
	it { should have_many(:teams) }
	it { should have_many(:matches) }


	before(:each) do |example|
		@league = FactoryBot.build(:league)
	end

	# test validations
 	it "should be valid when built with all required attributes" do
    expect(@league).to be_valid
  end

  it "should not be valid when built without a name" do
  	@league.name = nil
    expect(@league).not_to be_valid
  end




end


# # test associations
# it { should have_many(:events) }
# it { should have_many(:links) }

# before(:each) do |example|
# 	@artist = FactoryBot.build(:artist)
# end

# # test validations
# 	it "should be valid when built with all required attributes" do
#   expect(@artist).to be_valid
# end

# it "should not be valid when built without a name" do
# 	@artist.name = nil
#   expect(@artist).not_to be_valid
# end

# it "should not be valid when built without a description" do
# 	@artist.description = nil
#   expect(@artist).not_to be_valid
# end
