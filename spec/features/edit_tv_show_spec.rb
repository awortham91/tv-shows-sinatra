require "spec_helper"
require 'pry'

feature "editing forms" do

# As a TV fanatic
# I want to edit an existing show
# So that I can correct any foolish mistakes
#
# Acceptance Criteria:
# * Editing a show provides a pre-populated form for each field.
# * Submitting the edit form will update a show if all validations pass.
# * The user is redirected to the details page for that show if successfully updated.
# * If the update fails any validations, re-display the form with the appropriate error messages.

  scenario "A user wants to edit a previoiusly submitted TV show" do
    game_of_thrones = TelevisionShow.create!({
        title: "Game of Thrones", network: "HBO",
        starting_year: 2011, genre: "Fantasy"
      })

    visit "/television_shows/2"
    click_link('Edit')
    expect(page).to have_content('Update Show')
    expect(page).to have_content('Game of Thrones')
    expect(page).to have_content('Title')
    fill_in('Synopsis:', with: 'Fantasy thriller with action and romance! and DRAGONS!... and tradegy')
    click_button('Edit TV Show')
    visit "/television_shows/2"
    expect(page).to have_content('Fantasy thriller with action and romance! and DRAGONS!... and tradegy')
  end

end
