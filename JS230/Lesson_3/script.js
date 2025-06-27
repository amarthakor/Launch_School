document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', event => {
      event.preventDefault();

      let blockName = link.dataset.block;

      document.querySelectorAll('article').forEach(article => {
        if (article.dataset.block === blockName) {
          article.style.display = 'block';
        } else {
          article.style.display = 'none';
        }
       });
    });
   });
});