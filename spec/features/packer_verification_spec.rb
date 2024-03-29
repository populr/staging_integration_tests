require 'spec_helper'

describe "Visual verfication of assets in a published Columnizer Pop", :js => true  do

  context "when viewing a published columnizer pop, the cache must be busted. In order to confirm this," do
    it "it should have a new pop title with the current date and update text in at least one of the assets" do
      ## login user
      visit sign_in_path
      click_on('Close')
      sleep 2 #use sleep to adjust wait time inbetween steps, i.e. sleep 60 is on minute
      fill_in('user_email', :with => USER_EMAIL)
      sleep 1
      fill_in('user_password', :with => USER_PASSWORD)
      sleep 3
      click_button('Login')
      sleep 1
      click_on('Close')

      # pop index page
      current_path.should == pops_path
      sleep 1

      ## enter editor
      visit('https://editor-517ef20354b709a75c000007.populrstaging.com/____editor____/517ef20354b709a75c000007#/')
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
      fill_in('pop_name', :with => "Nashville Life (packer) " + now)
      sleep 1
      click_on('Options')
      sleep 2
      click_button('Publish Changes')
      sleep 5 #wait for Editor to close before proceeding



      ## add password to pop
      find('button span.caret').click
      sleep 2
      click_on('Publish + Share')
      sleep 2
      click_on('Close')
      find('a#pop-lock').click
      within('div.modal') do
        page.execute_script("$ ('input.publish_url_bar_password_field').val('#{USER_PASSWORD}')" )
        sleep 2
        click_on('Save')
      end
      visit pops_path

      ## check password protected published pop
      visit('https://staging-integration-testing.populrstaging.com/qa-template-pop-packer')
      sleep 2
      fill_in('Password', :with => 'password2013')
      sleep 3
      click_on('Go')
      sleep 7
      expect(page).to have_title 'Nashville Life (packer) ' + now

      ## remove password from pop
      visit('https://editor-517ef20354b709a75c000007.populrstaging.com/____editor____/517ef20354b709a75c000007#/')
      find('button span.caret').click
      sleep 2
      click_on('Publish + Share')
      sleep 2
      click_on('Close')
      find('a#pop-lock').click
      within('div.modal') do
        page.execute_script("$ ('input.publish_url_bar_password_field').val('')" )
        sleep 3
        click_on('Save')
      end
      sleep 5 #* wait for system to save password



      ## check published pop for updated title
      visit('http://staging-integration-testing.populrstaging.com/qa-template-pop-packer')
      sleep 5
      expect(page).to have_title 'Nashville Life (packer) ' + now
      # save_and_open_page  ## uncomment this to keep the page open after the test runs
    end
  end
end
