const library = () => {

  const ta = document.getElementById("target-area1");
  const newPageIdentifier = document.querySelector(".new-page-identifier");
   if (newPageIdentifier) {

    let numClones = 0;
    let numLines = 1;
    let currentDrag = null;
    let offX = 0;
    let offY = 0;




    let stringSpace = 10.5;
    let fretSpace = 27;
    let dotDefaultX = 2;
    let dotDefaultY = 0;

    const fetchChordData = async (newString, node) => {
      const url = "https://api.uberchord.com/v1/chords/" + newString;
      const response = await fetch(url);
      const json = await response.json();
      if (json[0]) {
        let cName = (json[0].chordName.replace(/,/g , ""));
        Array.from(document.getElementsByClassName("chord_name")).forEach( chordname => {
        const noDash = node.parentNode.querySelector(".chord_name").value.replace(/_/g, "").replace("Gb", "F#");

          if (noDash === cName) {
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
    };


    const chords = Array.from(document.querySelectorAll(".chordname"));
    chords.forEach(chord => {
      let chordName = chord.parentNode.parentNode.parentNode.children[0].value;
      const insertPoint = chord.parentNode.parentNode.parentNode.querySelector(".chord-diagram");
      fetchChordData (chordName, insertPoint);
    });
  };
}

export { library };
