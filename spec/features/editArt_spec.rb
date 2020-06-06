require "rails_helper"


RSpec.feature "Editing a article" do
    before do
        @article = Article.create(title: "I new one" , body: "New body")
    end

    scenario "A user update a article" do
        visit "/"

        click_link @article.title
        fill_in "Title",	with: "Title one" 
        fill_in "Body",	with: "sometext body"
        click_button "Update Article"
        expect(page).to have_content("Title one")
        expect(page).to have_content("sometext body")  
    end

    scenario "A user fails to update a article" do
        visit "/"

        click_link @article.title
        fill_in "Title",	with: "" 
        fill_in "Body",	with: ""
        click_button "Update Article"
        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Body can't be blank")  
    end
end