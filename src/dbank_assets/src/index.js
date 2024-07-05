import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async () => {
  try {
    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerText = currentAmount;
  } catch (error) {
    console.error("Error fetching balance:", error);
  }
});
