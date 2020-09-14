import { dnd } from './dnd'
// import { dragover_handler } from './dragover_handler'
// import { drop_handler } from './drop_handler'
import { lyrics } from'./lyrics'

const save_song = () => {

  const newPageIdentifier = document.querySelector(".new-page-identifier");
   if (newPageIdentifier) {
    const ta = document.getElementById("target-area1");
    let numLines = 1;

  const addLine = () => {
    numLines ++;
    let templateClone = document.getElementById("template").content.firstElementChild.cloneNode(true);

    templateClone.querySelector(".target-area").id = "target-area" + numLines;
    templateClone.querySelector(".hide").id='hide' + numLines;
    templateClone.querySelector(".lyrics").id='lyrics' + numLines;
    templateClone.querySelector(".stretcher").id='stretcher' + numLines;

    templateClone.querySelector(".target-area").addEventListener('dragover', dnd.dragover_handler);

    console.log(dnd);
    templateClone.querySelector(".target-area").addEventListener('drop', dnd.drop_handler);
    templateClone.querySelector(".lyrics").addEventListener('input', lyrics.resize);
    templateClone.querySelector(".lyrics").addEventListener('focus', lyrics.focusLyrics);
    templateClone.querySelector(".stretcher").addEventListener('mousedown', lyrics.clickStretcher);

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
      // console.log(event);
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
    }
  };
}
export { save_song };
