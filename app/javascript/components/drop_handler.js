 let numClones = 0;

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
        // el.addEventListener("dragstart", dragstart_handler);
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


export { drop_handler }
