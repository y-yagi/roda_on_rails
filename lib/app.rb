class App < Roda
  route do |r|
    r.root do
      "Have a nice day!"
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
