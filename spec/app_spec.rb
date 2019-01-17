require_relative "../lib/app"
describe "the all_bitcoin method" do
  it "return the hash of coins and prices" do
	  expect(all_bitcoin(symbol, price)).to eq("[{ \"BTC\" => 5245.12 },{ \"ETH\" => 217.34 }]")
  end
end
