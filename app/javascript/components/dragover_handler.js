
    const dragover_handler = (ev) => {
      console.log ("something");
      ev.preventDefault();
      const clones =  Array.from(ev.target.children);
      const sortedClones = clones.sort((a, b) => parseInt(a.style.left) - parseInt(b.style.left));
      let leftClones = [];
      let rightClones = [];
      sortedClones.forEach(function(element) {
          // if (element != currentDrag) {
          if (parseInt(element.style.left) < parseInt(ev.clientX - ta.getBoundingClientRect().x)) {
            leftClones.unshift(element); // from center to left
          } else {
            rightClones.push(element); // from center to right
          }
        // }
      });
    }

      export { dragover_handler }
