---
---

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

const updateBackToTopLink = (oldClassName, newClassName) => {
  const button = document.getElementById("js-back-to-top")
  if (button) {
    button.classList.remove(oldClassName)
    button.classList.add(newClassName)
  }
}

const onScroll = () => {
  if (window.scrollY > 30) {
    updateBackToTopLink('fade-out', 'fade-in')

    clearTimeout(timeoutId)
    timeoutId = setTimeout(updateBackToTopLink, 5000, 'fade-in', 'fade-out')
  }
  else if (window.scrollY <= 30 && timeoutId) {
    clearTimeout(timeoutId)

    updateBackToTopLink('fade-in', 'fade-out')
  }
}

document.addEventListener('scroll', debounce(onScroll), { passive: true });

onScroll();
