let currentDrag = null;
 window.addEventListener('DOMContentLoaded', () => {

  let offX = 0;
  });

 dragstart_handler = (ev) => {

  ev.dataTransfer.setData("application/my-app", ev.target.id);
  ev.target.addEventListener("onMouseUp", dropChord(event), false);

  currentDrag = ev.target;
  function dropChord(event) {
      offX = event.offsetX;
      offY = event.offsetY;
  }
}

dragover_handler = (ev)  => {
 ev.preventDefault();
 const clones =  Array.from($('#target-area')[0].children);

 clones.forEach(function(element) {
  if (element != currentDrag) {
  if (haveIntersection(ev, element, currentDrag) == true ) {
    const over = xOverlap(ev, element, currentDrag) ;
    console.log(over);
    // element.style="transition: translate(-10, 0) 2s";
  }
  }
});
};

 drop_handler = (ev) => {

 ev.preventDefault();

 const data = ev.dataTransfer.getData("application/my-app");
 let el;
 const clone = document.getElementById(data).parentNode.id == "library" ? true : false;
 if (clone) {
  el  = document.getElementById(data).cloneNode([true]);
  el.id = "newId" + $('#target-area')[0].children.length;
  el.class = 'clone';
  el.insertAdjacentHTML("beforeend", '<div class="delete-chord" onclick="deleteChord">X</div> ')
 }  else {
  el  = document.getElementById(data);
 }
  ev.target.appendChild(el);
  el.style.position = 'absolute';
  el.style.left = ((ev.screenX - window.screenX) - $('#target-area').offset().left) - offX + "px";
}

deleteChord = () => {
  console.log ('dsgsdgsgsegwrsh');
}


function haveIntersection(ev, element, currentDrag) {
  return !(
    element.getBoundingClientRect().x > (ev.clientX - offX) + currentDrag.getBoundingClientRect().width ||
    element.getBoundingClientRect().x + element.getBoundingClientRect().width < (ev.clientX - offX)
  );
}


function xOverlap(ev, element, currentDrag) {
    return ((ev.clientX - offX) - (element.getBoundingClientRect().x));
}

export { dragstart_handler, dragover_handler, drop_handler }
