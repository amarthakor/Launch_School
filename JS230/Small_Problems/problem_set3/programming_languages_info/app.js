const languages = [
  {
    name: 'Ruby',
    description: 'Ruby is a dynamic, reflective, object-oriented, ' +
                 'general-purpose programming language. It was designed and developed in the mid-1990s ' +
                 'by Yukihiro Matsumoto in Japan. According to its creator, Ruby was influenced by Perl, ' +
                 'Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, ' +
                 'including functional, object-oriented, and imperative. It also has a dynamic type ' +
                 'system and automatic memory management.'
  },

  {
    name: 'JavaScript',
    description: 'JavaScript is a high-level, dynamic, untyped, and interpreted ' +
                 'programming language. It has been standardized in the ECMAScript language ' +
                 'specification. Alongside HTML and CSS, JavaScript is one of the three core ' +
                 'technologies of World Wide Web content production; the majority of websites employ ' +
                 'it, and all modern Web browsers support it without the need for plug-ins. JavaScript ' +
                 'is prototype-based with first-class functions, making it a multi-paradigm language, ' +
                 'supporting object-oriented, imperative, and functional programming styles.'
  },

  {
    name: 'Lisp',
    description: 'Lisp (historically, LISP) is a family of computer programming languages ' +
                 'with a long history and a distinctive, fully parenthesized prefix notation. ' +
                 'Originally specified in 1958, Lisp is the second-oldest high-level programming ' +
                 'language in widespread use today. Only Fortran is older, by one year. Lisp has changed ' +
                 'since its early days, and many dialects have existed over its history. Today, the best ' +
                 'known general-purpose Lisp dialects are Common Lisp and Scheme.'
  },
];

/*
--- Problem
- Create a webpage that displays a few programming languages and a short description of each language
- Should only show the first 120 chars of each description
- Should have a `Show More` button to expand the description
- When viewing full description, should only show for a targetted language
  - Also should have a button that says 'Show Less'
- 'Show More' button expands to full text for current language
- 'Show Less' butotn minimizes full text to 120char description of current language
  - switch 'show more' to 'show less' and vice versa

--- 
  - Need to get each language from a collection (array, object etc.)
    -> conver this into an html format that can be inserted into the webpage

  - Need to insert the html formatted language into the webpage
    - Find section element with class 'languages'
    - Insert into its children nodes
      - appendchild(node)
      - fn createParagraph
        - needs to create a <p> element
        - probably also add some unique identifier
          - such as index of language?
        - insert description within <p>...</p>
        - also add <button>Show More</button>

  ---
  Show more / show less functionality
  - add class to each language div to identify which language we are working with 'language1' etc.
  - add class to button, initially 'hidden'
  - add addEventListener to the `section` element for event delegation
  - when something is clicked that IS NOT a button, 
    - return early
  - otherwise we want to get the parent element of the current event
    - this will be the div element
  - from here we can change the p element containing description to something like ${}
*/

function createLanguageHTML(language) {
  let html = `<p class='lang-title'><strong>${language.name}</strong></p>` +
  `<p class='description'>${language.description.slice(0, 120)}...</p>` +
  `<button class='hidden'>Show More</button>`;

  return html;
}

document.addEventListener('DOMContentLoaded', () => {
  let allLangs = document.querySelector('.languages');
  let section = document.querySelector('section');

  languages.forEach((language, idx) => {
    let childDiv = document.createElement('div');
    childDiv.setAttribute('data-lang-index', idx);
    childDiv.innerHTML = createLanguageHTML(language);
    allLangs.appendChild(childDiv);
  });

  section.addEventListener('click', event => {
    if (event.target.tagName !== 'BUTTON') return;
    let parentDiv = event.target.parentNode;
    let langIdx = parentDiv.dataset.langIndex;
    let description = languages[langIdx].description;
    let paragraph = parentDiv.querySelector('.description');

    if (event.target.classList.contains('hidden')) {
      paragraph.textContent = description;
      event.target.textContent = 'Show Less';
      event.target.setAttribute('class', 'visible');
    } else {
      paragraph.textContent = description.slice(0, 120) + '...';
      event.target.textContent = 'Show More';
      event.target.setAttribute('class', 'hidden');
    }
  });
});