import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  calendar = new Calendar(document.getElementById("calendar"), {
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

  getCalendardata() {
    const schedules = JSON.parse(document.querySelector("#calendar").dataset.schedules);
    window.schedules = schedules;
    schedules.forEach((schedule) => {
      this.calendar.createEvents([
        {
          id: schedule.id,
          color: "#f5fafa",
          backgroundColor: "#0c1591",
          calendarId: "1",
          title: schedule.title,
          category: "time",
          // dueDateClass: schedule.dueDateClass,
          isReadOnly: true,
          start: schedule.start,
          end: schedule.end,
        },
      ]);
    });
  }

  createCalendarSchedule() {
    const calendar = this.calendar;
    calendar.on("beforeCreateEvent", function (event) {
      const triggerEventName = event.triggerEventName;
      const schedule = {
        id: 1,
        calendarId: "1",
        title: event.title,
        category: "time",
        location: event.location,
        start: event.start,
        end: event.end,
      };

      calendar.createSchedules([schedule]);
      const formData = new FormData();
      formData.append("title", schedule.title);
      formData.append("start", schedule.start._date);
      formData.append("end", schedule.end._date);

      Rails.ajax({
        type: "POST",
        url: "/schedules",
        data: formData,
      });
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

  connect() {
    console.log("hello from controller js");

    const viewLinks = Array.from(this.element.querySelectorAll(".view-link"));
    viewLinks.forEach((link) => {
      link.addEventListener("click", () => {
        this.handleViewChange(link);
      });
    });

    this.getCalendardata();
    this.createCalendarSchedule();
  }
}
