require "rspec"

class ChangeMachine
  def change(money)
    output = []
    while money > 0
      if money >= 25
        if money % 25 == 0
          (money / 25).times do
            output << 25
            money = money - 25
          end
        end
      elsif money % 10
      end
      return output
    end
  end
end

RSpec.describe ChangeMachine do
  describe "#change" do
    it "should return [1] when given 1" do
      machine = ChangeMachine.new
      expect(machine.change(1)).to eq([1])
    end

    it "should return [25] when given 25" do
      machine = ChangeMachine.new
      expect(machine.change(25)).to eq([25])
    end
  end
end
