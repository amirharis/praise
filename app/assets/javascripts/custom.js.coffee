window.handleError = (entry, response) ->
  console.log entry
  console.log response
  if response.status == 422
    errors = $.parseJSON(response.responseText)
    formErrors = new Praise.Views.FormErrors(collection: errors)
    @$("#error_explanation").remove()
    console.log @$("form:visible:last > .modal-body")
    if @$("form:visible:last > .modal-body").length > 0
      @$("form:visible:last > .modal-body").prepend("<div id='error_explanation'></div>")
    else
      @$("form:visible:last").prepend("<div id='error_explanation'></div>")
      # @$("form:visible:last > .modal-body").prepend("<div id='error_explanation'></div>")
      @$("#error_explanation").html(formErrors.render().el)

window.sendAuthentication = (xhr) ->
    xhr.setRequestHeader "X-CSRF-Token", $("meta[name=\"csrf-token\"]").attr("content")

window.render_users_tmp = () ->
  $.ajax
    url: "/admin/users/render_users"
    async: false
    dataType: "html"

window.bind_ajaxStart = ->
  $("#modal_loading").ajaxStart ->
    $(this).show(); 
  .ajaxStop ->
    $(this).hide();

window.loadDt = ->
  $("#dt_a").dataTable
    sPaginationType: "bootstrap_alt"
    iDisplayLength: 5
    #sDom: '<"top"i>rt<"bottom"flp><"clear">'
    oLanguage:
      #sLengthMenu: "_MENU_"
      sLengthMenu: '<select>'+
        '<option value="5">5</option>'+
        '<option value="10">10</option>'+
        '<option value="20">20</option>'+
        '<option value="-1">Semua</option>'+
        '</select>'
      sSearch: "Cari: "
      sInfo: "Papar _START_ hingga _END_ dari _TOTAL_"
      sEmptyTable: "Tiada rekod"
      sInfoEmpty: "Tiada rekod"
      sZeroRecords: "Rekod tidak dijumpai"
      oPaginate:
        sNext: ""
        sLast: ""
        sFirst: ""
        sPrevious: ""


$ ->
  bind_ajaxStart()

  $("#selectall").click ->
    $(".case").attr "checked", @checked

  $(".case").click ->
    if $(".case").length is $(".case:checked").length
      $("#selectall").attr "checked", "checked"
    else
      $("#selectall").removeAttr "checked"

  $("#users th a, #users .user_pagination a").live "click", ->
    $.getScript @href
    false

  $("#users_search input").keyup ->
    $.get $("#users_search").attr("action"), $("#users_search").serialize(), null, "script"
    #alert $("#users_search input").val()
    false

  $(".show_user").click (e) ->
    e.preventDefault()
    MyApp = new Backbone.Router()
    MyApp.navigate "admin/users/" + $(this).attr("id"),
      trigger: true

  $('#users_table').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
  
  