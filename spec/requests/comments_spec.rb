require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:article) { create(:article) }

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new comment' do
        expect do
          post :create, params: { article_id: article.id, comment: { commenter: 'John', body: 'Great article!' } }
        end.to change(Comment, :count).by(1)
      end

      it 'redirects to the article show page' do
        post :create, params: { article_id: article.id, comment: { commenter: 'John', body: 'Great article!' } }
        expect(response).to redirect_to(article_path(article))
      end
    end
  end
end
