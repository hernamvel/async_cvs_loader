// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require twitter/bootstrap
//= require_tree .

var dd;

function fill_results(data) {
  $("#results_zone").show();
  $("#results_table").empty();
  for(i=0; i < data.success_rows.length; i++) {
    html_string = '<tr>';
    html_string = html_string + `<td>${data.success_rows[i].identifier}</td>`;
    html_string = html_string + `<td>${data.success_rows[i].email}</td>`;
    html_string = html_string + `<td>${data.success_rows[i].first}</td>`;
    html_string = html_string + `<td>${data.success_rows[i].last}</td>`;
    html_string = html_string + `<td>${data.success_rows[i].phone}</td>`;
    html_string = html_string + `<td>Sucessfuly processed</td>`;
    html_string = html_string + '</tr>';
    $('#results_table').append(html_string);
  }
  dd = data;
  console.log(data.error_rows.length)
  for(i=0; i < data.error_rows.length; i++) {
    errors = data.error_rows[i].errors.join('<br>');
    html_string = '<tr>';
    html_string = html_string + `<td>${data.error_rows[i].identifier}</td>`;
    html_string = html_string + `<td>${data.error_rows[i].email}</td>`;
    html_string = html_string + `<td>${data.error_rows[i].first}</td>`;
    html_string = html_string + `<td>${data.error_rows[i].last}</td>`;
    html_string = html_string + `<td>${data.error_rows[i].phone}</td>`;
    html_string = html_string + `<td>${errors}</td>`;
    html_string = html_string + '</tr>';
    $('#results_table').append(html_string);
  }
}

