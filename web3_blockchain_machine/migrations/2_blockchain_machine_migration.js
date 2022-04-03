const BlockchainMachine = artifacts.require("BlockchainMachine");

module.exports = function (deployer) {
  deployer.deploy(BlockchainMachine);
};