function setting() {
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("input", () => {
    const countVal = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = parseInt(countVal * 0.1);
    addTaxPrice.innerHTML.toLocaleString();
    profit.innerHTML = countVal - addTaxPrice.innerHTML
  });
}


window.addEventListener("load", setting);