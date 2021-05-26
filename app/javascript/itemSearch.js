if (location.pathname.match("/")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("input_box");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("input_box").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `items/search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const itemName = XHR.response.keyword;
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const itemName = XHR.response.keyword;
          itemName.forEach((item_search) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", item_search.id);
            childElement.innerHTML = item_search.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(item_search.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("input_box").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};