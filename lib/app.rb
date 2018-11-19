class App < Roda
  route do |r|
    r.get 'users' do
      User.all.to_json
    end

    r.root do
      "Have a nice day!"
    end
  end
end
