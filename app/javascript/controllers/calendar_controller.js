import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  calendar = null;

  connect() {
    console.log("connect calendar controller js");

    this.initCalendar();
    this.getCalendardata();

    const refreshButton = document.getElementById("refresh-link");
    refreshButton.addEventListener("click", () => {
      this.updateCalendardata();
    });

    const viewLinks = Array.from(this.element.querySelectorAll(".view-link"));
    viewLinks.forEach((link) => {
      link.addEventListener("click", () => {

        this.handleViewChange(link);
      });
    });
  }

  initCalendar() {
    console.log("init cal controller js");

    this.calendar = new Calendar(document.getElementById("calendar"), {
      // Calendar options...
      defaultView: "month",
      calendars: [
        {
          id: "cal1",
          name: "Personal",
        },
      ],
      taskView: true,
      milestone: true, // Can be also ['milestone', 'task']
      scheduleView: true, // Can be also ['allday', 'time']
      useFormPopup: false,
      useDetailPopup: true,
      template: {
        monthDayname: function (dayname) {
          return '<span class="calendar-week-dayname-name">' + dayname.label + "</span>";
        },
      },
    });
  }

  getCalendardata() {
    console.log("get data calendar controller js");

    const schedules = JSON.parse(document.querySelector("#calendar").dataset.schedules);
    window.schedules = schedules;
    schedules.forEach((schedule) => {
      this.calendar.createEvents([
        {
          id: schedule.id,
          calendarId: "1",
          title: schedule.title,
          start: schedule.start,
          end: schedule.end,
          isReadOnly: true,
          color: "#f5fafa",
          backgroundColor: "#0c1591",
        },
      ]);
    });
  }



  handleViewChange(link) {
    console.log("Clicked button ID:", link.id);

    if (link.id === "previous-link") {
      this.calendar.prev();
    } else if (link.id === "next-link") {
      this.calendar.next();
    } else {
      this.calendar.changeView(link.id);
    }
  }
}
