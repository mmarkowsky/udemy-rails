require "rails_helper"

RSpec.feature "Deleting a article" do
    before do
        @article = Article.create(title: "One title", body: "One Body")
    end

    scenario "A user delete a article" do
        visit "/"

        click_link @article.title
        click_link "Delete Article"
        click_button "Aceptar"
        
        expect(page).not_to have_content(@article.title)
        expect(page).not_to have_content(@article.body)  
    end
end
