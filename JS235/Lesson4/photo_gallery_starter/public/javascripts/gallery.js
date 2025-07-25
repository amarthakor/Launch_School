import templates from './templates.js';

let photos;

const slideshow = {
  init() {
    this.slideshow = document.getElementById('slideshow');
    let slides = this.slideshow.querySelectorAll('figure');
    this.firstSlide = slides[0];
    this.lastSlide = slides[slides.length - 1];
    this.currentSlide = this.firstSlide;
    this.bind();
  },

  prevSlide(event) {
    event.preventDefault();
    let prev = this.currentSlide.previousElementSibling || this.lastSlide;
    this.changeSlide(prev);
  },

  nextSlide(event) {
    event.preventDefault();
    let next = this.currentSlide.nextElementSibling || this.firstSlide;
    this.changeSlide(next);
  },

  changeSlide(newSlide) {
    this.fadeOut(this.currentSlide);
    this.fadeIn(newSlide);
    this.renderPhotoContent(newSlide.getAttribute('data-id'));
    this.currentSlide = newSlide;
  },

  fadeOut(slide) {
    slide.classList.add('hide');
    slide.classList.remove('show');
  },

  fadeIn(slide) {
    slide.classList.remove('hide');
    slide.classList.add('show');
  },

  async renderPhotoContent(idx) {
    renderPhotoInformation(Number(idx));
    let comments = await fetchCommentsFor(idx);
    renderComments(comments);
  },

  bind() {
    let prevButton = this.slideshow.querySelector('a.prev');
    let nextButton = this.slideshow.querySelector('a.next');
    prevButton.addEventListener('click', event => this.prevSlide(event));
    nextButton.addEventListener('click', event => this.nextSlide(event));
  }
};

async function fetchPhotos() {
  let response = await fetch('/photos');
  return response.json();
}

async function fetchCommentsFor(idx) {
  let response = await fetch(`/comments?photo_id=${idx}`);
  return response.json();
}

function renderPhotos() {
  let slides = document.getElementById('slides');
  slides.innerHTML = templates.photos(photos);
}

function renderPhotoInformation(idx) {
  let photo = photos.find(item => item.id === idx);
  let header = document.getElementById('information');
  header.innerHTML = templates.photoInformation(photo);
}

function renderComments(comments) {
  let commentList = document.querySelector('#comments ul');
  commentList.innerHTML = templates.comments(comments);
}

async function main() {
  photos = await fetchPhotos();
  let activePhotoId = photos[0].id;
  renderPhotos();
  renderPhotoInformation(activePhotoId);

  let comments = await fetchCommentsFor(activePhotoId);
  renderComments(comments);

  slideshow.init();
}

document.addEventListener('DOMContentLoaded', main);