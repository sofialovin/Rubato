const indexSong = () => {
  if (document.querySelector('.song-library-identifier')){
    let currentBtn = null;
    let currentAudio = null;
    const playBtn = `<i class="fas fa-play"></i>`;
    const stopBtn = `<i class="fas fa-stop"></i>`;

    function toggleAudio() {
      const btn = event.target;
      const aud = btn.parentNode.querySelector('.audio-preview');
      if (aud.paused) {
        aud.play();
        btn.outerHTML = stopBtn;
        if (currentAudio) {
          currentBtn.outerHTML = playBtn;
          currentAudio.currentTime = 0;
          currentAudio.pause();
        }
        currentAudio = aud;
        currentBtn = btn;
      } else {
        aud.currentTime = 0;
        aud.pause();
        btn.outerHTML = playBtn;
        currentAudio = null;
        currentBtn = null;
      }
    }

    document.querySelectorAll('.fa-play').forEach( btn => {
      btn.parentNode.addEventListener('click', toggleAudio);
    });
  }
}

export { indexSong }
