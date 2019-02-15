# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
    select_all_box = $ ".chambre_box"
    $(".chambre_box").first().addClass('activated')

    # type_chambre_select = $(".chambre_box.activated").children().eq(2).children().eq(2)
    type_chambre_select = $ ".type_chambre"
    type_vue_select = $ ".type_vue"
    # type_vue_select = $(".chambre_box.activated").children().eq(3).children().eq(2)
    numero_chambre = $(".chambre_box.activated").children().eq(4).children().eq(2)
    #numero_chambre = $("#num_chr");
    prix_par_chambre = $(".chambre_box.activated").children().eq(5).children().eq(2).children()

    changeClass = (element) ->
        $(".chambre_box").removeClass('activated')
        $(element).addClass('activated')
        

    $(document).on "click", $(".chambre_box"), ->
        console.log("ok")
        element = $(".chambre_box")

    (type_chambre_select).change ->
        type_vue_ajax = (type_vue_select).val()
        type_chambre_ajax = this.value

        console.log(type_vue_ajax, type_chambre_ajax)
        $.ajax({
            type:"GET",
            url:"/show_filtered_room",
            data: {type_chambre: type_chambre_ajax, type_vue: type_vue_ajax},
            dataType: 'json',
            success: (data) ->
                console.log (data)
                (numero_chambre).empty()
                (numero_chambre).append(new Option("Choississez la chambre", "None"))
                for i in [0...data.length]
                    (numero_chambre).append(new Option(data[i]["numero"], data[i]["numero"]))
                    if type_vue_ajax is "None"
                        (prix_par_chambre).html(parseFloat(data[i]["price"]) + " $")
                        $("#price_reservation_total").html(parseFloat(data[i]["price"]) + " $")
                    else if type_vue_ajax is "Jungle"
                        (prix_par_chambre).html(parseFloat(data[i]["price"]) + parseFloat(data[i]["vue_jungle_price"]) + " $")
                        $("#price_reservation_total").html(parseFloat(data[i]["price"]) + parseFloat(data[i]["vue_jungle_price"]) + " $")
                    else if type_vue_ajax is "Mer"
                        (prix_par_chambre).html(parseFloat(data[i]["price"]) + parseFloat(data[i]["vue_mer_price"]) + " $")
                        $("#price_reservation_total").html(parseFloat(data[i]["price"]) + parseFloat(data[i]["vue_mer_price"]) + " $")
                    
            ,
            error: (data) ->
                console.log("ERROR");
                console.log(data);
        });
        
    (type_vue_select).change ->
        type_chambre_ajax = (type_chambre_select).val()
        type_vue_ajax = this.value

        $.ajax({
            type:"GET",
            url:"/show_filtered_room",
            data: {type_chambre: type_chambre_ajax, type_vue: type_vue_ajax},
            dataType: 'json',
            success: (data) ->
                console.log (data)
                (numero_chambre).empty()
                (numero_chambre).append(new Option("Choississez la chambre", "None"))
                for i in [0...data.length]
                    (numero_chambre).append(new Option(data[i]["numero"], data[i]["numero"]))
                    if type_chambre_ajax is "None"
                        if type_vue_ajax is "Jungle"
                            (prix_par_chambre).html(parseFloat(data[i]["vue_jungle_price"]) + " $")
                            $("#price_reservation_total").html(parseFloat(data[i]["vue_jungle_price"]) + " $")
                        else if type_vue_ajax is "Mer"
                            (prix_par_chambre).html(parseFloat(data[i]["vue_mer_price"]) + " $")
                            $("#price_reservation_total").html(parseFloat(data[i]["vue_mer_price"]) + " $")
                    else
                        if type_vue_ajax is "Jungle"
                            (prix_par_chambre).html(parseFloat(data[i]["price"]) + parseFloat(data[i]["vue_jungle_price"]) + " $")
                            $("#price_reservation_total").html(parseFloat(data[i]["price"]) + parseFloat(data[i]["vue_jungle_price"]) + " $")
                        else if type_vue_ajax is "Mer"
                            (prix_par_chambre).html(parseFloat(data[i]["price"]) + parseFloat(data[i]["vue_mer_price"]) + " $")
                            $("#price_reservation_total").html(parseFloat(data[i]["price"]) + parseFloat(data[i]["vue_mer_price"]) + " $")
            ,
            error: (data) ->
                console.log("ERROR");
                console.log(data);
        });

    $("#show_details").click ->
        console.log("ok")
        type_chambre_select = $(".chambre_box.activated").children().eq(2).children().eq(2)
        type_vue_select = $(".chambre_box.activated").children().eq(3).children().eq(2)
        numero_chambre = $(".chambre_box.activated").children().eq(4).children().eq(2)
        prix_par_chambre = $(".chambre_box.activated").children().eq(5).children().eq(2).children()