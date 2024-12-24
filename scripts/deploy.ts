import hre from "hardhat";

const { ethers } = hre;
async function main() {
  //We get the contract to deploy
  const DeckToken = await ethers.getContractFactory("CoinDeck");
  
  // // Define the address of the admin
 const adminAddress = process.env.ADMIN_ADDRESS as string;


  // Deploy the contract 
  const deckToken = await DeckToken.deploy(adminAddress);

  await deckToken.waitForDeployment()

  const contractAddress = await deckToken.getAddress();

  await hre.run("verify:verify", {
    address: contractAddress,
    constructorArguments: [adminAddress],
  });
}




main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
