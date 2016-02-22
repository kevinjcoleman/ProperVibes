require 'rails_helper'

RSpec.describe Song, :type => :model do
  it "has valid info" do
		valid_song = FactoryGirl.create(:song)
		expect(valid_song).to be_valid
	end

	it "has invalid info" do
		invalid_song = FactoryGirl.build(:song, soundcloud_url: "mysong.com")
		expect(invalid_song).to_not be_valid
	end

	it "publishes with song art" do
		song_with_art = FactoryGirl.create(:song, :with_art)
		song_with_art.publish
		expect(song_with_art.published?).to be_truthy
	end

	it "doesn't publish with song without art" do
		song_without_art = FactoryGirl.create(:song, :without_art)
		song_without_art.publish
		expect(song_without_art.published?).to be_falsey
	end

	it "should be unique" do
		song = FactoryGirl.create(:song)
		dupe_song = FactoryGirl.build(:song)
		expect(dupe_song).to_not be_valid
	end
end
