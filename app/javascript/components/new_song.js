import lc from "./libraryChords.json"

const newSong = () => {
//////////////////////////////////////////////////////
//get chord info from api
//////////////////////////////////////////////////////

  const newPageIdentifier = document.querySelector(".new-page-identifier");
  const ta = document.getElementById("target-area1");

    if (newPageIdentifier && ta) {
      let numClones = 0;
      let numLines = 1;
      let currentDrag = null;
      let offX = 0;
      let offY = 0;
      // document.cookie = 'SameSite=None; Secure';
      let hide = document.getElementsByClassName('hide')[0];

      let lyrics = document.getElementsByClassName('lyrics')[0];


      lyrics.addEventListener("input", resize);

      lyrics.style.letterSpacing = letterSpacingStart + "px";
      lyrics.style.wordSpacing = wordSpacingStart + "px";


      let textStartWidth = 150.0;
      let textDefaultWidth = 150.0;
      let letterSpacingStart = 0.0;
      let wordSpacingStart = 0.0;

      let currentVoicings = null;


      let stringSpace = 10.8;
      let fretSpace = 28;
      let dotDefaultX = -1;
      let dotDefaultY = 6;


      let oSvg = null;
      let xSvg = null;

      let selectedVoicing = null;

      const fetchChordData = (newString, node) => {
        lc.chords.forEach(chord => {
          let firstFret = parseInt(chord.highestFret[0]) - 3;
          if (firstFret < 0) firstFret = 0;
          if (newString === chord.chordName) {

            const dgm =  node.parentNode.querySelector('.chord-diagram');
            oSvg = dgm.dataset.oSvg;
            xSvg = dgm.dataset.xSvg;
            const highestFret = dgm.dataset.highestFret;
            if (highestFret === chord.highestFret) {  // only display selected voicing
              console.log('highestFret  '  + highestFret);
              if (!dgm.parentNode.querySelector('.first-fret')) {
                dgm.insertAdjacentHTML("afterend", `<div class='first-fret'>${firstFret}</div>`);
                // const stringArray = chord.strings.split(" ");
                const fingerArray = chord.fingering.split(" ");
                let fretHtml = placeDots(chord, node, firstFret);

                dgm.insertAdjacentHTML('afterbegin', fretHtml);
                node.parentNode.querySelector(".first-fret").insertAdjacentHTML('beforeend', `<i id="${chord.chordName}-voicings-btn" class="fas fa-cog voicings-btn"></i>`);
                node.parentNode.querySelector(".voicings-btn").addEventListener('click', showVoicings);

                displayBarres(fingerArray, dgm);
              }
            }
          }
        });
      };

      function placeDots(chord, node, firstFret = 0){
        const dgm =  node.parentNode.querySelector('.chord-diagram');
        const stringArray = chord.strings.split(" ");
        const fingerArray = chord.fingering.split(" ");
        let xPos = dotDefaultX + "px";
        let yPos = dotDefaultY + "px";

        const dotSvg = `<div class='dot'></div>`
        let myHtml = ``;
        stringArray.forEach( (fretNumber, index) => {
          switch (fretNumber) {
            case "X":
              xPos =( dotDefaultX + (stringSpace * index)) + 'px';
              yPos = dotDefaultY + 'px';
              myHtml += `<div id=${chord.chordName}X${index.toString()} style='position: absolute; left: ${xPos}; top:${yPos}'>${xSvg}</div></div>`;
              break;
            case "0":
              xPos =( dotDefaultX + (stringSpace * index)) + 'px';
              yPos = dotDefaultY + 'px';
              myHtml += `<div id=${chord.chordName}0${index.toString()} style='position: absolute; left: ${xPos}; top:${yPos}'>${oSvg}</div></div>`;
              break;
            default:
              xPos =( dotDefaultX + (stringSpace * index)) + 'px'; // offset width of dot / 2
              yPos =( dotDefaultY + ( fretSpace * (fretNumber - firstFret))) + 'px';
              const finger = fingerArray[index];
              myHtml += `<div class='barre' id=${chord.chordName}dot${index.toString()} style='position: absolute; left: ${xPos}; top:${yPos}'>${dotSvg}<div class='finger'>${finger}</div></div>`;
              break;
            }
        });
        return myHtml;
      }

      function displayBarres(fingerArray, dgm) {
        let firstFingers = [];
        let secondFingers = [];
        let thirdFingers = [];
        let fourthFingers = [];
        const allFingers  =[firstFingers,secondFingers, thirdFingers, fourthFingers]

        fingerArray.forEach( (num, index) => {
          switch (num) {
            case '1': firstFingers.push(index);
            break;
            case '2': secondFingers.push(index);
            break;
            case '3': thirdFingers.push(index);
            break;
            case '4': fourthFingers.push(index);
            break;
            default: null;
          }
        });


        allFingers.forEach((arr, index )=> {
          if (arr.length > 1) {  // finger frets more than one string
            const fingers  = dgm.querySelectorAll('.finger');
            let barreArray = []
            fingers.forEach( (fin, ind) => {
            if (fin.innerHTML === (index + 1).toString() ) { // finger number matches embedded array
              barreArray.push(fin);
            }
          });

          barreArray.forEach((fin, index) => {
            if (index > 0) {
              fin.parentNode.remove();
            } else {  // first occurrance of barring finger -- increase width to cover all barred strings
              // const firstDotX + barreArray[0].parentNode.querySelector(".dot").getBoundingClientRect().left;
              const firstDotX = barreArray[index].parentNode.querySelector(".dot").getBoundingClientRect().left;
              const lastDotX = barreArray[barreArray.length - 1].parentNode.querySelector(".dot").getBoundingClientRect().left;
              const barreWidth = (lastDotX - firstDotX) + barreArray[index].parentNode.querySelector(".dot").getBoundingClientRect().width;
              fin.parentNode.querySelector(".dot").style.setProperty("width", `${barreWidth}px`);
              fin.parentNode.querySelector(".dot").dataBarre = true;
            }
          });
        };
      });
    };

      function showVoicings () {
        const node = event.target.parentNode.parentNode.querySelector(".chord_name");
        hideVoicings ();
        node.parentNode.classList.add('draggable-selected');
        currentVoicings = node.value;

        let selected = false;
        document.querySelector('#save-area').insertAdjacentHTML('beforeend', `<div class='voicings-container'><div class='voicings-header'>${currentVoicings}</div><br><div class="voicings"></div></div>`)
        const voicingsDiv =  document.querySelector('.voicings');
        const voicingsArray = buildVoicingsArray();
        voicingsArray.forEach((voicing, index) => {

          document.querySelectorAll('.draggable').forEach ( d => {
            const libChord = d.querySelector(".chord_name");
            if (libChord.value === currentVoicings){
              const libDgm = libChord.parentNode.querySelector('.chord-diagram');
              if (voicing.highestFret  === libDgm.dataset.highestFret) {
                selected = true;
              } else {
                selected = false;
              }
            }
          });

          let firstFret = parseInt(voicing.highestFret) - 3;
          if (firstFret < 0) firstFret = 0;

          const voicingHtml =  `<div id="${voicing.chordName}-${index+1}" class='voicing' data-highest-fret="${voicing.highestFret}" ><img src='../assets/fingerboard.svg' class= 'chord-diagram'></div>`
          // const vHtml = "<div class='chord-diagram' id='chord-diagram' data-dot-svg='<%= image_tag('dot.svg', class: 'dot') %>' data-o-svg='<%= image_tag('o.svg', class: 'o') %>' data-x-svg='<%= image_tag('x.svg', class: 'o') %>'><%= image_tag('fingerboard.svg', class: 'diagram') %></div>"

          voicingsDiv.insertAdjacentHTML('beforeend', voicingHtml);

          const voicingDiv =  voicingsDiv.querySelectorAll('.voicing')[index];
          if (selected) {
            voicingDiv.classList.add("voicing-selected");
            selectedVoicing = voicingDiv;
          }
           stringSpace = 20;
           fretSpace = 60;
           dotDefaultX = 0;
           dotDefaultY = -16;
            // if (!voicingDiv.parentNode.querySelector('.first-fret')) {
          // console.log("voicingDiv  " + voicingDiv.id);
          voicingDiv.insertAdjacentHTML("beforeend", `<div class='first-fret-voicing'>${firstFret}</div>`);
            // const stringArray = chord.strings.split(" ");
          const fingerArray = voicing.fingering.split(" ");
          let dotHtml = placeDots(voicing, voicingDiv, firstFret);

          voicingDiv.insertAdjacentHTML('beforeend', dotHtml);

          displayBarres(fingerArray, voicingDiv);
          // }

          resizeDots(voicingDiv);
          voicingDiv.addEventListener('click', selectVoicing);


        });
        voicingsDiv.insertAdjacentHTML('beforeend', `<i class="fas fa-window-close"></i>`);
        voicingsDiv.querySelector(".fa-window-close").addEventListener("click", hideVoicings);


      };

      function selectVoicing() {
        if (selectedVoicing) {
          selectedVoicing.classList.remove('voicing-selected');
        }
        selectVoicingRemote(event.target);

        stringSpace = 10.8;
        fretSpace = 28;
        dotDefaultX = -1;
        dotDefaultY = 6;

        document.querySelectorAll('.draggable').forEach ( d => {
          const libChord = d.querySelector(".chord_name");
          if (libChord.value === currentVoicings){
            const libDgm = libChord.parentNode.querySelector('.chord-diagram');
            libDgm.querySelectorAll('.dot').forEach( dot => {
              dot.remove();
            });
            libDgm.querySelectorAll('.finger').forEach( finger => {
              finger.remove();
            });
            libDgm.querySelectorAll('.o').forEach( o => {
              o.remove();
            });

            const node = selectedVoicing.querySelector('.chord-diagram');
            const highest =  node.parentNode.dataset.highestFret;
            const result = lc.chords.filter(e => e.chordName === `${libChord.value}` && e.highestFret === `${highest}`);
            let firstFret = parseInt(highest) - 3;
            if (firstFret < 0) firstFret = 0;

            const oldFret =  libDgm.parentNode.querySelector(".first-fret");
            const newFret = oldFret.outerHTML.replace(oldFret.textContent , firstFret);


            libDgm.parentNode.querySelector(".first-fret").outerHTML =  `${newFret}`;

            let fretHtml = placeDots(result[0], libDgm, firstFret);
            // console.log('fretHtml  ' + fretHtml);

            libDgm.insertAdjacentHTML('afterbegin', fretHtml);
               const fingerArray = result[0].fingering.split(" ");

                displayBarres(fingerArray, libDgm);
                shrinkBarre(libDgm);
            // lc.chords.search()
            // fetchChordData(libChord.value, libDgm);
            // libDgm.children[0].remove();
          }
        });

      }



      function selectVoicingRemote(voicing) {
        if (selectedVoicing) {
          selectedVoicing.classList.remove('voicing-selected');
        }
        selectedVoicing = voicing;
        voicing.classList.add('voicing-selected');
      }


      function resizeDots(voicingDiv){
        voicingDiv.querySelectorAll('.dot').forEach(dot => {
          dot.classList.add('bigdot');
          if (dot.dataBarre) {

          dot.style.width = parseInt(dot.style.width) + 7 + 'px';
          };
        });
        voicingDiv.querySelectorAll('.finger').forEach(finger => {
          finger.classList.add('bigfinger');
        });
        voicingDiv.querySelectorAll('.o').forEach(o => {
          o.classList.add('bigo');
        })
      };

      function shrinkBarre(libDiv){
        libDiv.querySelectorAll('.dot').forEach(dot => {
          dot.classList.remove('bigdot');
          if (dot.dataBarre) {

            console.log('dot ' + dot);
          dot.style.width = parseInt(dot.style.width) - 14 + 'px';
          };
        });
        // voicingDiv.querySelectorAll('.finger').forEach(finger => {
        //   finger.classList.add('bigfinger');
        // });
        // voicingDiv.querySelectorAll('.o').forEach(o => {
        //   o.classList.add('bigo');
        // })
      };

    function buildVoicingsArray() {
      const voicingsArray = []
      lc.chords.forEach( chord => {
        if (chord.chordName === currentVoicings) {
          voicingsArray.push(chord);
        }
      });
        return voicingsArray;
      };

    function hideVoicings () {
      const draggables = document.querySelectorAll(".draggable");
      draggables.forEach(draggable => {
        draggable.classList.remove("draggable-selected");
      })
      const v =  document.querySelector('.voicings-container');
      const v2 =  document.querySelector('.voicings-header');
      if (v && v2) {
        v.remove();
        v2.remove();
      }
      currentVoicings = null;
    };


    const chords = Array.from(document.querySelectorAll(".draggable"));

    chords.forEach(chord => {
      let chordName = chord.children[0].value;
      const insertPoint = chord.querySelector(".chord-diagram");
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
      //console.log(document.querySelector('#song-title').dataset.title);
      // console.log(document.querySelector('#song-html'));
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
      // const allLyrics = Array.from(document.getElementsByClassName('lyrics'));

      lyrics.removeEventListener("input", resize);
      hide =  document.getElementsByClassName('hide')[num-1];
      lyrics =  document.getElementsByClassName('lyrics')[num-1];


    // console.log("hide  " + hide);
      lyrics.addEventListener("input", resize);
    }

    // lyrics.style.maxWidth = '530px';




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



    ///////////////////////////////////////////////////////////
    //                drag and drop
    //////////////////////////////////////////////////////////



    const dragstart_handler = (ev) => {
      currentDrag = ev.currentTarget;
      console.log("currentDrag " + currentDrag.id);
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
        el.addEventListener("dragstart", dragstart_handler);
        const tr = el.querySelector(".trash");
        tr.addEventListener('click', deleteChord);
        tr.insertAdjacentHTML("beforeend", '<div class="delete-chord"><i class="fas fa-trash"></i></div> ')
      } else {
        console.log ("no clone")
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
