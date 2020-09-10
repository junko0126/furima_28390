if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const imageList = document.getElementById('image-list');
    
    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('width','200');
      blobImage.setAttribute('height','200');
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      imageList.appendChild(imageElement);
    };

    document.getElementById('item-image').addEventListener('change', function(e){
      const imageContent = document.querySelector('img[class="item-image"]');
      console.log(imageContent);
      if (imageContent){
        console.log(111)
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}