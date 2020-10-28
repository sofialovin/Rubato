const showSong =  () =>  {
  const showPageIdentifier = document.querySelector('.show-page-identifier');
  const studentPageIdentifier = document.querySelector('.student-page-identifier');

    if (showPageIdentifier || studentPageIdentifier) {
    // const save  =  document.querySelector('#save-area');

    // Testing Stuff Start

    const save = document.querySelector('#save-area');


      document.querySelectorAll('input.lyrics').forEach(input => {
        if (input.dataset.lyrics === "") {
          input.parentNode.parentNode.removeChild(input.parentNode); // delete 'hide' input as well, sibling of 'lyrics'
        } else {
         input.value = input.dataset.lyrics;
         input.classList.add("hidden_bg");

        }
    });

      save.querySelector("input").remove();

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
         const type = drag.querySelector(".first-fret");
         type.style = "color: var(--dark-type)"
       });


       const trashes = Array.from(document.querySelectorAll(".trash"));
       trashes.forEach( (trash) => {
         trash.parentNode.removeChild(trash);
       });

       const stretchers = Array.from(document.querySelectorAll(".stretcher"));
       stretchers.forEach( (stretcher) => {
         stretcher.parentNode.removeChild(stretcher);
       });




    // });

    // Testing Stuff End


  };
};


export { showSong };
