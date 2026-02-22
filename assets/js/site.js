const copyrightYear = document.getElementById("js-copyright-year");
if (copyrightYear) {
  copyrightYear.textContent = new Date().getFullYear();
}

const debounce = (fn) => {
  let frame;
  return (...params) => {
    if (frame) {
      cancelAnimationFrame(frame);
    }
    frame = requestAnimationFrame(() => {
      fn(...params);
    });
  }
};

let timeoutId;
const button = document.querySelector(".top-link")

const updateBackToTopLink = (oldClassName, newClassName) => {
  button.classList.remove(oldClassName)
  button.classList.add(newClassName)
}

const onScroll = () => {
  if (window.scrollY > 30) {
    updateBackToTopLink('fade-out', 'fade-in')
    clearTimeout(timeoutId)
    timeoutId = setTimeout(updateBackToTopLink, 5000, 'fade-in', 'fade-out')
  } else if (window.scrollY <= 30) {
    clearTimeout(timeoutId)
    updateBackToTopLink('fade-in', 'fade-out')
  }
}

if (button) {
  document.addEventListener('scroll', debounce(onScroll), { passive: true });
  onScroll();

  if (document.documentElement.scrollIntoView) {
    button.addEventListener('click', (event) => {
      event.preventDefault()
      document.documentElement.scrollIntoView({ behavior: 'smooth' })
    })
  }

  button.addEventListener('pointerover', () => { clearTimeout(timeoutId) });
  button.addEventListener('pointerout', () => { timeoutId = setTimeout(updateBackToTopLink, 5000, 'fade-in', 'fade-out') });
}
