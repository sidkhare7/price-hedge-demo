const hre = require("hardhat");
async function main() {
  const hedge = await hre.ethers.deployContract("PriceHedge");
  await hedge.waitForDeployment();
  const addr = await hedge.getAddress();
  console.log("PriceHedge deployed to:", addr);
  console.log("Paste this into index.html CONTRACT_ADDRESS:", addr);
}
main().catch((e) => { console.error(e); process.exit(1); });
