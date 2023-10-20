require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    it 'assigns @articles' do
      articles = FactoryBot.create_list(:article, 3)
      get :index
      expect(assigns(:articles)).to eq(articles)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested article to @article' do
      article = FactoryBot.create(:article)
      get :show, params: { id: article.id }
      expect(assigns(:article)).to eq(article)
    end
  end

  describe 'GET #new' do
    it 'assigns a new article to @article' do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new article' do
        valid_attributes = { article: { title: 'New Article', body: 'This is the body' } }
        expect {
          post :create, params: valid_attributes
        }.to change(Article, :count).by(1)
      end

      it 'redirects to the created article' do
        valid_attributes = { article: { title: 'New Article', body: 'This is the body' } }
        post :create, params: valid_attributes
        expect(response).to redirect_to(Article.last)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new article' do
        invalid_attributes = { article: { title: '', body: '' } }
        expect {
          post :create, params: invalid_attributes
        }.not_to change(Article, :count)
      end

      it 'renders :new with unprocessable_entity status' do
        invalid_attributes = { article: { title: '', body: '' } }
        post :create, params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested article' do
      article = FactoryBot.create(:article)
      expect {
        delete :destroy, params: { id: article.id }
      }.to change(Article, :count).by(-1)
    end

    it 'redirects to the root path with a 303 status' do
      article = FactoryBot.create(:article)
      delete :destroy, params: { id: article.id }
      expect(response).to redirect_to(root_path)
      expect(response).to have_http_status(303)
    end
  end
end
