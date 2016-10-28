require 'rails_helper'

require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Category.new
        expect(company).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Category.new(name: "Web Development")
      expect(company).to respond_to(:jobs)
    end
  end

end
