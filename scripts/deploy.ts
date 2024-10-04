import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contract with the account:", deployer.address);

  // Define the candidates for the voting
  const candidates = ["James", "Ngozi", "Charles"];

  // Get the contract factory and deploy the contract
  const Voting = await ethers.getContractFactory("Voting");
  const votingContract = await Voting.deploy(candidates);

  // Wait for the contract to be deployed
  await votingContract.waitForDeployment();

  console.log("Voting contract deployed at:", votingContract.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
