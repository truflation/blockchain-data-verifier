const DataVerifier = artifacts.require("DataVerifier");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("DataVerifier", function (/* accounts */) {
  it("should assert true", async function () {
    await DataVerifier.deployed();
    return assert.isTrue(true);
  });
});
