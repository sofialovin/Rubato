const showSong =  () =>  {
  const save  =  document.querySelector('#save-area');
  console.log("Save Area" + save);
  const title = save.querySelector('#song-title').dataset.title;
  save.querySelector('#song-title').value = title;
  save.querySelector('#song-title').style = "font-size:32px;";
  save.querySelector('#song-title').classList.add("hidden_bg");
  document.querySelectorAll('input.hide').forEach(input => {
      input.value = input.dataset.lyrics;
      console.log("Input" + input.style.width);
  });

  document.querySelectorAll('input.lyrics').forEach(input => {
    input.value = input.dataset.lyrics;
    input.classList.add("hidden_bg");
  });

  const btns = Array.from(document.querySelectorAll(".btn-camel"));
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
};


export { showSong };

