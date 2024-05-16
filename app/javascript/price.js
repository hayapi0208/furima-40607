function price (){
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener("input", (e) => {
    e.preventDefault();
    const inputValue = price.value;
    tax.innerHTML = Math.floor(inputValue*0.1)
    profit.innerHTML = Math.floor(inputValue-tax.innerHTML)
  });
 };
 
 window.addEventListener('turbo:load', price);
 window.addEventListener('turbo:render', price);