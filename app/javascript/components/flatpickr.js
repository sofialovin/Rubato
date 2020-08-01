const flatpickr = require("flatpickr");

const LessonDateWithFlatpickr = () => {
  flatpickr(".flatpickr-date", { altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Z"
  })
};

const LessonTimeWithFlatpickr = () => {
  flatpickr(".flatpickr-time", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    minuteIncrement: 5
  })
};


export { LessonDateWithFlatpickr };
export { LessonTimeWithFlatpickr };
