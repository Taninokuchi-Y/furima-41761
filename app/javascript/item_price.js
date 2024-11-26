const price = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addprofitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxAmount = Math.floor(inputValue * 0.1);
    const profitAmount = inputValue - taxAmount;

    addTaxDom.innerHTML = taxAmount;
    addprofitDom.innerHTML = profitAmount;
  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);