document.addEventListener('turbo:load', function() {
    const form = document.getElementById('article_form');
    const fileField = form.querySelector('input[type="file"][name="article[image]"]');
    
    if (!fileField) return;
  
    const previewList = document.getElementById('previews_image');
  
    fileField.addEventListener('change', function(e) {
      const alreadyPreview = previewList.querySelector('.preview');
      if (alreadyPreview) {
        alreadyPreview.remove();
      }
  
      const file = e.target.files[0];
      if (file) {
        const blob = window.URL.createObjectURL(file);
  
        const previewWrapper = document.createElement('div');
        previewWrapper.setAttribute('class', 'preview');
  
        const previewImage = document.createElement('img');
        previewImage.setAttribute('class', 'preview-image');
        previewImage.setAttribute('src', blob);
  
        previewWrapper.appendChild(previewImage);
        previewList.appendChild(previewWrapper);
      }
    });
  });
 