# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
    $("#type_chambre").change ->
        type_vue_ajax = $('#type_vue').val()
        type_chambre_ajax = this.value

        console.log(type_vue_ajax, type_chambre_ajax)
        $.ajax({
            type:"GET",
            url:"/show_filtered_room",
            data: {type_chambre: type_chambre_ajax, type_vue: type_vue_ajax},
            dataType: 'json',
            success: (data) ->
                console.log (data)
                $("#num_chr").empty()
                $("#num_chr").append(new Option("Choississez la chambre", "None"))
                for i in [0...data.length]
                    $("#num_chr").append(new Option(data[i]["numero"], data[i]["numero"]))
                    $("#price_reservation").html(parseFloat(data[i]["price"]) + parseFloat(data[i]["vue_jungle_price"]) + parseFloat(data[i]["vue_mer_price"]) + " $")
                # 1) Recuperer le dropdown des num  de chambre
                # 2) Le vider
                # 3) Le repeupler avec les chambres dans la variable data
            ,
            error: (data) ->
                console.log("ERROR");
                console.log(data);
        });
        
    $("#type_vue").change ->
        type_chambre_ajax = $('#type_chambre').val()
        type_vue_ajax = this.value

        $.ajax({
            type:"GET",
            url:"/show_filtered_room",
            data: {type_chambre: type_chambre_ajax, type_vue: type_vue_ajax},
            dataType: 'json',
            success: (data) ->
                console.log (data)
                $("#num_chr").empty()
                $("#num_chr").append(new Option("Choississez la chambre", "None"))
                for i in [0...data.length]
                    $("#num_chr").append(new Option(data[i]["numero"], data[i]["numero"]))
                    $("#price_reservation").html(parseFloat(data[i]["price"]) + parseFloat(data[i]["vue_jungle_price"]) + parseFloat(data[i]["vue_mer_price"]) + " $")
               
                # 1) Recuperer le dropdown des num  de chambre
                # 2) Le vider
                # 3) Le repeupler avec les chambres dans la variable data
            ,
            error: (data) ->
                console.log("ERROR");
                console.log(data);
        });

    # $("#type_chambre").change -> 
    #     type_chambre_ajax = $('#type_chambre').val()
    #     type_vue_ajax = this.value

    #     $.ajax({
    #         type:"GET",
    #         url:"/show_filtered_room",
    #         data: {type_chambre: type_chambre_ajax, type_vue: type_vue_ajax},
    #         dataType: 'json',
    #         success: (data) ->
    #             for i in [0...data.length]
    #                 $("#num_chr").append(new Option(data[i]["numero"], data[i]["numero"]))
    #         ,
    #         error: (data) ->
    #             console.log("ERROR");
    #             console.log(data);
    #     });



















    # selects_type_chambre = $ ".type_chambre"
    # selects_type_vue = $ ".type_vue"

    #  $("#type_chambre2").change ->
    #     console.log ("chambre")
    #     if (this.value) is "Simple"
    #         type_chambre = 250
    #         console.log "ok"
    #     else if (this.value) is "Double"
    #         type_chambre = 500
    #     else if (this.value) is "Executive"
    #         type_chambre = 750
    #     else if (this.value) is "Presidentielle"
    #         type_chambre = 1000
    #     else
    #         type_chambre = 0

    #     $("#price_reservation").html(type_chambre + type_vue)
    #     $("#price_reservation_total").html()
        

    # $("#type_vue2").change ->
    #     console.log ("vue")
    #     if (this.value) is "Jungle"
    #         type_vue = 100 
    #     else if (this.value) is "Mer"
    #         type_vue = 200
    #     else 
    #         type_vue = 0


    #     $("#price_reservation").html(type_chambre + type_vue)
    #     $("#price_reservation_total").html()
