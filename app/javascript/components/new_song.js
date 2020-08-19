const newSong = () => {
//////////////////////////////////////////////////////
//get chord info from api
//////////////////////////////////////////////////////

  const newPageIdentifier = document.querySelector(".new-page-identifier");
  const ta = document.getElementById("target-area1");
    if (newPageIdentifier) {
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

      // console.log('lyrics.style.width ' + `${textStartWidth}px;`);

      // console.log('lyrics.style.width ' + `${textStartWidth}px;`);

      hide.style.setProperty('width', `${textStartWidth}px`);
      lyrics.style.setProperty('width', `${textStartWidth}px`);

      let stringSpace = 10.5;
      let fretSpace = 27;
      let dotDefaultX = 2;
      let dotDefaultY = 0;

      const fetchChordData = async (newString, node) => {
        const url = "https://api.uberchord.com/v1/chords/" + newString;
        const response = await fetch(url);
        const json = await response.json();
        if (json[0]) {
          const cName = (json[0].chordName.replace(/,/g , ""));
          Array.from(document.getElementsByClassName("chord_name")).forEach( chordname => {
          // console.log(node.parentNode.querySelector(".chord_name").value.replace("_", ""));
          // console.log(cName);
            if (node.parentNode.querySelector(".chord_name").value.replace("_", "") === cName) {
              const chord = chordname.parentNode.parentNode
              const dgm =  node.parentNode.querySelector('.chord-diagram');
              const stringArray = json[0].strings.split(" ");
              let xPos = dotDefaultX + "px";
              let yPos = dotDefaultY + "px";
              let fretHtml = ``;

              const chordDiagram = document.getElementById('chord-diagram')
              const dotSvg = chordDiagram.dataset.dotSvg
              const oSvg = chordDiagram.dataset.oSvg
              const xSvg = chordDiagram.dataset.xSvg
              stringArray.forEach( (fretNumber, index) => {
                switch (fretNumber) {
                  case "X":
                    xPos =( dotDefaultX + (stringSpace * index)) + 'px';
                    yPos = dotDefaultY + 'px';
                    fretHtml += `<div id=${cName}X${index.toString()} style='position: absolute; left: ${xPos}; top:${yPos}'>${xSvg}</div></div>`;
                    break;
                  case "0":
                    xPos =( dotDefaultX + (stringSpace * index)) + 'px';
                    yPos = dotDefaultY + 'px';
                    fretHtml += `<div id=${cName}0${index.toString()} style='position: absolute; left: ${xPos}; top:${yPos}'>${oSvg}</div></div>`;
                    break;
                  default:
                    xPos =( dotDefaultX + (stringSpace * index)) + 'px'; // offset width of dot / 2
                    yPos =( dotDefaultY + ( fretSpace * fretNumber)) + 'px';
                    fretHtml += `<div id=${cName}dot${index.toString()} style='position: absolute; left: ${xPos}; top:${yPos}'>${dotSvg}</div>`;
                    break;
                }
              });


              const strings = `${dotSvg}</div>`

              dgm.insertAdjacentHTML('afterbegin', fretHtml);
            };
          });
        }

        // API response is formatted like: "C,7,," - remove commas


      };


    const chords = Array.from(document.querySelectorAll(".chordname"));

    chords.forEach(chord => {
      // const modifier = chord.parentNode.children[1].innerHTML;
      let chordName = chord.parentNode.parentNode.parentNode.children[0].value;

      const insertPoint = chord.parentNode.parentNode.parentNode.querySelector(".chord-diagram");
      // insertPoint.insertAdjacentHTML("beforeend", chordName);
      // console.log("insertPoint " + insertPoint);
      fetchChordData (chordName, insertPoint);
    });


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





    ////////////////////////////////////////////
    //    save song
    ////////////////////////////////////////////

    const saveSong  = () => {
      const save  =  document.querySelector('#save-area');
      console.log(event);
      // document.querySelector('form').method = 'post';
      populateFields(save);
    }

    const saveSongBtn = document.querySelector('#save-song-btn');
    saveSongBtn && saveSongBtn.addEventListener('click', saveSong);



    const populateFields = (save) => {
      const title =  save.querySelector('#song-title').value;
      document.querySelectorAll('input.hide').forEach(input => {
        input.dataset.lyrics = input.value;
    })

      document.querySelectorAll('input.lyrics').forEach(input => {
        input.dataset.lyrics = input.value;
    })
      document.querySelector('#song-title').dataset.title = title;
      document.querySelector('#song-name').value = title; // hidden field in the form
      document.querySelector('#song-html').value = save.outerHTML; // hidden field
      // document.querySelector('#song-lyrics').value = lyricArray;
      console.log(document.querySelector('#song-title').dataset.title);
      console.log(document.querySelector('#song-html'));
    }





    //////////////////////////////////////////////////////////////
    //             expandable text field
    //////////////////////////////////////////////////////////////
    const focusLyrics = (ev) => {
      const el = ev.target;
      selectLyric(parseInt(el.id.charAt(el.id.length-1)));
    }


    document.querySelectorAll('.lyrics').forEach( lyric => {
      lyric.addEventListener('focus', focusLyrics);
    })



    const selectLyric = (num) => {
      const allLyrics = Array.from(document.getElementsByClassName('lyrics'));
      hide =  document.getElementsByClassName('hide')[num-1];
      lyrics =  document.getElementsByClassName('lyrics')[num-1];
    }


    // console.log("hide  " + hide);
    // lyrics.style.maxWidth = '530px';

    resize();
    lyrics.addEventListener("input", resize);

    lyrics.style.letterSpacing = letterSpacingStart + "px";
    lyrics.style.wordSpacing = wordSpacingStart + "px";



    function resize() {
      console.log("Setting width");
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
    // console.log(ev.target.id.charAt(ev.target.id.length-1));
    selectLyric(parseInt(ev.target.id.charAt(ev.target.id.length-1)));
      offX = parseInt (ev.clientX);
      textDefaultWidth = parseFloat(lyrics.style.width);
      currentDrag = ev.target;
      letterSpacingStart = parseFloat(lyrics.style.letterSpacing);
      wordSpacingStart = parseFloat(lyrics.style.wordSpacing);
        // console.log ("letterSpacingStart " + letterSpacingStart);
        // console.log ("lyrics.style.letterSpacing " + lyrics.style.letterSpacing);

      document.addEventListener('mousemove', checkMouseX, true);
    };



    document.querySelectorAll('.stretcher').forEach( dr => {
      dr.addEventListener('mousedown', clickStretcher);
    })





    function checkMouseX(ev) {
      // console.log('checkMouseX    lyrics.style.letterSpacing ' + lyrics.style.letterSpacing)
      if (lyrics.value != "") {

        lyrics.style.width =  (textDefaultWidth   +  (ev.clientX  -  offX)) + "px";
        hide.style.width =  (textDefaultWidth   +  (ev.clientX  -  offX)) + "px";

        lyrics.style.letterSpacing = letterSpacingStart + ((parseFloat(lyrics.style.width) - textDefaultWidth)/80 ) + 'px';
        hide.style.letterSpacing = letterSpacingStart + ((parseFloat(lyrics.style.width) - textDefaultWidth)/80)  + 'px';

        lyrics.style.wordSpacing = wordSpacingStart + ((parseFloat(lyrics.style.width) - textDefaultWidth)/25)  + 'px';
        hide.style.wordSpacing = wordSpacingStart + ((parseFloat(lyrics.style.width) - textDefaultWidth)/25)  + 'px';

        // resize();
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



    ///////////////////////////////////////////////////////////
    //                drag and drop
    //////////////////////////////////////////////////////////



    const dragstart_handler = (ev) => {
      console.log("draggable ");
      currentDrag = ev.target;
      ev.dataTransfer.setData("application/my-app", currentDrag.id);
      currentDrag.addEventListener("onMouseUp", dropChord(event), false);

      if (currentDrag.parentNode.id != "library" ) {
        currentDrag.addEventListener('dragstart', handleDragStart, false);
        currentDrag.addEventListener('dragend', handleDragEnd, false);
      }
      function handleDragStart(e) {

        this.style.opacity = '0.3';
        this.style.transition = "opacity .5s";
      }


      function handleDragEnd(e) {
        this.style.opacity = '1';
        this.style.transition = "none";
        this.removeEventListener('dragend', handleDragEnd, false);
      }

      function dropChord(event) {
          offX = event.offsetX;
          offY = event.offsetY;
      }
    }

    document.querySelectorAll('.draggable').forEach( dr => {
      dr.addEventListener('dragstart', dragstart_handler);
    })

    const dragover_handler = (ev) => {
      ev.preventDefault();
      const clones =  Array.from(ev.target.children);
      const sortedClones = clones.sort((a, b) => parseInt(a.style.left) - parseInt(b.style.left));
      let leftClones = [];
      let rightClones = [];
      sortedClones.forEach(function(element) {
          if (element != currentDrag) {
          if (parseInt(element.style.left) < parseInt(ev.clientX - ta.getBoundingClientRect().x)) {
            leftClones.unshift(element); // from center to left
          } else {
            rightClones.push(element); // from center to right
          }
        }
      });

      let overlap = 0;
      if (leftClones.length > 0) {
        if (dragIntersection(ev, leftClones[0]) == true ) {
          overlap = dragLeftOverlap(ev, leftClones[0]);
          ripple(leftClones, overlap, 'left');
        }
      }

      if (rightClones.length > 0) {
        if (dragIntersection(ev, rightClones[0]) == true ) {
          overlap = dragRightOverlap(ev, rightClones[0]);
          rippleRight(rightClones, overlap);
          // ripple(rightClones, overlap, 'right');
        }
      }
    };


    document.querySelectorAll('.target-area').forEach( dr => {
      dr.addEventListener('dragover', dragover_handler);
    })

    function ripple(array, overlap, direction) {
      let ovr = overlap;
      let colliding = true;
      let oldX = parseInt(array[0].style.left);
      let newX = direction == 'left' ? (oldX - (ovr + 4)) : oldX + (ovr + 4) ;
      array[0].style.left = newX + 'px';
      checkBoundaries(array[0]);

      for (let i = 0; i < array.length - 1; i++) {
        const chord1 = direction === 'left' ? array[i] : array[i + 1];
        const chord2 = direction ==='left' ? array[i + 1] : array[i];
        if (arrayIntersection(chord1, chord2)) {
        ovr = arrayOverlap(chord1, chord2);
        oldX = parseInt(chord2.style.left);
        newX = direction == 'left' ? (oldX - ovr) -4 : oldX + (ovr + 4) ;
        chord2.style.left = newX + 'px';
        checkBoundaries(chord2);
        }
      }
    };




    function rippleRight(array, overlap) {
      let ovr = overlap;
      let colliding = true;
      let oldX = parseInt(array[0].style.left);
      let newX = oldX + (ovr + 4) ;
      array[0].style.left = newX + 'px';
      checkBoundaries(array[0]);

      for (let i = 0; i < array.length - 1; i++) {
        const chord1 = array[i];
        const chord2 = array[i + 1];
        if (arrayIntersection(chord2, chord1)) {
        ovr = arrayOverlap(chord2, chord1);
        oldX = parseInt(chord2.style.left);
        newX = oldX + (ovr + 4);
        chord2.style.left = newX + 'px';
        checkBoundaries(chord2);
        }
      }
    };

    function checkBoundaries (el) {
      if (el.getBoundingClientRect().x <= ta.getBoundingClientRect().x) {
        deleteLeft(el);
      }

      if (el.getBoundingClientRect().x + el.getBoundingClientRect().width >= ta.getBoundingClientRect().x + ta.getBoundingClientRect().width) {
        deleteLeft(el);
      }
    };


    function dragIntersection(ev, element) {
      return !(
       ( element.getBoundingClientRect().x > (ev.clientX - offX) + currentDrag.getBoundingClientRect().width ||
            element.getBoundingClientRect().x + element.getBoundingClientRect().width < (ev.clientX - offX))

       // &&

       // ( element.getBoundingClientRect().y > (ev.clientY - offY) + currentDrag.getBoundingClientRect().height ||
       //     element.getBoundingClientRect().y + element.getBoundingClientRect().height < (ev.clientY - offY))
      );
    }

    function dragLeftOverlap(ev, element) {
        return ((element.getBoundingClientRect().x + element.getBoundingClientRect().width) - (ev.clientX - offX));
    }

    function dragRightOverlap(ev, element) {
        return ((ev.clientX - offX) + currentDrag.getBoundingClientRect().width) - (element.getBoundingClientRect().x );
    }

    function arrayIntersection(element1, element2) {
      return !(element2.getBoundingClientRect().x + element2.getBoundingClientRect().width < element1.getBoundingClientRect().x);
    }

    function arrayOverlap(element1, element2) {
      return (((element2.getBoundingClientRect().x + element2.getBoundingClientRect().width) - element1.getBoundingClientRect().x) + 4);
    }

    const deleteChord = (ev) => {
      const chord = (ev.target.parentNode.parentNode.parentNode.parentNode);
      console.log('el');
      chord.parentNode.removeChild(chord);
    }

    const deleteLeft = (el) => {
      el.remove();
      // const left =  el.style.left;
      // el.addEventListener('transitionend', () => el.remove());
      // // el.style = 'transform: scale(0, .5); opacity:0; transition: all .5s;';
      // el.style = 'opacity:0; left:${left}; transition: all .5s;';
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
        el  = document.getElementById(data).cloneNode([true]);
        el.id = "clone" + numClones;
        numClones ++ ;
        el.class = 'clone';
        const tr = el.querySelector(".trash");
        tr.addEventListener('click', deleteChord);
        tr.insertAdjacentHTML("beforeend", '<div class="delete-chord"><i class="fas fa-trash"></i></div> ')
        }  else {
          el  = document.getElementById(data);
        }
      if (el.id != currentDrag.id) {
        ev.target.appendChild(el);
      }
      el.style.position = 'absolute';
      el.style.left = ( (ev.screenX - window.screenX) - document.getElementById('target-area1').parentNode.offsetLeft) - document.getElementById('target-area1').offsetLeft - offX + "px";
    }


    document.querySelectorAll('.target-area').forEach( dr => {
      dr.addEventListener('drop', drop_handler);
    });
  };
};

export { newSong };
