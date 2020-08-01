Vue.component('event-list', {
  props: ['filterBeginner', 'filterIntermediate', 'filterAdvanced'],
  data: () => ({
    eventList: [
      {
        title: 'Scuba Merit Badge',
        date: 'August 28 | 8am - 3pm',
        desc: 'Earn your scuba diving merit badge. Pre-req: Requirement 1a, 2b, 4ab',
        address: '503 Harbor Blvd, Destin, FL',
        pic: 'https://images.unsplash.com/photo-1484507175567-a114f764f78b?ixlib=rb-0.3.5&s=abc2cb4d7e6d8aca1e8914c1b5e909a6&auto=format&fit=crop&w=500&q=60',
        month: 'Aug',
        day: '28',
        important: true,
        upcoming: true
      },
      {
        title: 'Backpacking Hike',
        date: 'June 4th, 2018',
        desc: '10mi backpacking hike at Thunder Mountain. Remember to pack properly',
        address: 'Thunder Mtn, Disney, FL',
        pic: 'https://images.unsplash.com/photo-1467139701929-18c0d27a7516?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=874439394c29dfb8f4b5a794a51a52f2&auto=format&fit=crop&w=750&q=80',
        month: 'Jun',
        day: '04',
        important: false,
        upcoming: true
      },
      {
        title: 'Black Forest Camp',
        date: 'March 3 - March 5, 2018',
        desc: 'Weekend campout in the Black Forest',
        address: 'Black Forest, Baden-Württemberg, DE',
        pic: 'https://images.unsplash.com/photo-1501703979959-797917eb21c8?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d4132e8087781addd674e137a9f596dc&auto=format&fit=crop&w=889&q=80',
        month: 'Mar',
        day: '03',
        important: false,
        upcoming: true
      },
      {
        title: 'Artic Campout',
        date: 'December 14 - 18, 2018',
        desc: 'Campout in the artic. Freeze your toes off. See cute penguins.',
        address: 'Barrow, Alaska, US',
        pic: 'https://images.unsplash.com/photo-1498279898147-67f541d32b6a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=af428042e69ac5152855548d8b4f7989&auto=format&fit=crop&w=667&q=80',
        month: 'Dec',
        day: '14',
        important: false,
        upcoming: false
      },
      {
        title: 'Sailing',
        date: 'April 23 | 11am - 7pm',
        desc: 'Sail the high seas. Get lost in the Bermuda Triangle.',
        address: 'Second star to the right, and straight on till morning',
        pic: 'https://images.unsplash.com/photo-1500514966906-fe245eea9344?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9193225514494f3e830d444d4ae58819&auto=format&fit=crop&w=667&q=80',
        month: 'Apr',
        day: '23',
        important: false,
        upcoming: false
      }
    ]
  }),
  computed: {
    filteredList() {
      this.filterUpcoming

      return this.eventList.filter(e => {
        let conditions = [true, true, true];
        conditions[0] = e.upcoming == this.filterUpcoming;

        if(this.filterImportant)
          conditions[1] = e.important == this.filterImportant;
        if(this.filterSearch.trim() != '')
          conditions[2] = e.title.toLowerCase().includes(this.filterSearch.trim().toLowerCase());

        return conditions.every(e => e === true);
      });
    }
  },

  methods: {
    cardBeforeEnter(el) {
      el.style.opacity = 0;
      el.style.transform = 'scale(90%)';
      el.style.height = 0;
    },
    cardEnter(el, done) {
      let delay = el.dataset.index * 200;
      setTimeout(() => {
        Velocity(
          el,
          { opacity: 1, height: '100%', scale: '100%' },
          { complete: done }
        );
      }, delay);
    },
    cardLeave(el, done) {
      let delay = el.dataset.index * 200;
      setTimeout(() => {
        Velocity(
          el,
          { opacity: 0, height: 0, scale: '90%' },
          { complete: done }
        );
      }, delay);
    }
  },
  created() {
  },
  template: document.getElementById('componentTemplate').innerHTML
});

new Vue({
  el: "#app",
  data: () => ({
    searchIsFocused: false,
    eventsUpcomingFilter: 'important',

    filter: {
      upcoming: true,
      important: true,
      search: ''
    }
  }),
  methods: {
    searchFocus() {
      this.searchIsFocused = true;
    },
    searchUnfocus() {
      this.searchIsFocused = false;
    },
    upcomingFilterChange() {
      switch(this.eventsUpcomingFilter) {
        case 'important':
          this.filter.upcoming = true;
          this.filter.important = true;
          break;
        case 'upcoming':
          this.filter.upcoming = true;
          this.filter.important = false;
          break;
        case 'finished':
          this.filter.upcoming = false;
          this.filter.important = false;
          break;
      }
    }
  }
});
