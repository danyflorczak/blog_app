require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it 'should belong to an article' do
      should belong_to(:article)
    end
  end
end
