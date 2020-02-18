require 'rails_helper'

describe "As a user, when I visit '/'" do
  describe "I select Turing and click on 'Find Nearest Station' and am redirected to '/search'" do
    it 'should see the closest 3 electric fuel station to me' do
      visit '/'
      select 'Turing', from: :location
      click_on "Find Nearest Station"
      expect(current_path).to eq('/search')
      
      expect(page).to have_css(".top-three")
      within(".top-three", count: 3) do
        within(first('.stations')) do 
          expect(page).to have_css('.name')
          expect(page).to have_css('.address')
          expect(page).to have_css('.fuel-type')
          expect(page).to have_css('.access-times')
        end 
      end
    end
  end
end