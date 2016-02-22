FactoryGirl.define do
  factory :song do
		name "Unreal (prod. PD) - Tate Tucker"
		published_at ""
		soundcloud_url "https://soundcloud.com/propervibesrecs/unreal-prod-pd-tate-tucker"
		trait :with_art do
			song_art { File.open("#{Rails.root}/spec/support/unreal.jpg") }
		end
		trait :without_art do
			song_art nil
		end
  end
end
