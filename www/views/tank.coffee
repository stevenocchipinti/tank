jQuery ->
  $(".action").click ->
    $.ajax '/'
      type: 'POST'
      data: "action=#{this.title}&duration=#{$('#duration').val()}"
