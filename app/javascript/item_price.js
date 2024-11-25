window.addEventListener('turbo:load', () => {
  console.log("OK");
});

const price = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addprofitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    addprofitDom.innerHTML = Math.floor(inputValue * 0.9);
  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);