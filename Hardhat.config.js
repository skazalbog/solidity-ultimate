require("@nomiclabs/hardhat-ethers");

module.exports = {
  solidity: "0.8.0",
  networks: {
    sepolia: {
      url: "https://rpc.sepolia.org",
      accounts: [`0x${e06593f7d84ad01ed225984a32762486d59d9b0814c4d123761c15029d720739}`]  // Reemplaza con tu clave privada
    }
  }
};
