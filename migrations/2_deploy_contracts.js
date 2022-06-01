var DataVerifier = artifacts.require("./DataVerifier.sol");

module.exports = function(deployer) {
  deployer.deploy(DataVerifier);
};
