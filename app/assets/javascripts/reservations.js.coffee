# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
    $( "#nb_chambre" ).change ->
        console.log(this.value);

    type_vue = 0;
    type_chambre = 0;
    prix_total = 0;
    nb_chambre = 0;

    # $( "#type_chambre" ).change ->
    #     console.log(this.value);  
    #     $("#alert_form").fadeOut(); 
         
    #     if (this.value) is "Simple"
    #         $("#num_chambre").hide();
    #         type_chambre = 250;
    #     else if (this.value) is "Double"
    #         $("#num_chambre").hide();
    #         type_chambre = 500;
    #     else if (this.value) is "Executive"
    #         $("#num_chambre").hide();
    #         type_chambre = 750;
    #     else if (this.value) is "Presidentielle"
    #         $("#num_chambre").show();
    #         type_chambre = 1000;


    # $( "#type_vue" ).change ->
    #     console.log(this.value);
    #     $("#alert_form").fadeOut(); 

    #     if (this.value) is "Jungle"
    #         type_vue = 100; 

    #     else  if (this.value) is "Mer"
    #         type_vue = 200;


    $( "#nb_chambre" ).change ->
        console.log(this.value);
        $("#alert_form").fadeOut(); 
        nb_chambre = parseInt( this.value, 10 );
        prix_total = nb_chambre       
            # <%= render 'chambre' %>


    $(document).on "click", "#show_details", ->
        console.log(prix_total);
        if prix_total != 0
            prix_total = nb_chambre
            $("#reservation_show").fadeIn();
            # $("#price_reservation").val(prix_total);

            for i in [0...nb_chambre]
                $( ".num_ch" ).append("Chambre #" + (i+1))
                # $( ".render_chambre" ).raw("<% render 'chambre' %> <br />");


        
        else
            console.log("null");
            $("#alert_form").fadeIn();






        # i = parseInt( this.value, 10 );
        # for [0 ... i]
        #     console.log(i);
            # $( "#nb_chambre_drop" ).html("<%= select_tag('chambre_drop', options_for_select(@chambres.collect{ |u| [u.numero, u.type_chambre] }), { class: \"form-control\"}) %> ");