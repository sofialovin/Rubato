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
       input.value = input.dataset.lyrics;
       input.classList.add("hidden_bg");
     });


       const sel = document.querySelector('.level-select');
       if (sel) {
         sel.parentNode.removeChild(sel);
       }

       // const lbl = document.querySelector('.level-label');
       // lbl.parentNode.removeChild(lbl);


     const btns = document.querySelectorAll(".btn-sm");
     btns.forEach( (btn) => {
       btn.parentNode.removeChild(btn);
     });

    const targs = Array.from(document.querySelectorAll(".target-area"));
       targs.forEach( (targ) => {
         targ.classList.add("hidden_bg");
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
