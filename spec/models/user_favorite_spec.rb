require "rails_helper"

RSpec.describe UserFavorite, :type => :model do

  
  it { should have_one(:league).with_primary_key('favorite_id').with_foreign_key('id') }
	it { should have_one(:sport).with_primary_key('favorite_id').with_foreign_key('id') }


	before(:each) do |example|
		@user_favorite = FactoryBot.build(:user_favorite)
	end

	# test validations
 	it "should be valid when built with all required attributes" do
    expect(@user_favorite).to be_valid
  end

  it "should not be valid when built without a favorite_type" do
  	@user_favorite.favorite_type = nil
    expect(@user_favorite).not_to be_valid
  end



end

