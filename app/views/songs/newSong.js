
//////////////////////////////////////////////////////
//get chord info from api and clone empty song line
//////////////////////////////////////////////////////
console.log('firstLine');
let chordClone = null;
let lyricClone = null;

window.onload = (event) => {
  const chords = Array.from(document.querySelectorAll(".chordname"));

  chords.forEach(chord => {
    const chordName = chord.textContent;
    const insertPoint = chord.parentNode.parentNode.children[1];
    // insertPoint.insertAdjacentHTML("beforeend", chordName);
    fetchChordData (chordName, insertPoint);
  });

  chordClone = document.querySelector('.chord-line').cloneNode([true]);
  lyricClone = document.querySelector('.lyric-area').cloneNode([true]);
};





addLine = () => {
  numLines ++;
  chordClone.id =`target-area${numLines}`;
 const chordHolder = chordClone.outerHTML;
 console.log(chordHolder);
  document.querySelector('#save-area').insertAdjacentHTML('beforeend', chordHolder);

  lyricClone.id=`lyrics${numLines}`;
  // console.log(lyricClone.innerHTML);
  lyricClone.querySelector(".hide").id='hide' + numLines;
  lyricClone.querySelector(".lyrics").id='lyrics' + numLines;
  lyricClone.querySelector(".stretcher").id='stretcher' + numLines;

  document.querySelector('#save-area').insertAdjacentHTML('beforeend', lyricClone.innerHTML);
}





const fetchChordData = async (newString, node) => {

  const url = "https://api.uberchord.com/v1/chords/" + newString.trim();
  const response = await fetch(url);
  const json = await response.json();
  // console.log(json);
}

const ta = document.getElementById("target-area");

let numClones = 0;
let numLines = 1;
let currentDrag = null;
let offX = 0;
let offY = 0;



////////////////////////////////////////////
//    save song
////////////////////////////////////////////

saveSong  = () => {
  const save  =  document.querySelector('#save-area');
  // const title =  save.querySelector('#song-title').value;
  // document.querySelector('#test').innerHTML = save.outerHTML;
  formatSong(save);
}


formatSong = (save) => {
  const title =  save.querySelector('#song-title').value;
  // document.querySelector('#test').insertAdjacentHTML('beforeend', `<h3>${title}</h3` );
  const myTitleLine = `<div class='title-line'>${title}</div>`;



  const chordlines = Array.from(save.querySelectorAll('.chord-line'));
  const lyriclines = Array.from(save.querySelectorAll('.lyrics'));
  let myChordLine = "";
  let myLyricLine = "";

    chordlines.forEach( (chordline, index) => {
     Array.from(chordline.children).forEach((chord) => {
      chord.draggable="false"
      chord.querySelector(".trash").remove();
    });

    myChordLine  = `<div class="chord-line">${chordline.innerHTML}</div>`
    // document.querySelector('#test').insertAdjacentHTML('beforeend', myChordLine);

    const line = lyriclines[index]
    myLyricLine = `<div class='lyrics' style='letter-spacing: ${line.style.letterSpacing}; word-spacing: ${line.style.wordSpacing};'>${line.value}</div>`;
    // document.querySelector('#test').insertAdjacentHTML('beforeend', myLyricLine);
  });


  document.querySelector('#song-name').value = title;

  const myHtml = `<div class='col' style='height:180px;'>
  <div><h3>${myTitleLine}</h3></div>
  <div style='width:100%'>${myChordLine}</div>
  <div style='position: absolute; bottom:0'>${myLyricLine}</div>
  </div>`
  document.querySelector('#song-html').value = myHtml;
}

//////////////////////////////////////////////////////////////
//             expandable text field
//////////////////////////////////////////////////////////////

let textStartWidth = 150.0;
let textDefaultWidth = 150.0;
let letterSpacingStart = 0.0;
let wordSpacingStart = 0.0;

// const
let lines = [];
let hide = document.getElementsByClassName('hide')[0];
let lyrics = document.getElementsByClassName('lyrics')[0];

// console.log("hide  " + hide);
// lyrics.style.maxWidth = '530px';

resize();
lyrics.addEventListener("input", resize);


lyrics.style.letterSpacing = letterSpacingStart + "px";
lyrics.style.wordSpacing = wordSpacingStart + "px";

document.addEventListener('mouseup', removeXListener, true);


function removeXListener (ev) {
  document.removeEventListener('mousemove', checkMouseX, true);
};



function clickStretcher (ev) {
  offX = parseInt (ev.clientX);
  textDefaultWidth = parseFloat(lyrics.style.width);
  currentDrag = ev.target;
  letterSpacingStart = parseFloat(lyrics.style.letterSpacing);
  wordSpacingStart = parseFloat(lyrics.style.wordSpacing);
    // console.log ("letterSpacingStart " + letterSpacingStart);
    // console.log ("lyrics.style.letterSpacing " + lyrics.style.letterSpacing);

  document.addEventListener('mousemove', checkMouseX, true);
}

function checkMouseX(ev) {
  if (lyrics.value != "") {
    // console.log ("ev.screenX " + ev.screenX);
    // console.log ("check " + (parseFloat(lyrics.style.width) - textDefaultWidth));
    // console.log ("wordSpacingStart " + wordSpacingStart);
    lyrics.style.width =  (textDefaultWidth   +  (ev.clientX  -  offX)) + "px";
    hide.style.width =  (textDefaultWidth   +  (ev.clientX  -  offX)) + "px";

    lyrics.style.letterSpacing = letterSpacingStart + ((parseFloat(lyrics.style.width) - textDefaultWidth)/80 ) + 'px';
    hide.style.letterSpacing = letterSpacingStart + ((parseFloat(lyrics.style.width) - textDefaultWidth)/80)  + 'px';

    lyrics.style.wordSpacing = wordSpacingStart + ((parseFloat(lyrics.style.width) - textDefaultWidth)/25)  + 'px';
    hide.style.wordSpacing = wordSpacingStart + ((parseFloat(lyrics.style.width) - textDefaultWidth)/25)  + 'px';

  }
  console.log('checkMouseX    lyrics.style.letterSpacing ' + lyrics.style.letterSpacing)
}


function unclickStretcher (ev) {
  textDefaultWidth = parseInt(lyrics.style.width);
  document.removeEventListener('mousemove', checkMouseX, true);
  currentDrag = null;
  letterSpacingStart = lyrics.style.letterSpacing;
  wordSpacingStart = lyrics.style.wordSpacing;
    // console.log ("unclick " + letterSpacingStart);
}


function resize() {
  hide.textContent = lyrics.value;
  lyrics.style.width = hide.offsetWidth + "px";
  textDefaultWidth  = parseFloat (lyrics.style.width);
  textStartWidth = parseFloat (lyrics.style.width);
}



///////////////////////////////////////////////////////////
//                drag and drop
//////////////////////////////////////////////////////////



function dragstart_handler(ev) {
  // console.log('ev.target  ' + ev.target.parentNode);
  // if (ev.target.id.substring(0,5) == 'chord') {
  //   currentDrag = ev.target;
  // } else {
  //   currentDrag = ev.target.parentNode;
  // }

  currentDrag = ev.target;
  ev.dataTransfer.setData("application/my-app", currentDrag.id);
  currentDrag.addEventListener("onMouseUp", dropChord(event), false);

  if (currentDrag.parentNode.id == "target-area" ) {
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

function dragover_handler(ev) {
  ev.preventDefault();
  const clones =  Array.from(document.getElementById('target-area').children);
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


function ripple(array, overlap, direction) {
  let ovr = overlap;
  let colliding = true;
  let oldX = parseInt(array[0].style.left);
  let newX = direction == 'left' ? (oldX - (ovr + 4)) : oldX + (ovr + 4) ;
  array[0].style.left = newX + 'px';
  checkBoundaries(array[0]);

  for (i = 0; i < array.length - 1; i++) {
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

  for (i = 0; i < array.length - 1; i++) {
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

function deleteChord(el) {
  const chord = (el.parentNode.parentNode.parentNode.parentNode);
  chord.parentNode.removeChild(chord);
}

function deleteLeft(el) {
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
    const tr = el.getElementsByClassName("trash");
    console.log ('tr ' + tr[0])
    tr[0].insertAdjacentHTML("beforeend", '<div class="delete-chord" onclick="deleteChord(this)"><i class="fas fa-trash"></i></div> ')
  }  else {
    el  = document.getElementById(data);
  }
  ev.target.appendChild(el);
  el.style.position = 'absolute';
  el.style.left = ( (ev.screenX - window.screenX) - document.getElementById('target-area').parentNode.offsetLeft) - document.getElementById('target-area').offsetLeft - offX + "px";
}
