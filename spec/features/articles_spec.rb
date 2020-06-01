require "rails_helper"

RSpec.feature "Articles" do
    scenario "user create new article" do
        visit "/"
        
        click_link "New Article"
        fill_in "Title",with: "Creating a blog"
        fill_in "Body" , with: "body text"
        click_button "Create Article"

        expect(page).to have_content("Article has been create") 
        expect(page.current_path).to eq(article_path) 

    end
end
