require 'rails_helper'

feature 'Comment' do
  let(:comments_page) { BasePage.new(root_path) }

  scenario 'Comments index page' do
    comments_page.open
    expect(page).to have_content('Listing Comments')
  end

  scenario 'Comment validations' do
    comments_page.open
    click_link 'New Comment'
    find_button('Create Comment').trigger(:click)
    expect(page).to have_content('2 errors prohibited this comment from being saved')
    fill_in 'Name', with: 'Oleh'
    find_button('Create Comment').trigger(:click)
    expect(page).to have_content("Body can't be blank")
  end

  scenario 'Create comment' do
    comments_page.open
    click_link 'New Comment'
    expect(page).to have_content('New Comment')
    fill_in 'Name', with: 'Oleh'
    fill_in 'Body', with: 'Hello all'
    find_button('Create Comment').trigger(:click)
    expect(page).to have_content('Comment was successfully created.')
  end

  scenario 'Update Comment' do
    comments_page.open
    expect(page).to have_content('Oleh')
    click_link 'Edit'
    fill_in 'Name', with: ''
    find_button('Update Comment').trigger(:click)
    expect(page).to have_content("Name can't be blank")
    fill_in 'Name', with: 'Igor'
    find_button('Update Comment').trigger(:click)
    expect(page).to have_content('Comment was successfully updated.')
  end

  scenario 'Show comment' do
    comments_page.open
    click_link 'Show'
    expect(page).to have_content('Igor')
  end

  scenario 'Destroy comment' do
    comments_page.open
    click_link 'Destroy'
    expect(page).to have_content('Comment was successfully destroyed')
    expect(page).to have_no_content('Igor')
  end
end
