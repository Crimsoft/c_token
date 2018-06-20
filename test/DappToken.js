var DappToken = artifacts.require("./DappToken.sol");

contract("DappToken", function(accounts) {
	var tokenInstance;

	it("sets total number of tokens upon deployment", function() {
		return DappToken.deployed().then(function(instance) {
			tokenInstance = instance;
			return tokenInstance.totalSupply();
		}).then(function(totalSupply) {
			assert.equal(totalSupply.toNumber(), 1000000, "sets total no. of tokens to 1,000,000");
		});
	});
});