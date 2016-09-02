$(document).on('ready', function() {

  $("#apartment_listing_country").chosen();
  $("#checkin-date, #checkout-date").datepicker({
    defaultDate: "+1w",
    changeMonth: true,
    numberOfMonths: 2,
    minDate: new Date(),
    onSelect: function(selectedDate) {
      var option = this.id == "from" ? "minDate" : "maxDate",
      instance = $(this).data("datepicker"),
      date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
      dates.not(this).datepicker("option", option, date);
    }
  });

  return CountryStateSelect({
    chosen_ui: true,
    chosen_options: {
      disable_search_threshold: 10,
      width: '95%'
    },
    country_id: "apartment_listing_country",
    state_id: ""
  });
});
