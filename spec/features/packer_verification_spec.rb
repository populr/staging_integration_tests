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
      visit('https://editor-517820ba851707af6400003d.populrstaging.com/____editor____/517820ba851707af6400003d#/')
      sleep 5
      page.should have_content('Options')
      page.should have_content('Publish')

      now = DateTime.now.in_time_zone.to_s

      ## revised text in iframe
      page.driver.browser.switch_to.frame 'pop-frame'
      find('.documents-content').click
      sleep 1
      page.execute_script("$ ('.documents-content').html('Food Critic Reviews Encouraged. #{now}')" )
      sleep 2

      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      find('body').click #forces autosave of changed text
      click_on('Options')
      fill_in('pop_name', :with => "Lucy Loves Nashville Life (packer)" + now)
      sleep 1
      click_on('Options')
      sleep 2
      click_button('Publish Changes')
      sleep 5 #wait for Editor to close before proceeding

      ## check published pop for content
      visit('http://lovelucy.populrstaging.com/lucy-lovesnashville-life')
      sleep 5
      page.should have_content("Live Music Every Day")
      save_and_open_page
    end
  end
end
