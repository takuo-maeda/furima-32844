document.addEventListener('DOMContentLoaded', function(){
  if (document.getElementById('item-image')){
    const ImageList = document.getElementById('image-list');

    //選択した画像を表示する関数
    const createImageHTML = (blob) => {
      //画像を表示するためにdiv要素を生成
      const imageElement = document.createElement('div');

      //表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);


      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('item-image').addEventListener('change', function(e){
      //画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('img');
      if (imageContent){
          imageContent.remove();
      }
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});