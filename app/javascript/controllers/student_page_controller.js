import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "songs", "lessons", "lessonsContent", "songsContent", "allLessonsRightSide", "SongRightSide", "songsList", "songListRightSide", "AddSong"]

  connect() {
    if (this.hasLessonsTarget) {
      if (localStorage.getItem("SongAdded")) {
        //console.log("Song added is true");

        this.songsTarget.classList.add("selected-item");
        this.lessonsTarget.classList.remove("selected-item");

        if (this.hasSongsListTarget) {
          let counter = 0;
          Array.from(this.songsListTarget.children).forEach((song) => {
            if (song.classList.contains("active")) {
              counter += 1;
            }
          });

          if (counter == 0 ) {
            this.songsListTarget.lastElementChild.classList.add("active");
            this.songListRightSideTarget.lastElementChild.classList.add("active");
          };
        }

        this.lessonsContentTarget.style.display = "none";
        this.songsContentTarget.style.display = "";
        this.allLessonsRightSideTarget.style.display = "none";
        this.SongRightSideTarget.style.display = "";

        localStorage.clear();

      } else {
        this.lessonsTarget.classList.add("selected-item");
        this.songsTarget.classList.remove("selected-item");
        this.songsContentTarget.style.display = "none";
        this.lessonsContentTarget.style.display = "";
        this.SongRightSideTarget.style.display = "none";
        this.allLessonsRightSideTarget.style.display = "";
      }
    }
  }

  selectSongs() {
    // console.log("Select Songs reached");
    // console.log("Songs was clicked");
    this.songsTarget.classList.add("selected-item");
    this.lessonsTarget.classList.remove("selected-item");
    // console.log(this.songsListTarget);

    if (this.hasSongsListTarget) {
      let counter = 0;
      Array.from(this.songsListTarget.children).forEach((song) => {
        if (song.classList.contains("active")) {
          counter += 1;
        }
      });

      if (counter == 0 ) {
        this.songsListTarget.firstElementChild.classList.add("active");
        this.songListRightSideTarget.firstElementChild.classList.add("active");
      };
    }

    this.lessonsContentTarget.style.display = "none";
    this.songsContentTarget.style.display = "";
    this.allLessonsRightSideTarget.style.display = "none";
    this.SongRightSideTarget.style.display = "";
  }

  selectLessons() {
    if (this.hasLessonsTarget) {
    // console.log("Lessons was clicked");
    this.lessonsTarget.classList.add("selected-item");
    this.songsTarget.classList.remove("selected-item");
    this.songsContentTarget.style.display = "none";
    this.lessonsContentTarget.style.display = "";
    this.SongRightSideTarget.style.display = "none";
    this.allLessonsRightSideTarget.style.display = "";
    }
  }

  addSongAndGoBackToSongs() {
    // console.log("Song added");
    this.songsTarget.classList.add("selected-item");
    this.lessonsTarget.classList.remove("selected-item");
    localStorage.setItem("SongAdded", true);
  }
}
