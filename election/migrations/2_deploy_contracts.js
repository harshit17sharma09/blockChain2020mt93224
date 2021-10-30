var Election = artifacts.require("./Election.sol"); /* referring to Contract */


module.exports = function(deployer) {
  deployer.deploy(Election);
 
};


