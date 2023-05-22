import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  calendar = null;

  connect() {
    console.log("connect calendar controller js");

    this.initCalendar();
    this.getCalendardata();
    this.updateMonthText();

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
      this.updateMonthText();
    } else if (link.id === "next-link") {
      this.calendar.next();
      this.updateMonthText();
    } else if (link.id === "current-link") {
      this.calendar.getDate();
      this.updateMonthText();

    } else if (link.id === "current-month-link") {
      const today = new Date(); // Get the current date
      this.calendar.setDate(today);
      this.updateMonthText();
      this.calendar.changeView("month");
    }
    
    else {
      this.calendar.changeView(link.id);
    }
  }
  
  
  updateMonthText() {

    const currentMonthSpan = document.getElementById("current-month");
    const prevMonthSpan = document.getElementById("prev-month");
    const nextMonthSpan = document.getElementById("next-month");

    const currentMonth = new Date(this.calendar.getDate()); 
    const currentMonthVal = currentMonth.toLocaleString('default', { month: 'long' });
    
    const prevMonth = new Date(currentMonth.getFullYear(), currentMonth.getMonth() - 1);
    const prevMonthVal = prevMonth.toLocaleString('default', { month: 'long' });

    const nextMonth = new Date(currentMonth.getFullYear(), currentMonth.getMonth() + 1);
    const nextMonthVal = nextMonth.toLocaleString('default', { month: 'long' });

    currentMonthSpan.textContent  = currentMonthVal ;
    prevMonthSpan.textContent  = prevMonthVal ;
    nextMonthSpan.textContent  = nextMonthVal ;

  }

}
