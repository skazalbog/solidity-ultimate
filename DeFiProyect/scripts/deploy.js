async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contract with the account:", deployer.address);
  
    const initialSupply = ethers.utils.parseEther("1000");  // Suministro inicial de tokens
    const DeFiContract = await ethers.getContractFactory("DeFiContract");
    const defi = await DeFiContract.deploy(initialSupply);
  
    console.log("DeFiContract deployed to:", defi.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });
  