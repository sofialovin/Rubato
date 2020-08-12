const SelectAndUnselectSongOnClick = () => {
  let songs = document.querySelectorAll(".song-card-student-page");
  //console.log(songs);
  songs.forEach((song) => {
    // console.log(song);
    song.addEventListener('click', () => {
      if (song.firstElementChild.checked == false) {
        song.firstElementChild.checked = true;
        song.classList.add("border-select");
      } else {
        song.firstElementChild.checked = false;
        song.classList.remove("border-select");
      }
    });
  });
};

export { SelectAndUnselectSongOnClick };


