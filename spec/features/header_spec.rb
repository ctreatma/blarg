require 'spec_helper'

describe 'The header' do
  before do
    @user = User.create name: 'The user',
                        email: 'theuser@example.com',
                        password: 'thepassword'
  end

  context 'when the user has no external accounts' do
    before do
      visit root_path
    end

    it 'should not have any links to external accounts' do
      expect(page).not_to have_selector('.social-links li')
    end
  end

  context 'when the user has an external account' do
    before do
      Rails.configuration.base_urls.test_site = 'test_base_url'
      @social_link = @user.social_links.build site: 'test_site',
                                              account_id: 'test-id'
      @social_link.save
      visit root_path
    end

    it 'should have a link to the external account' do
      expect(page).to have_selector('.social-links .fa.fa-test-site')
    end
  end
end
