# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
    $( "#nb_chambre" ).change ->
        console.log(this.value);

    $( "#type_chambre" ).change ->
        console.log(this.value);    
        if (this.value) is "Simple"
            $("#num_chambre").hide();
        else if (this.value) is "Double"
            $("#num_chambre").hide();
        else if (this.value) is "Executive"
            $("#num_chambre").hide();
        else if (this.value) is "Presidentielle"
            $("#num_chambre").show();






        # i = parseInt( this.value, 10 );
        # for [0 ... i]
        #     console.log(i);
            # $( "#nb_chambre_drop" ).html("<%= select_tag('chambre_drop', options_for_select(@chambres.collect{ |u| [u.numero, u.type_chambre] }), { class: \"form-control\"}) %> ");