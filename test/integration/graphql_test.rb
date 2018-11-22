require 'test_helper'

class GraphqlTest < ActionDispatch::IntegrationTest
  test "the truth" do
    query = <<-EOS
      query {
        user(id: 1) {
          id,
          name,
          email
        }
      }
    EOS

    post "/graphql", params: { query: query }
    assert_equal '{"data":{"user":{"id":"1","name":"MyString","email":"MyString"}}}', @response.body

    query = <<-EOS
      query { user {} }
    EOS
    post "/graphql", params: { query: query }
    assert_equal '{"errors":[{"message":"Parse error on \\"}\\" (RCURLY) at [1, 21]","locations":[{"line":1,"column":21}]}]}', @response.body
  end
end
