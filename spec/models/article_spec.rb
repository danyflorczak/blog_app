require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Associations' do
    it 'should have many comments' do
      should have_many(:comments).dependent(:destroy)
    end
  end

  describe 'Validations' do
    it 'should validate the presence of title' do
      should validate_presence_of(:title)
    end

    it 'should validate the presence of body' do
      should validate_presence_of(:body)
    end
  end
end
