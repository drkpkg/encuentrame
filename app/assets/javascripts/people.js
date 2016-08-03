$(document).ready(function(){
    $("a.info-link").click(function(){
        $("#message").modal('show');
    });

    $(".country-select").on('change',function(){
        var country = $(this).val();
        $(".state-select").attr('disabled',false).empty();
        $.ajax({
            url: API+'states',
            data:{country: country},
            type: 'GET',
            statusCode: {
                200: function(data){
                    $(".state-select").append('<option selected></option>');
                    $.each(data,function(key,value){
                        $(".state-select").append('<option value="'+ key +'">'+ value +'</option>');
                    });
                },
                400: function(){
                    console.log('Error with the server');
                }
            }
        });
    });

    $(".state-select").on('change',function(){
        var state = $(this).val();
        var country = $(".country-select").val();
        $(".city-select").attr('disabled',false).empty();
        $.ajax({
            url: API+'cities',
            data:{state: state,country: country},
            type: 'GET',
            statusCode: {
                200: function(data){
                    $(".city-select").append('<option selected></option>');
                    $.each(data,function(key,value){
                        $(".city-select").append('<option value="'+ key +'">'+ value +'</option>');
                    });
                },
                400: function(){
                    console.log('Error with the server');
                }
            }
        });

    });
});
