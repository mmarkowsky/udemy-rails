require "rails_helper"

RSpec.feature "Articles" do
    scenario "user create new article" do
        visit "/"
        
        click_link "New Article" 
        fill_in "Title",with: "Creating a blog"
        fill_in "Body" , with: "body text"
        click_button "Create Article"

        expect(page).to have_content("Article has been create") 
        expect(page.current_path).to eq(articles_path)
    end

    scenario "a user fails to create a article" do
        visit "/"
        
        click_link "New Article" 
        fill_in "Title",with: ""
        fill_in "Body" , with: ""
        click_button "Create Article"

        expect(page).to have_content("The article was not created") 
        expect(page).to have_content("Title can't be black") 
        expect(page).to have_content("Body can't be blank") 
        expect(page.current_path).to eq(articles_path)
    end
end
