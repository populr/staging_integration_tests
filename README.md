staging_integration_tests
=========================



GETTING STARTED
----------------
1. Clone Repository
2. In a terminal window, navigate to the repository folder
3. To run the columnizer test, paste => rspec spec/features/columnizer_verfication_spec.rb
4. To run the packer test, paste => rspec spec/features/packer_verification_spec.rb
Enjoy!


TEST ADJUSTMENTS & NOTES
----------------
To change the speed at any point, locate 'sleep' in the test file and adjust the numeric value to reflect the time in 
seconds to wait before proceeding. Ex. sleep 1 => wait 1 second, sleep 60 => wait 60 seconds

To pause the test, locate 'save_and_open_page' in the test file and place it as needed.

'#'  symbol indicates an option that could be added to the test

'##' symbol indicates a description for a block of code for each portion in the test. Do NOT remove these comments.

'#*' symbol indicates a 'sleep' option that is waiting for the environment to load, DO NOT CHANGE.


USER CREDENTIALS
----------------

Located in app/config/initializers directory
