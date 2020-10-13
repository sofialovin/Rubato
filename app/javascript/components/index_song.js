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
        aud.addEventListener('ended' , endAudio);
        btn.outerHTML = stopBtn;
        if (currentAudio) {
          console.log ('currentBtn ' + currentBtn.outerHTML);
          // currentBtn.outerHTML = playBtn;
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

    function endAudio() {
      const aud = event.target;
      const btn = aud.parentNode.children[0];
      console.log ('ended' + aud + btn);

        aud.currentTime = 0;
        btn.outerHTML = playBtn;
        currentAudio = null;
        currentBtn = null;

    }
  }
}

export { indexSong }
