import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async () => {
  try {
    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerText =
      Math.round(currentAmount * 100) / 100;
  } catch (error) {
    console.error(error);
  }
});

document.querySelector("form").addEventListener("submit", async (event) => {
  try {
    event.preventDefault();
    const button = event.target.querySelector("#submit-btn");

    const inputAmount = parseFloat(
      document.getElementById("input-amount").value
    );
    const outputAmount = parseFloat(
      document.getElementById("withdrawal-amount").value
    );
    button.setAttribute("disabled", true);
    if (document.getElementById("input-amount").value.length != 0) {
      await dbank.topUp(inputAmount);
    }
    if (document.getElementById("withdrawal-amount").value.length != 0) {
      await dbank.withdraw(outputAmount);
    }
    await dbank.compound();

    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerText =
      Math.round(currentAmount * 100) / 100;
    document.getElementById("input-amount").value = "";
    document.getElementById("withdrawal-amount").value = "";
    button.removeAttribute("disabled");
  } catch (error) {
    console.log(error);
  }
});
