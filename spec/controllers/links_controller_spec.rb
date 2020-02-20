require 'rails_helper'

RSpec.describe LinksController, type: :request do
    describe "Test feature integration" do
        it "Root path should have a form to create URL and redirects correctly" do
            visit root_path
            fill_in "link[url]", with: "www.gmail.com"
            expect { click_button "commit" }.to change(Link, :count).by(1)
            expect(page).to have_content("http://gmail.com")
        end

        it "Duplicated link shoud not add new record to the database" do
            visit root_path
            fill_in "link[url]", with: "www.google.com"
            expect { click_button "commit" }.to change(Link, :count).by(1)
            expect(page).to have_content("http://google.com")
            
            urls = [
                "https://google.com",
                "http://google.com",
                "https://www.google.com",
                "www.google.com",
                "google.com"
            ]

            urls.each do |url|
                visit root_path
                fill_in "link[url]", with: url
                expect { click_button "commit" }.to change(Link, :count).by(0)
                expect(page).to have_content("http://google.com")
            end
        end
        
        it "Invalid short links should raise Not Found error" do
            expect { visit "/invalid_slug" }.to raise_error("Not Found")
        end
    end
end
