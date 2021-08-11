# require 'rails_helper'

# RSpec.describe "reports/index", type: :view do
#   before(:each) do
#     assign(:reports, [
#       Report.create!(
#         user_id: "User",
#         : 2,
#         author_id: "Author",
#         : 3,
#         text: "Text",
#         : "MyText"
#       ),
#       Report.create!(
#         user_id: "User",
#         : 2,
#         author_id: "Author",
#         : 3,
#         text: "Text",
#         : "MyText"
#       )
#     ])
#   end

#   it "renders a list of reports" do
#     render
#     assert_select "tr>td", text: "User".to_s, count: 2
#     assert_select "tr>td", text: 2.to_s, count: 2
#     assert_select "tr>td", text: "Author".to_s, count: 2
#     assert_select "tr>td", text: 3.to_s, count: 2
#     assert_select "tr>td", text: "Text".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#   end
# end
