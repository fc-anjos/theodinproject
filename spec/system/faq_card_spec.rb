require 'rails_helper'

RSpec.describe 'FAQ Card', type: :system do
  before do
    visit root_path
    find(:test_id, 'faq-link').click
  end

  context 'when a question has not been selected' do
    it 'does not have a visible answer' do
      expect(page).to have_selector('[data-test-id="faq-answer"]', visible: :hidden)
    end
  end

  context 'when a question has been selected' do
    it 'makes the answer visible' do
      find(:test_id, 'faq-question').click
      expect(find(:test_id, 'faq-answer')).to be_visible
    end
  end

  context 'when an answer is visible' do
    before do
      find(:test_id, 'faq-question').click
    end

    it 'hides the answer when the question is selected' do
      find(:test_id, 'faq-question').click
      expect(page).to have_selector('[data-test-id="faq-answer"]', visible: :hidden)
    end
  end
end
