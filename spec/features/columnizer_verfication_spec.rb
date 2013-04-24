require 'spec_helper'

describe "Modify content in existing published Columnizer Pop", :js => true  do

  context "when viewing a published columnizer pop, the cache must be busted. In order to confirm this," do
    it "it should have a new pop title with the current date and update text in at least one of the assets" do
      ## login user
      visit sign_in_path
      click_on('Close')
      sleep 2
      fill_in('user_email', :with => USER_EMAIL)
      sleep 1
      fill_in('user_password', :with => USER_PASSWORD)
      sleep 1
      click_button('Login')
      sleep 1
      click_on('Close')

      current_path.should == pops_path
      sleep 1

      ## enter editor
      visit('https://editor-51780ece851707af64000035.populrstaging.com/____editor____/51780ece851707af64000035#/')
      sleep 5
      page.should have_content('Options')
      page.should have_content('Publish')

      now = DateTime.now.in_time_zone.to_s

      click_on('Options')
      fill_in('pop_name', :with => "Lucy Loves Pop (columnizer)" + now)
      sleep 1
      click_on('Options')
      sleep 2
      click_button('Publish Changes')
      sleep 5 #wait for Editor to close before proceeding

      ## check published pop for content
      visit('http://lovelucy.populrstaging.com/lucy-loves-pop')
      sleep 8
      page.should have_content("Live Music Every Day")
      save_and_open_page
    end
  end
end



  # stacks is packer
  # dean is columnizer √ß