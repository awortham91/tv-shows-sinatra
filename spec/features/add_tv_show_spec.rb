require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario "User successfully adds a new show via the form" do
    visit "/television_shows/new"
    click_button('Add TV Show')
    fill_in('Title', with: "Silicon Valley")
    fill_in('Network', with: 'HBO')
    fill_in('Starting Year', with: 2099)
    click_button('Add TV Show')
    expect(page).to have_content "Silicon Valley (HBO)"
  end

  scenario "User fails when attempting to submit form with invalid information" do
    visit "/television_shows/new"
    click_button('Add TV Show')
    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Starting year can\'t be blank')
    expect(page).to have_content('Starting year is not a number')
    expect(page).to have_content('Add Show')
  end
end
