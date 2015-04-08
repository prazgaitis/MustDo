require 'spec_helper'

describe "creating mustdo lists" do
	it "redirects to mustdo list index page on success" do
		visit "/mustdo_lists"
		click_link "New Mustdo list"

		expect(page).to have_content "New mustdo_list"

		fill_in "Title", with: "The girl and the goat"
		fill_in "Category", with: "Restaurants"
		fill_in "Description", with: "Best food in Chicago"
		click_button "Create Mustdo list"

		expect(page).to have_content "Mustdo list was successfully created."
	end

	it "displays an error when the todo list has no title" do
		expect(MustdoList.count).to eq(0)

		visit "/mustdo_lists"
		click_link "New Mustdo list"

		expect(page).to have_content ""

		fill_in "Title", with: ""
		fill_in "Category", with: "Restaurants"
		fill_in "Description", with: "Best food in Chicago"
		click_button "Create Mustdo list"

		expect(page).to have_content("error")
		expect(MustdoList.count).to eq(0)

		visit "/mustdo_lists"
		expect(page).to_not have_content "The girl and the goat"
	end

	it "displays an error when the todo list has a title less than three characters" do
		expect(MustdoList.count).to eq(0)

		visit "/mustdo_lists"
		click_link "New Mustdo list"

		expect(page).to have_content ""

		fill_in "Title", with: "Hi"
		fill_in "Category", with: "Restaurants"
		fill_in "Description", with: "Best food in Chicago"
		click_button "Create Mustdo list"

		expect(page).to have_content("error")
		expect(MustdoList.count).to eq(0)

		visit "/mustdo_lists"
		expect(page).to_not have_content "The girl and the goat"
	end
end