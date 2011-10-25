jQuery ->
  $(".action").click ->
    $("#action").val(this.title)
    $("#actionform").submit()
