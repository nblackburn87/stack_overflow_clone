require 'spec_helper'

describe Question do
  context 'viewing' do
    it 'lets you view the index page' do
      visit questions_path
      page.should have_content "Stack DUNK!"
    end
  end
end
