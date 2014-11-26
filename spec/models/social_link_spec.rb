require 'spec_helper'

describe SocialLink do
  it 'should validate presence of :site' do
    expect(subject).to validate_presence_of :site
  end

  it 'should validate presence of :account_id' do
    expect(subject).to validate_presence_of :account_id
  end

  it 'should validate presence of :user' do
    expect(subject).to validate_presence_of :user
  end

  context 'when all database fields are specified' do
    before do
      subject.site = 'test_site'
      subject.account_id = 'test_account_id'
    end

    context 'and no base url is specified in configuration' do
      before do
        Rails.configuration.base_urls.test_site = nil
      end

      it 'should have an error on the base_url field' do
        expect(subject).to have(1).error_on :base_url
      end

      it 'should have a nil #url' do
        expect(subject.url).to be_nil
      end
    end

    context 'and a base url is specified in configuration' do
      before do
        Rails.configuration.base_urls.test_site = 'test_site_base_url'
      end

      it 'should not have an error on the base_url field' do
        expect(subject).to have(:no).errors_on :base_url
      end

      it 'should have the correct #url' do
        expect(subject.url).to eq 'test_site_base_url/test_account_id'
      end
    end
  end
end
