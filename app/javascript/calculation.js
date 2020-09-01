//items/newでのみ動くfunction{
  window.addEventListener('load', function(){
    let price_form = document.getElementById("item-price");
    console.log(price_form)
    let tax_form = document.getElementById("add-tax-price");
    let profit_form = document.getElementById("profit");
  
    price_form.addEventListener("keyup",function(){

      const price = price_form.value;
      const tax = price * 0.1;
      const profit = price - tax;
      
      tax_form.innerHTML = tax;
      profit_form.innerHTML = profit;
    });
  })
// }