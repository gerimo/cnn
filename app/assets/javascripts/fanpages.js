 $(function(){
        $(".to").datepicker({ dateFormat: 'dd-mm-yy' });
        $(".from").datepicker({ dateFormat: 'dd-mm-yy' }).bind("change",function(){
            var minValue = $(this).val();
            minValue = $.datepicker.parseDate("dd-mm-yy", minValue);
            minValue.setDate(minValue.getDate()+1);
            $(".to").datepicker( "option", "minDate", minValue );
        })
    });

 