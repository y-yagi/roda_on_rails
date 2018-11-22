class App < Roda
  route do |r|
    r.root do
      "Have a nice day!"
    end

    r.post 'graphql' do
      variables = request.params["variables"]
      query = request.params["query"]
      operation_name = request.params["operationName"]
      context = {}
      RodaOnRailsSchema.execute(query, variables: variables, context: context, operation_name: operation_name).to_json
    end

    r.on 'api' do
      r.get 'users' do
        User.all.to_json
      end

      r.on 'user', Integer do |id|
        r.get do
          User.find(id).to_json
        end
      end
    end
  end
end
