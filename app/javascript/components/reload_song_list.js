const ReloadSongList = () => {

// select all necessary elements
let searchForm = document.querySelector(".search-container");
let pageBody = document.querySelector("body");
let songModal = document.getElementById("exampleModal");
let div = document.createElement("div");
let closeButton = document.getElementById("close-button");
let addSongButton = document.getElementById("add-song-button");
let closeX = document.getElementById("close-x");

// on submit of form check if query present

  window.addEventListener('load', () => {
    if (QueryPresent() == true) {
      console.log("Seach query present");
      openSongModal();
      addBackDrop();
    } else {
      console.log("No search query");
    }
  });

  closeButton.addEventListener('click', () => {
    console.log("Close button has been clicked");
    closeSongModal();
  });

  closeX.addEventListener('click', () => {
    console.log("X has been clicked");
    closeSongModal();
  });

  addSongButton.addEventListener('click', () => {
    console.log('Add Song Button has been clicked');
    openSongModal();
  });

  const closeSongModal = () => {
    let backdrop = document.querySelector(".modal-backdrop");
    console.log(backdrop);
    songModal.style.display = "none";
    songModal.classList.remove("show");
    pageBody.classList.remove("modal-open");
    backdrop.remove();
    console.log("backdrop removed");
  };

  const openSongModal = () => {
    let backdrop = document.querySelector(".modal-backdrop");
    if (document.body.contains(backdrop)) {
      console.log("backdrop exists");
      backdrop.remove();
    } else {
      console.log("Creating Backdrop and everything");
      songModal.style.display = "block";
      songModal.classList.add("show");
      pageBody.classList.add("modal-open");
    }
  };

  const addBackDrop = () => {
    document.body.appendChild(div);
    div.classList.add("modal-backdrop");
    div.classList.add("fade");
    div.classList.add("show");
  };

};

const QueryPresent = () => {
  var field = 'query';
  var url = window.location.href;
  if(url.indexOf('?' + field + '=') != -1)
    return true;
  else
    return false;
};

export { ReloadSongList };
