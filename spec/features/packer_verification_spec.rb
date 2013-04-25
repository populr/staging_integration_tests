require 'spec_helper'

describe "Visual verfication of assets in a published Columnizer Pop", :js => true  do

  context "when viewing a published columnizer pop, the cache must be busted. In order to confirm this," do
    it "it should have a new pop title with the current date and update text in at least one of the assets" do
      ## login user
      visit sign_in_path
      click_on('Close')
      sleep 2
      fill_in('user_email', :with => USER_EMAIL)
      sleep 1
      fill_in('user_password', :with => USER_PASSWORD)
      sleep 3
      click_button('Login')
      sleep 1
      click_on('Close')

      current_path.should == pops_path
      sleep 1

      ## enter editor
      visit('https://editor-517820ba851707af6400003d.populrstaging.com/____editor____/517820ba851707af6400003d#/')
      sleep 5
      page.should have_content('Options')
      page.should have_content('Publish')

      now = DateTime.now.in_time_zone.to_s

      ## add new asset to pop
      # click_on('Add Content')
      # sleep 1
      # find('.add-embed').click
      # click_on("I'm Done")
      # sleep 1

      click_on('Options')
      fill_in('pop_name', :with => "Nashville Life (packer)" + now)
      sleep 1
      click_on('Options')
      sleep 2
      click_button('Publish Changes')
      sleep 5 #wait for Editor to close before proceeding

      ## check published pop for content
      visit('http://lovelucy.populrstaging.com/lucy-lovesnashville-life')
      sleep 5
      expect(page).to have_title 'Nashville Life (packer) ' + now
      # save_and_open_page
    end
  end
end
