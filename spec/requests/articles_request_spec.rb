require 'rails_helper'

RSpec.describe "Articles", type: :request do

  before do
    @article = Article.create(title:"This one" , body:"Yhis body one")
  end

  describe "GET /articles/:id" do
    context "with existing article" do
      before { get "/articles/#{@article.id}" } do
        it "handing existing article" do
          expect(response.status).to eql 200
        end
      end
    end
    
    context "with non-existing article" do
      before { get "/articles/xxxx" } do
        it "handing non-existing article" do
          expect(response.status).to eql 404
          flash_message = "The article you are looking for could not be found"
          expect(flash[:alert]).to eq flash_message
        end
      end
    end
  end
end
