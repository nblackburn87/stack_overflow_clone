require 'spec_helper'

describe Question do
  context 'viewing' do
    it 'lets you view the index page' do
      visit questions_path
      page.should have_content "Stack DUNK!"
    end
  end
end

# describe Answer do
#   context 'creating an answer' do
#     it 'lets you answer a question' do
#       visit questions_path
#       question = Factory
