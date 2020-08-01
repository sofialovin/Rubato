export default class dnd  {

  constructor() {
    this.clones = [];
    // this.setEventListeners();
    this.currentDrag = null;
    this.offX = 0;
  }

  setEventListeners() {
    element.addEventListner("drag", (event) => {
      this.dragstart_handler(event);
    });
  }

 dragstart_handler = (ev) => {
   clones =  Array.from(document.getElementById('target-area').children);
    console.log(clones);
    ev.dataTransfer.setData("application/my-app", ev.target.id);
    ev.target.addEventListener("onMouseUp", dropChord(event), false);

    currentDrag = ev.target;
    if (currentDrag.parentNode.id == "target-area") {
      currentDrag.addEventListener('dragstart', handleDragStart, false);
      currentDrag.addEventListener('dragend', handleDragEnd, false);
    }

  handleDragStart = (e) => {
    this.style.opacity = '0.3';
    this.style.transition = "opacity .5s";
  }


  handleDragEnd  = (e) => {
    this.style.opacity = '1';
    this.style.transition = "none";
  }

  dropChord = (event) => {
      offX = event.offsetX;
  }
}

dragover_handler = (ev) => {
  ev.preventDefault();


  clones.forEach(function(element) {
  if (element != currentDrag) {
    if (dragIntersection(ev, element, currentDrag) == true ) {
      const oldX = parseInt(element.style.left)
      let newX = oldX
      if (xOverlap(ev, element, currentDrag) > 0 ) {
        newX -= ((element.getBoundingClientRect().width) - xOverlap(ev, element, currentDrag) + 8) ;
        checkCollisionsLeft(element, clones);
      } else {
        newX += ((element.getBoundingClientRect().width) + xOverlap(ev, element, currentDrag)  + 8);
        checkCollisionsRight(element, clones);
      }
      if (newX < 0 || newX > element.parentNode.getBoundingClientRect().width - element.getBoundingClientRect().width) {
        replaceChord(element);
      };
      element.style.left = newX + 'px';
    }
    }
  });
};

checkCollisionsLeft = (el, clones) => {
  clones.forEach(function(element) {
    if (element != el && element != currentDrag) {
      if (arrayLeftIntersection(el, element) == true ) {
        const oldX = parseInt(element.style.left);
        let newX = oldX - parseInt(arrayLeftOverlap(el, element)) ;
        checkArrayLeft(clones);
        // console.log("newX " + newX);
        if (newX < 0) {
          replaceChord(element);
        };
        element.style.left = newX + 'px';
      }
    }
  });
}


checkCollisionsRight = (el) => {
  clones.forEach(function(element) {
  if (element != el && element != currentDrag) {
      if (arrayRightIntersection(el, element) == true ) {
        const oldX = parseInt(element.style.left)
        let newX = oldX - parseInt(arrayRightOverlap(el, element)) ;
        checkArrayRight(clones);
        if (newX > element.parentNode.getBoundingClientRect().width - element.getBoundingClientRect().width) {
          replaceChord(element);
        };
        element.style.left = newX + 'px';
      }
    }
  });
}



checkArrayLeft = () => {
  clones.forEach(function(element1) {
  // if (element1 != currentDrag) {
    clones.forEach(function(element2) {
      if (element1 != element2) {
        if (arrayLeftIntersection(element1, element2) == true ) {
          const oldX = parseInt(element2.style.left);
          let newX = oldX - parseInt(arrayLeftOverlap(element1, element2));
          if (newX < 0) {
            // replaceChord(element2);
          };
          element2.style.left = newX + 'px';
        };
      };
    });
  // }
  });
};


checkArrayRight = () => {
  clones.forEach(function(element1) {
  // if (element1 != currentDrag) {
    clones.forEach(function(element2) {
      if (element1 != element2) {
        if (arrayRightIntersection(element1, element2) == true ) {
          const oldX = parseInt(element2.style.left);
          let newX = oldX - parseInt(arrayRightOverlap(element1, element2));
          if (newX < 0) {
            // replaceChord(element2);
          };
          element2.style.left = newX + 'px';
        };
      };
    });
  // }
  });
};





drop_handler(ev) {

 ev.preventDefault();

 const data = ev.dataTransfer.getData("application/my-app");
 let el;
 const clone = document.getElementById(data).parentNode.id == "library" ? true : false;
 if (clone) {
  el  = document.getElementById(data).cloneNode([true]);
  el.id = "newId" + document.getElementById('target-area').children.length;
  el.class = 'clone';
  el.insertAdjacentHTML("beforeend", '<div class="delete-chord" onclick="deleteChord(this)">X</div> ')
 }  else {
  el  = document.getElementById(data);
 }
  ev.target.appendChild(el);
  el.style.position = 'absolute';
  el.style.left = ( (ev.screenX - window.screenX) - document.getElementById('target-area').offsetLeft) - offX + "px";
}


dragIntersection = (ev, element, currentDrag) => {
  return !(
    element.getBoundingClientRect().x > (ev.clientX - offX) + currentDrag.getBoundingClientRect().width ||
    element.getBoundingClientRect().x + element.getBoundingClientRect().width < (ev.clientX - offX)
  );
}

arrayLeftIntersection = (element1, element2) => {
  return !(element2.getBoundingClientRect().x + element2.getBoundingClientRect().width < element1.getBoundingClientRect().x);
}


arrayRightIntersection = (element1, element2) => {
  return !(element2.getBoundingClientRect().x  < element1.getBoundingClientRect().x + element1.getBoundingClientRect().width);
}


arrayLeftOverlap = (element1, element2) => {
  return (((element2.getBoundingClientRect().x + element2.getBoundingClientRect().width) - element1.getBoundingClientRect().x)+ 16);
}

arrayRightOverlap = (element1, element2) => {
  return (((element1.getBoundingClientRect().x + element1.getBoundingClientRect().width) - element2.getBoundingClientRect().x) + 16);
}


xOverlap = (ev, element, currentDrag) => {
    return ((ev.clientX - offX) - (element.getBoundingClientRect().x));
}


deleteChord = (el) => {
  const chord = (el.parentNode);
  chord.parentNode.removeChild(chord);
}

replaceChord = (el) =>{
  el.parentNode.removeChild(el);
}



}

