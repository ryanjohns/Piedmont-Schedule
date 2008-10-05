// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function show_display_row(case_id) {
  $('case-row-' + case_id + '-form').style.display = 'none';
  $('case-row-' + case_id).style.display = 'table-row';
}

function show_form_row(case_id) {
  $('case-row-' + case_id).style.display = 'none';
  $('case-row-' + case_id + '-form').style.display = 'table-row';
}
