if (document.URL.match( /new/) || document.URL.match( /edit/)){
document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');
  const createImageHTML = (blob) => {
    const imageElement = document.createElement('div');

    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);
  }
  document.getElementById('stylist_stylist_detail_image').addEventListener('change',function(e){
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    
    createImageHTML(blob);
  });
});
}

if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-url')

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)
      blobImage.setAttribute('class', "hidden")
      blobImage.setAttribute('class','form-image')
      blobImage.setAttribute('class', "image-file")

      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id',`stylist_portraits_${imageElementNum}` )
      inputHTML.setAttribute('name','stylist_stylist_detail[portraits][]' )
      inputHTML.setAttribute('type', 'file')

      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file)

        createImageHTML(blob)
      })
    }
      document.getElementById('stylist_portraits').addEventListener('change', (e) => {
        let file = e.target.files[0];
        let blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
    });
  });
}