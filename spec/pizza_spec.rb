require './pizza'

describe Pizza do
  it "exists" do
    expect(Pizza).to be_a(Class)
  end
  describe '.initialize' do
	  it 'records all toppings' do
	  	toppings = [
	  		Topping.new('mushrooms', vegetarian: true),
	  		Topping.new('pepperoni')
	  	]
	  	pizza = Pizza.new(toppings)
		end
		it 'defaults the toppings to cheese only, if the pizza has no toppings' do
			pizza = Pizza.new

			expect(pizza.toppings.size).to eq(1)
			expect(pizza.toppings.first.name).to eq('cheese')
		end
    it 'sets default delivery time equal to nil' do
      pizza = Pizza.new

      expect(pizza.delivery_time).to eq(nil)
    end
	end
  describe '.vegetarian?' do
      it 'checks if all toppings on a pizza are vegetarian' do
        toppings = [
          Topping.new('bell peppers', vegetarian: true),
          Topping.new('mushrooms', vegetarian: true),
          Topping.new('onions', vegetarian: true)
        ]
        pizza = Pizza.new(toppings)
        expect(pizza.vegetarian?).to eq(true)

      end
    end
  describe '.add_topping' do
    it 'adds a new topping to a pizza' do
      pizza = Pizza.new
      pizza.add_topping(Topping.new('sausage', vegetarian: false))

      expect(pizza.toppings.count).to eq(2)
    end
  end
  describe '.deliver!' do
    it 'increases delivery_time attribute by 30 minutes' do
      pizza = Pizza.new

      expect(pizza.deliver!).to be_between(Time.now + 30*60-60, Time.now + 30*60+60)
    end
  end
  describe '.late?' do
    it 'retuns true if time is later than delivery_time' do
      pizza = Pizza.new
      
      pizza.deliver!

      time = pizza.delivery_time + 300

      expect(pizza.late?).to eq(true)
    end
  end
end

describe Topping do
  it "exists" do
    expect(Topping).to be_a(Class)
  end
  describe '.initialize' do
  	it "sets the name of the topping" do
  		topping = Topping.new('olives')

  		expect(topping.name).to eq('olives')
  	end
  	it 'sets whether or not the topping is vegetarian' do
  		topping = Topping.new 'bell peppers', vegetarian: true

  		expect(topping.vegetarian).to eq(true)
  	end
  end
end
