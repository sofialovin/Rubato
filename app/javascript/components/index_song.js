const indexSong = () => {
  if (document.querySelector('.song-library-identifier')){
    let currentPlaying = null;
    const playBtn = `<i class="fas fa-play"></i>`;
    const stopBtn = `<i class="fas fa-stop"></i>`;

    function toggleAudio() {
      const btn = event.target;
      const aud = btn.parentNode.querySelector('.audio-preview');
      if (aud.paused) {
        aud.play();
        btn.outerHTML = stopBtn;
      } else {
        aud.currentTime = 0;
        aud.pause();
        btn.outerHTML = playBtn;
      }
    }

    document.querySelectorAll('.fa-play').forEach( btn => {
      btn.parentNode.addEventListener('click', toggleAudio);
    });
  }
}

export { indexSong }
