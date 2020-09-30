const showSong =  () =>  {
  const showPageIdentifier = document.querySelector('.show-page-identifier');
  const studentPageIdentifier = document.querySelector('.student-page-identifier');

    if (showPageIdentifier || studentPageIdentifier) {
    // const save  =  document.querySelector('#save-area');

    // Testing Stuff Start

    const saves = document.querySelectorAll('#save-area');
    saves.forEach((save) => {
       const title = save.querySelector('#song-title').dataset.title;
       save.querySelector('#song-title').value = title;
       save.querySelector('#song-title').style = "font-size:32px;";
       save.querySelector('#song-title').classList.add("hidden_bg");
       document.querySelectorAll('input.hide').forEach(input => {
           input.value = input.dataset.lyrics;
       });

      document.querySelectorAll('input.lyrics').forEach(input => {
      console.log('lyrics.value  ' + input.dataset.lyrics);
        if (input.dataset.lyrics === "") {
          input.parentNode.parentNode.removeChild(input.parentNode); // delete 'hide' input as well, sibling of 'lyrics'
        }
    });

       document.querySelectorAll('input.lyrics').forEach(input => {
         input.value = input.dataset.lyrics;
         input.classList.add("hidden_bg");
       });


       const sel = document.querySelector('.level-select');
       if (sel) {
         sel.parentNode.removeChild(sel);
       }


       const btns = document.querySelectorAll(".btn-sm");
       btns.forEach( (btn) => {
         btn.parentNode.removeChild(btn);
       });

      const targs = Array.from(document.querySelectorAll(".target-area"));
       targs.forEach( (targ) => {
        if (targ.querySelectorAll('.draggable').length > 0) {
         targ.classList.add("hidden_bg");
        } else {
          targ.parentNode.removeChild(targ);  // delete empty lines
        };
       });


       const drags = Array.from(document.querySelectorAll(".draggable"));
       drags.forEach( (drag) => {
         drag.classList.add("hidden_bg");
       });


       const trashes = Array.from(document.querySelectorAll(".trash"));
       trashes.forEach( (trash) => {
         trash.parentNode.removeChild(trash);
       });

       const stretchers = Array.from(document.querySelectorAll(".stretcher"));
       stretchers.forEach( (stretcher) => {
         stretcher.parentNode.removeChild(stretcher);
       });




    });

    // Testing Stuff End


  };
};


export { showSong };
