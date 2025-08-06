settings =
    lang: 'en'

clock12h = false

locale =
  en:
    weekdays: [
      'Sunday'
      'Monday'
      'Tuesday'
      'Wednesday'
      'Thursday'
      'Friday'
      'Saturday'
    ]
    months: [
      'January'
      'February'
      'March'
      'April'
      'May'
      'June'
      'July'
      'August'
      'September'
      'October'
      'November'
      'December'
    ]
  de:
    weekdays: [
      'Sonntag'
      'Montag'
      'Dienstag'
      'Mittwoch'
      'Donnerstag'
      'Freitag'
      'Samstag'
    ]
    months: [
      'Januar'
      'Februar'
      'März'
      'April'
      'Mai'
      'Juni'
      'Juli'
      'August'
      'September'
      'Oktober'
      'November'
      'Dezember'
    ]
  nl:
    weekdays: [
      'Zondag'
      'Maandag'
      'Dinsdag'
      'Woensdag'
      'Donderdag'
      'Vrijdag'
      'Zaterdag'
    ]
    months: [
      'Januar'
      'Februar'
      'Mars'
      'April'
      'Mai'
      'Juni'
      'Juli'
      'August'
      'September'
      'Oktober'
      'November'
      'Desember'
    ]



command: ""

settings: settings
locale: locale

refreshFrequency: 1000

style: """
  @font-face {
    font-family: 'Hack Font';
    src: url("HackNerdFontMono-Regular.ttf");
  }

  .container {
    font-family: 'Hack Font', 'Monaco', 'Menlo', 'Ubuntu Mono', monospace;
    background-color: #303446;
    padding: 30px;
    border-radius: 8px;
    display: inline-block;
    min-width: 400px;
    font-size: 18px;
    line-height: 1.6;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: #a6d189;
  }

  .code-line {
    color: #a6d189;
    margin-left: 0px;
    font-family: 'Hack Font', 'Monaco', 'Menlo', 'Ubuntu Mono', monospace;
  }

  .const {
    color: #ca9ee6;
  }

  .property {
    color: #8caaee;
  }

  .operator {
    color: #8caaee;
  }

  .bracket {
    color: #e78284;
  }

  .number, .year, .month-num, .day, .hours, .minutes, .seconds {
    color: #ef9f76;
  }

  .string, .weekday {
    color: #a6d189;
  }

  body {
    background-color: transparent;
  }

  .ampm-container {
    display: none;
  }
"""

render: () -> """
  <div class='container'>
    <div class='code-line'>
      <div><span class="const">const</span> currentTime <span class="operator">=</span> <span class="bracket">{</span></div>
      <div>&nbsp;&nbsp;<span class='property'>year</span>: <span class='number year-val'></span>,</div>
      <div>&nbsp;&nbsp;<span class='property'>month</span>: <span class='number month-num'></span>,</div>
      <div>&nbsp;&nbsp;<span class='property'>day</span>: <span class='number day'></span>,</div>
      <div>&nbsp;&nbsp;<span class='property'>dayOfWeek</span>: "<span class='string weekday'></span>",</div>
      <div>&nbsp;&nbsp;<span class='property'>hour</span>: <span class='number hours'></span>,</div>
      <div>&nbsp;&nbsp;<span class='property'>minute</span>: <span class='number minutes'></span>,</div>
      <div>&nbsp;&nbsp;<span class='property'>second</span>: <span class='number seconds'></span>,</div>
      <div class="ampm-container">&nbsp;&nbsp;<span class='property'>ampm</span>: "<span class='string ampm'></span>",</div>
      <div>&nbsp;&nbsp;<span class='property'>dayProgress</span>: <span class='number procent'></span></div>
      <div><span class="bracket">}</span></div>
    </div>
  </div>
"""

afterRender: (domEl) ->

update: (output, domEl) ->
  date = @getDate()

  $(domEl).find('.hours').text(date.hours)
  $(domEl).find('.minutes').text(date.minutes)
  $(domEl).find('.seconds').text(date.seconds)
  $(domEl).find('.weekday').text(date.weekday)
  $(domEl).find('.day').text(date.day)
  $(domEl).find('.month').text(date.month)
  $(domEl).find('.month-num').text(@zeroFill(date.monthNum))
  $(domEl).find('.year-val').text(date.year)
  
  if clock12h
    $(domEl).find('.ampm').text(date.ampm)
    $(domEl).find('.ampm-container').show()

  # Calculate day progress
  totalSecondsInDay = 24 * 60 * 60
  currentSeconds = (date.hours * 3600) + (date.minutes * 60) + date.seconds
  dayProgress = ((currentSeconds / totalSecondsInDay)).toFixed(2) + '%'
  $(domEl).find('.procent').text(dayProgress)


zeroFill: (value) ->
  return ('0' + value).slice(-2)

getDate: () ->
  date = new Date()
  hour = date.getHours()
  ampm = ""
  
  if clock12h
    ampm = if hour >= 12 then "pm" else "am"
    hour = hour % 12
    hour = if hour == 0 then 12 else hour

  hours = @zeroFill(hour)
  minutes = @zeroFill(date.getMinutes())
  seconds = @zeroFill(date.getSeconds())
  weekday = @locale[@settings.lang].weekdays[date.getDay()]
  day = @zeroFill(date.getDate())
  month = @locale[@settings.lang].months[date.getMonth()]
  monthNum = date.getMonth() + 1
  year = date.getFullYear()

  return {
    hours: hours
    ampm: ampm
    minutes: minutes
    seconds: seconds
    weekday: weekday
    day: day
    month: month
    monthNum: monthNum
    year: year
  }