require "spec_helper"

describe UserDatabase do
  let(:user_database) { UserDatabase.new }

  describe "#insert" do
    it "returns the object if it succeeds" do
      user_as_hash = {:username => "jetaggart", :password => "password"}

      result = user_database.insert(user_as_hash)

      expect(result).to include({:username => "jetaggart", :password => "password"})
    end

    it "gives the user an id" do
      user_as_hash = {:username => "jetaggart", :password => "password"}

      user = user_database.insert(user_as_hash)

      expect(user[:id]).to eq(1)
    end

    it "offsets the id by how many users exist" do
      user_database.insert({:username => "jetaggart", :password => "some password"})
      second_user = user_database.insert(:username => "another_name", :password => "some other password")

      expect(second_user[:id]).to eq(2)
    end
  end
end
