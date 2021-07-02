$(document).ready(function(){
  $(‘#payment_client_id’).on(“change”, function(e) {
    var project_id = $(this).val();
    var url = “/manager/clients/” + project_id + “/projects”
    $.ajax ({
      type: ‘GET’,
      url: ‘url’,
      dataType: ‘json’,
      data: {project: e.target_id},
      success: function(data){
        debugger
      }
    })
  })
})
