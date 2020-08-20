const flatpickr = require("flatpickr");

const LessonDateWithFlatpickr = () => {
  flatpickr(".flatpickr-date", { altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d"
  })
};

const LessonTimeWithFlatpickr = () => {
  flatpickr(".flatpickr-time", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "h:i K",
    minuteIncrement: 5
  })
};


export { LessonDateWithFlatpickr };
export { LessonTimeWithFlatpickr };
