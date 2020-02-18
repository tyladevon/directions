require 'rails_helper'

describe "As a user, when I visit '/'" do
  describe "I select Turing and click on 'Find Nearest Station' and am redirected to '/search'" do
    it 'should see the closest electric fuel station to me' do
      visit '/'
      select 'Turing', from: :location
      click_on "Find Nearest Station"
      expect(current_path).to eq('/search')

      within('.closest-station') do
        expect(page).to have_css('.name')
        expect(page).to have_css('.address')
        expect(page).to have_css('.fuel-type')
        expect(page).to have_css('.access-times')
      end

      within('.directions') do
        expect(page).to have_content("Distance of Nearest Station")
        expect('.distance').to_not be_empty
        expect(page).to have_content("Travel time")
        expect('.travel-time').to_not be_empty
        expect(page).to have_content("Instructions")
        expect('.instructions').to_not be_empty
      end
    end 
  end
end 