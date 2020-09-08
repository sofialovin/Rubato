const lyrics = () => {

  const ta = document.getElementById("target-area1");
  const newPageIdentifier = document.querySelector(".new-page-identifier");
   if (newPageIdentifier) {

    let numClones = 0;
    let numLines = 1;
    let currentDrag = null;
    let offX = 0;
    let offY = 0;
    let hide = document.getElementsByClassName('hide')[0];
    let lyrics = document.getElementsByClassName('lyrics')[0];
    lyrics.addEventListener("input", resize);
    lyrics.style.letterSpacing = letterSpacingStart + "px";
    lyrics.style.wordSpacing = wordSpacingStart + "px";

    let textStartWidth = 150.0;
    let textDefaultWidth = 150.0;
    let letterSpacingStart = 0.0;
    let wordSpacingStart = 0.0;

    const focusLyrics = (ev) => {
      const el = ev.target;
      selectLyric(parseInt(el.id.charAt(el.id.length-1)));
    }

    document.querySelectorAll('.lyrics').forEach( lyric => {
      lyric.addEventListener('focus', focusLyrics);
    })

    const selectLyric = (num) => {
      lyrics.removeEventListener("input", resize);
      hide =  document.getElementsByClassName('hide')[num-1];
      lyrics =  document.getElementsByClassName('lyrics')[num-1];
      lyrics.addEventListener("input", resize);
    }


    function resize() {
      hide.textContent = lyrics.value;
      lyrics.style.width = hide.offsetWidth + "px";
      textDefaultWidth  = parseFloat (lyrics.style.width);
      textStartWidth = parseFloat (lyrics.style.width);
    }

    function removeXListener (ev) {
      document.removeEventListener('mousemove', checkMouseX, true);
    };

    document.addEventListener('mouseup', removeXListener, true);

    const clickStretcher = (ev) => {
    console.log(ev.currentTarget.style.cursor);
    selectLyric(parseInt(ev.target.id.charAt(ev.target.id.length-1)));
      offX = parseInt (ev.clientX);
      textDefaultWidth = parseFloat(lyrics.style.width);
      currentDrag = ev.target;
      letterSpacingStart = parseFloat(lyrics.style.letterSpacing);
      wordSpacingStart = parseFloat(lyrics.style.wordSpacing);

      document.addEventListener('mousemove', checkMouseX, true);
    };

    document.querySelectorAll('.stretcher').forEach( dr => {
      dr.addEventListener('mousedown', clickStretcher);
    })

    function checkMouseX(ev) {
      if (lyrics.value != "") {

        lyrics.style.letterSpacing = letterSpacingStart + ((parseFloat(textDefaultWidth   +  (ev.clientX  -  offX)) - textDefaultWidth)/20 ) + 'px';
        hide.style.letterSpacing = letterSpacingStart + ((parseFloat(textDefaultWidth   +  (ev.clientX  -  offX)) - textDefaultWidth)/20)  + 'px';

        lyrics.style.wordSpacing = wordSpacingStart + ((parseFloat(textDefaultWidth   +  (ev.clientX  -  offX)) - textDefaultWidth)/10)  + 'px';
        hide.style.wordSpacing = wordSpacingStart + ((parseFloat(textDefaultWidth   +  (ev.clientX  -  offX)) - textDefaultWidth)/10)  + 'px';
        resize();  // sets the width of field according to text width
      }
    }

    function unclickStretcher (ev) {
      textDefaultWidth = parseInt(lyrics.style.width);
      document.removeEventListener('mousemove', checkMouseX, true);
      currentDrag = null;
      letterSpacingStart = lyrics.style.letterSpacing;
      wordSpacingStart = lyrics.style.wordSpacing;
    }

    document.querySelectorAll('.stretcher').forEach( dr => {
      dr.addEventListener('mouseup', unclickStretcher);
    })
  };
};

export { lyrics };
