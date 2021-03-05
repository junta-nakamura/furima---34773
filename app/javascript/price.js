function setting() {
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("input", () => {
    const countVal = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = countVal * 0.1;
    const profit = document.getElementById("profit");
    profit.innerHTML = countVal - addTaxPrice.innerHTML
  });
}


window.addEventListener("load", setting);