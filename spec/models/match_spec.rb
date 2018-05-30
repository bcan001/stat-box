require "rails_helper"

RSpec.describe Match, :type => :model do

  # test associations
  it { should belong_to(:sport) }
  it { should belong_to(:league) }
  it { should belong_to(:team1) }
  it { should belong_to(:team2) }


	# before(:each) do |example|
	# 	@match = FactoryBot.build(:match)
	# end






end

