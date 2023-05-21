import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  calendar = null;

  connect() {
    console.log("hello from controller js");
    this.initCalendar();
    this.getCalendardata();

    const refreshButton = document.getElementById("refresh-link");
    refreshButton.addEventListener("click", () => {
      this.updateCalendardata();
    });
  }

  initCalendar() {
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

  async updateCalendardata() {
    this.calendar.clear();
    console.log("Update calendrier");

    try {
      const response = await fetch('/schedules'); // Replace with your server-side endpoint to fetch schedules
      const updatedSchedules = await response.json();

      window.schedules = updatedSchedules;

      updatedSchedules.forEach((schedule) => {
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

      console.log("Calendar updated successfully");
    } catch (error) {
      console.error("Error updating calendar:", error);
    }
  }
}
