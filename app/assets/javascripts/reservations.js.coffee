# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
    type_vue = []
    type_chambre = []
    prix_total = 0
    nb_chambre = 0
    c = 0

    selects_type_chambre = $ ".type_chambre"
    selects_type_vue = $ ".type_vue"
    prix_par_chambre = $ ".prix_chambre"

    $(document).on "click", ".show_details", ->
        c++
        select = $("#type_chambre")
        console.log select
        if select.attr("id") is "type_chambre" 
            select.attr("id", "type_chambre_" + c)
            console.log "ok"

    # for i in [0...selects_type_chambre.length + 1]
        # console.log(i)
        # console.log selects_type_chambre[i]
        # $( selects_type_chambre[i] ).change -> 
        #     selects_type_chambre = $ ".type_chambre"
        #     selects_type_vue = $ ".type_vue"
        #     prix_par_chambre = $ ".prix_chambre"  

        #     if (this.value) is "Simple"
        #         type_chambre[i] = 250
        #     else if (this.value) is "Double"
        #         type_chambre[i] = 500
        #     else if (this.value) is "Executive"
        #         type_chambre[i] = 750
        #     else if (this.value) is "Presidentielle"
        #         type_chambre[i] = 1000
        #     else
        #         type_chambre[i] = 0

        #     console.log type_chambre[i]
        #     console.log selects_type_chambre.length

        #     $(prix_par_chambre[c]).html(type_chambre[i] + type_vue[i])

        # $( selects_type_vue[i] ).change ->
        #     selects_type_chambre = $ ".type_chambre"
        #     selects_type_vue = $ ".type_vue"
        #     prix_par_chambre = $ ".prix_chambre"

        #     if (this.value) is "Jungle"
        #         type_vue[i] = 100 
        #     else if (this.value) is "Mer"
        #         type_vue[i] = 200
        #     else 
        #         type_vue[i] = 0

        #     console.log type_vue[i]

        #     $(prix_par_chambre[c]).html(type_chambre[i] + type_vue[i])

    

    # $( "#nb_chambre" ).change ->
    #     #console.log(this.value);
    #     $("#alert_form").fadeOut()
    #     nb_chambre = parseInt( this.value, 10 )
    #     prix_total = nb_chambre       
    #         # <%= render 'chambre' %>


    # $(document).on "click", ".show_details", ->
    #     #console.log(prix_total);
    #     if prix_total != 0
    #         prix_total = nb_chambre
    #         $("#reservation_show").fadeIn()

    #     else
    #         console.log("null");
    #         $("#alert_form").fadeIn();
