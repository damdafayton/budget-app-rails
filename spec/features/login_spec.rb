require 'rails_helper'

RSpec.describe 'Login tests' do
  before(:all) do
    visit user_session_path
  end

  it 'signs in the use' do
    fill_in 'Email', with: 'fake@fake.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
  end

end