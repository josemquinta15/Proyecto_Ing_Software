# require 'rails_helper'

# RSpec.describe "reports/new", type: :view do
#   before(:each) do
#     assign(:report, Report.new(
#       user_id: "MyString",
#       : 1,
#       author_id: "MyString",
#       : 1,
#       text: "MyString",
#       : "MyText"
#     ))
#   end

#   it "renders new report form" do
#     render

#     assert_select "form[action=?][method=?]", reports_path, "post" do

#       assert_select "input[name=?]", "report[user_id]"

#       assert_select "input[name=?]", "report[]"

#       assert_select "input[name=?]", "report[author_id]"

#       assert_select "input[name=?]", "report[]"

#       assert_select "input[name=?]", "report[text]"

#       assert_select "textarea[name=?]", "report[]"
#     end
#   end
# end
