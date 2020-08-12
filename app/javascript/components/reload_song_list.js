const ReloadSongList = () => {
  // select search form
  // select div with id exampleModal
  // on click add class "show"
  // on click change style to display:block
  let delay = 5000;
  let searchForm = document.querySelector(".search-container");

  let songModal = document.getElementById("exampleModal");

  let pageBody = document.querySelector("body");

  let div = document.createElement("div");

  searchForm.addEventListener('submit', () => {
    // event.preventDefault();
    // console.log(songModal);
    // searchForm.submit();
    // setTimeout(function() {
    //   console.log(songModal);

    // }, delay);

    songModal.style.display = "block";
    pageBody.classList.add("modal-open");
    document.body.appendChild(div);
    // div.classList.add("modal-backdrop");
    // div.classList.add("fade");
    // div.classList.add("show");
  });

};

export { ReloadSongList };
