require "spec-helper"

describe "creating mustdo lists" do
	it "redirects to mustdo list index page on success" do
		visit "/mustdo_lists"
		click_link "New mustdo list"
	end
end