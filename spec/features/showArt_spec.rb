require "rails_helper"

RSpec.feature "Showing a article" do
    
    before do
        @article = Article.create(title: "title1",body: "Body1")
    end

    scenario "A user shows on article" do
        visit "/"

        click_link @article.title

        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eql(article_path(@article))
    end
end