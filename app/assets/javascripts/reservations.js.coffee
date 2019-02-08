# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
    type_chambre = 0
    type_vue = 0
    c = 1

    select_type_chambre = $("#type_chambre")
    select_type_vue = $("#type_vue")
    select_prix = $("#price_reservation")

    selects_prix_par_chambre = $ ".prix_chambre"

    $(document).on "click", ".show_details", ->
        c++
        console.log "#type_chambre" + c
        if select_type_chambre.attr("id") is "type_chambre" 
            console.log "change"
            select_type_chambre.attr("id", "type_chambre" + c)
            select_type_vue.attr("id", "type_vue" + c)
            select_prix.attr("id", "price_reservation" + c)

    calcul_prix_total = () ->
        for i in [0...selects_prix_par_chambre.length]
            console.log $(selects_prix_par_chambre[i]).text()
            $("#price_reservation_total").html(selects_prix_par_chambre[i])

    calcul_type_chambre = (select, price) -> 
        if (select) is "Simple"
            type_chambre = 250
            console.log "ok"
        else if (select) is "Double"
            type_chambre = 500
        else if (select) is "Executive"
            type_chambre = 750
        else if (select) is "Presidentielle"
            type_chambre = 1000
        else
            type_chambre = 0
        
        price.html(type_chambre + type_vue)
        # calcul_prix_total()    
        # $("#price_reservation_total").html() 

        return {select, price, type_chambre}

    calcul_type_vue = (select, price) ->       
        if (select) is "Jungle"
            type_vue = 100 
        else if (select) is "Mer"
            type_vue = 200
        else 
            type_vue = 0

        price.html(type_chambre + type_vue)
        # $("#price_reservation_total").html()
        return {select, price, type_vue}
 
    $("#type_chambre").change ->
        console.log ("0")
        calcul_type_chambre(this.value, $("#price_reservation"))

    $("#type_vue").change ->
        calcul_type_vue(this.value, $("#price_reservation"))
   
    $("#type_chambre1").change ->
        console.log ("1")
        calcul_type_chambre(this.value, $("#price_reservation1"))

    $("#type_vue1").change ->
        calcul_type_vue(this.value, $("#price_reservation1"))

    $("#type_chambre2").change ->
        console.log ("2")
        calcul_type_chambre(this.value, $("#price_reservation2"))

    $("#type_vue2").change ->
        calcul_type_vue(this.value, $("#price_reservation2"))

    $("#type_chambre3").change ->
        console.log ("3")
        calcul_type_chambre(this.value, $("#price_reservation3"))

    $("#type_vue3").change ->
        calcul_type_vue(this.value, $("#price_reservation3"))























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
