const pay = () => {

  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const cardInfo = (card) => {
        Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      };

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      
      document.getElementById("charge-form").submit();
    });
    };

      const path = location.pathname
      const params = path.replace(/items/g, '').replace(/purchases/g, '').replace(/\//g, '');
      if (path.includes("items") && path.includes("purchases") && /^([1-9]\d*|0)$/.test(params)) {
      
      const card = {
        number: formData.get("address_purchase[number]"),
        cvc: formData.get("address_purchase[cvc]"),
        exp_month: formData.get("address_purchase[exp_month]"),
        exp_year: `20${formData.get("address_purchase[exp_year]")}`,
       };
       cardInfo(card);
    };

    const pathCard = location.pathname
    if (pathCard.includes("cards") && pathCard.includes("new")) {
      
      const card = {
        number: formData.get("card[number]"),
        cvc: formData.get("card[cvc]"),
        exp_month: formData.get("card[exp_month]"),
        exp_year: `20${formData.get("card[exp_year]")}`,
      };
      cardInfo(card);
    };
  });
};

window.addEventListener("load", pay);

