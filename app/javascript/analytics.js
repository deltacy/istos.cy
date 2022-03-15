document.addEventListener("turbo:load", function(event) {
  window.dataLayer = window.dataLayer || []
  function gtag(){dataLayer.push(arguments)}
  gtag('js', new Date())
  gtag('config', 'G-M068ZL629D', {'page_location': event.detail.url})
}, false)
