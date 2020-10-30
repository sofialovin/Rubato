// import "./new_song";
// import "./dnd";

const editSong  = () => {
  const editPageIdentifier = document.querySelector(".edit-page-identifier");
  const ta = document.getElementById("target-area1");
  if (editPageIdentifier && ta) {
    let numClones = 0;
    let numLines = 1;
    let currentDrag = null;
    let offX = 0;
    let offY = 0;

    let hide = document.getElementsByClassName('hide')[0];
    let lyrics = document.getElementsByClassName('lyrics')[0];

    let textStartWidth = 150.0;
    let textDefaultWidth = 150.0;
    let letterSpacingStart = 0.0;
    let wordSpacingStart = 0.0;


    let stringSpace = 10.5;
    let fretSpace = 27;
    let dotDefaultX = 2;
    let dotDefaultY = 0;

    document.querySelectorAll('.draggable').forEach( dr => {
      dr.addEventListener('dragstart', dragstart_handler);
    })

    document.querySelectorAll('.target-area').forEach( dr => {
      dr.addEventListener('dragover', dragover_handler);
      dr.addEventListener('drop', drop_handler);
    });

        document.querySelectorAll('input.hide').forEach(input => {
        input.value = input.dataset.lyrics;
    });
        document.querySelectorAll('input.lyrics').forEach(input => {
        input.value = input.dataset.lyrics;
    });

        document.querySelector("#save-area").querySelectorAll('.trash').forEach(tr => {
          // console.log(tr.parentNode.parentNode.parentNode);
        tr.addEventListener('click', deleteChord);
    });


        // console.log(document.querySelector('#save-area'));

      function saveAs(){
        console.log('save as');
      }



    ////////////////////////////////////////////
    //    save song
    ////////////////////////////////////////////

    const saveChanges  = () => {
      // event.preventDefault();
      const save  =  document.querySelector('#save-area');
      // populateFields(save);
      console.log('edit ' + save);





      document.querySelectorAll('input.hide').forEach(input => {
        if (input.value != "Enter Lyrics") {
          input.dataset.lyrics = input.value;

        }
    })

      document.querySelectorAll('input.lyrics').forEach(input => {
        if (input.value != "Enter Lyrics") {
          input.dataset.lyrics = input.value;

        }
    })









      document.querySelector('form').method = 'patch';
      document.querySelector('#song-html').value = save.innerHTML;
      document.querySelector('form').submit();

    }

    const saveSongBtn = document.querySelector('#edit-song-btn');
    saveSongBtn.addEventListener('click', saveChanges);



    const populateFields = (save) => {
      const title =  document.querySelector('#song-name');
      document.querySelectorAll('input.hide').forEach(input => {
        if (input.value != "Enter Lyrics") {
          input.dataset.lyrics = input.value;

        }
    })

      document.querySelectorAll('input.lyrics').forEach(input => {
        if (input.value != "Enter Lyrics") {
          input.dataset.lyrics = input.value;

        }
    })
      console.log('save ' + save);
      document.querySelector('#song-title').value = title;
      document.querySelector('#song-name').value = title; // hidden field in the form
      document.querySelector('#song-html').value = save.innerHTML; // hidden field
    }


  //////////////////////////////////////////////////////////////
    //             expandable text field
    //////////////////////////////////////////////////////////////
    const focusLyrics = (ev) => {
      const el = ev.target;
      selectLyric(parseInt(el.id.charAt(el.id.length-1)));
    };

    document.querySelectorAll('.lyrics').forEach( lyric => {
      console.log('add lyrics listener')
      lyric.addEventListener('focus', focusLyrics);
    });

    const selectLyric = (num) => {
      lyrics.removeEventListener("input", resize);
      hide =  document.getElementsByClassName('hide')[num-1];
      lyrics =  document.getElementsByClassName('lyrics')[num-1];
      lyrics.addEventListener("input", resize);
    }

    function resize() {
      hide.textContent = lyrics.value;
      lyrics.style.width = hide.offsetWidth + "px";
      // console.log('hide.textContent ' + hide.textContent);
      // console.log('hide.offsetWidth ' + hide.offsetWidth);
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
      // console.log('checkMouseX    lyrics.style.letterSpacing ' + lyrics.style.letterSpacing)
      if (lyrics.value != "") {

        // the old way
        // lyrics.style.width =  (textDefaultWidth   +  (ev.clientX  -  offX)) + "px";
        // hide.style.width =  (textDefaultWidth   +  (ev.clientX  -  offX)) + "px";

        lyrics.style.letterSpacing = letterSpacingStart + ((parseFloat(textDefaultWidth   +  (ev.clientX  -  offX)) - textDefaultWidth)/20 ) + 'px';
        hide.style.letterSpacing = letterSpacingStart + ((parseFloat(textDefaultWidth   +  (ev.clientX  -  offX)) - textDefaultWidth)/20)  + 'px';

        lyrics.style.wordSpacing = wordSpacingStart + ((parseFloat(textDefaultWidth   +  (ev.clientX  -  offX)) - textDefaultWidth)/10)  + 'px';
        hide.style.wordSpacing = wordSpacingStart + ((parseFloat(textDefaultWidth   +  (ev.clientX  -  offX)) - textDefaultWidth)/10)  + 'px';

        // the new way
        resize();  // sets the width of field according to text width
      }
    }


    function unclickStretcher (ev) {
      textDefaultWidth = parseInt(lyrics.style.width);
      document.removeEventListener('mousemove', checkMouseX, true);
      currentDrag = null;
      letterSpacingStart = lyrics.style.letterSpacing;
      wordSpacingStart = lyrics.style.wordSpacing;
        // console.log ("unclick " + letterSpacingStart);
    }




    document.querySelectorAll('.stretcher').forEach( dr => {
      dr.addEventListener('mouseup', unclickStretcher);
    })

    const addLine = () => {
      numLines ++;
      let templateClone = document.getElementById("template").content.firstElementChild.cloneNode(true);

      templateClone.querySelector(".target-area").id = "target-area" + numLines;
      templateClone.querySelector(".hide").id='hide' + numLines;
      templateClone.querySelector(".lyrics").id='lyrics' + numLines;
      templateClone.querySelector(".stretcher").id='stretcher' + numLines;

      templateClone.querySelector(".target-area").addEventListener('dragover', dragover_handler);
      templateClone.querySelector(".target-area").addEventListener('drop', drop_handler);
      templateClone.querySelector(".lyrics").addEventListener('input', resize);
      templateClone.querySelector(".lyrics").addEventListener('focus', focusLyrics);
      templateClone.querySelector(".stretcher").addEventListener('mousedown', clickStretcher);

      document.querySelector('#save-area').insertAdjacentElement('beforeend', templateClone);
    }


    const addLineButton = document.querySelector('#add-line-btn');
    if (addLineButton) {
      addLineButton.addEventListener('click', addLine);
    }


      //////////////////////////////////////////////////////////////
     ///////          d r a g    a n d    d r o p      ////////////
    //////////////////////////////////////////////////////////////


    const dragstart_handler = (ev) => {
      currentDrag = ev.currentTarget;
      dropChord(ev);
      ev.dataTransfer.setData("application/my-app", currentDrag.id);
      currentDrag.addEventListener("onMouseUp", dropChord(event), false);

      if (currentDrag.parentNode.id != "library" ) {
        currentDrag.addEventListener('dragstart', handleDragStart, false);
        currentDrag.addEventListener('dragend', handleDragEnd, false);
      }

    }

function handleDragStart() {

        currentDrag.style.opacity = '0.3';
        currentDrag.style.transition = "opacity .5s";
      }


      function handleDragEnd() {
        currentDrag.style.opacity = '1';
        currentDrag.style.transition = "none";
        currentDrag.removeEventListener('dragend', handleDragEnd, false);
      }

      function dropChord(ev) {
      console.log("currentDrag " + currentDrag.id);
          offX = ev.offsetX;
          offY = ev.offsetY;
      }

    document.querySelectorAll('.draggable').forEach( dr => {
      dr.addEventListener('dragstart', dragstart_handler);
    })

       const dragover_handler = (ev) => {
      ev.preventDefault();
      // const clones =  Array.from(ev.target.children);

    };


    document.querySelectorAll('.target-area').forEach( dr => {
      dr.addEventListener('dragover', dragover_handler);
    })

    function deleteChord (ev) {
      ev.target.parentNode.parentNode.parentNode.parentNode.remove();
    }

    function checkBoundaries (el) {
      if (el.getBoundingClientRect().x <= ta.getBoundingClientRect().x) {
        deleteChord(el);
      }

      if (el.getBoundingClientRect().x + el.getBoundingClientRect().width >= ta.getBoundingClientRect().x + ta.getBoundingClientRect().width) {
        deleteChord(el);
      }
    };


    function dragIntersection(element1, element2) {
      return (
       ( element1.style.left + element1.getBoundingClientRect().width > element2.style.left &&
          element1.style.left < element2.style.x + element2.style.width  )
        );
    }



    ///////////////////////////////////////////////////////////////////////////
    //              D R O P
    ///////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////


    function drop_handler(ev) {
      ev.preventDefault();

      const data = ev.dataTransfer.getData("application/my-app");
      let el;
      const clone = document.getElementById(data).parentNode.id == "library" ? true : false;
      if (clone) {
        numClones ++ ;
        el  = document.getElementById(data).cloneNode([true]);
        el.id = "clone" + numClones;
        const form = el.querySelector("form");
        form.id += `c-${numClones}`;
        form.querySelector(".update-chord").id += `c-${numClones}`;
        form.querySelector(".chord_name").id += `c-${numClones}`;
        el.class = 'clone';
        el.addEventListener("dragstart", dragstart_handler);
        // console.log(document.querySelector('#target-area1').querySelectorAll('.clone').length)
        const tr = el.querySelector(".trash");
        tr.innerHTML = '';
        tr.addEventListener('click', deleteChord);
        tr.insertAdjacentHTML("beforeend", '<div class="delete-chord"><i class="fas fa-trash"></i></div> ')
      } else {
        el  = document.getElementById(data);
      }

      if (el.id != currentDrag.id) {
        ev.target.appendChild(el);
      }
      el.style.position = 'absolute';
      el.style.left = ( (ev.screenX - window.screenX) - ta.getBoundingClientRect().left) - offX + "px";


       // delete underlying objects
      const chordsInLine = document.querySelectorAll('[id^="clone"]');
      // console.log('chordsInLine.length  ' + chordsInLine.length);
      if (chordsInLine.length > 0) {
        chordsInLine.forEach( chord => {
          if (chord.parentNode.id === el.parentNode.id){
            if (chord.id != el.id) {
                console.log('el' + el.id);
                console.log('chord' + chord.id);
              const overLeft1 = (parseInt(chord.style.left) + chord.getBoundingClientRect().width) > parseInt(el.style.left);
              const overRight1 = (parseInt(chord.style.left) < (parseInt(el.style.left) + el.getBoundingClientRect().width));
              const overLeft2 = (parseInt(el.style.left) < (parseInt(chord.style.left) + chord.getBoundingClientRect().width));
              const overRight2 = (parseInt(el.style.left) + el.getBoundingClientRect().width) > parseInt(chord.style.left);
              if ((overLeft1 && overRight1)) {
                chord.remove();
                // chord.parentNode.remove(chord);
              };
            };
          };
        });
      };



    }

    document.querySelectorAll('.target-area').forEach( dr => {
      dr.addEventListener('drop', drop_handler);
    });
    };
};


export { editSong };

