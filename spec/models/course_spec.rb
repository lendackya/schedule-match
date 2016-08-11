require 'rails_helper'

RSpec.describe Course, type: :model do

let(:course) { FactoryGirl.create(:course) }

  # it "Has a valid factory" do
  #   expect(course).to be_valid
  # end

  describe "Validations" do

    it "does not allow empty start time" do
      expect(FactoryGirl.build(:course, starts_time: nil)).to_not be_valid
    end

    it "does not allow empty end time" do
      expect(FactoryGirl.build(:course, ends_time: nil)).to_not be_valid
    end

    it "does not allow empty user id" do
      expect(FactoryGirl.build(:course, user_id: nil)).to_not be_valid
    end

    it "does not allow empty name" do
      expect(FactoryGirl.build(:course, name: nil)).to_not be_valid
    end
  end
end
