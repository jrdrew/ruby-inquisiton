//var dialogTagFunction = function() {
//    $("#dialogDeleteTag").dialog({
//        autoOpen: false,
//        modal: true
//    })
//};
//
//$(document).ready(dialogTagFunction);
//
//$(".deleteTag").click(function(event) {
//    event.preventDefault();
//    var parentListItemNode = $(this).parent("li")
//    var targetUrl = $(this).attr("value");
//
//    $("#dialogDeleteTag").dialog({
//        buttons : {
//            "Confirm" : function() {
//                var f = document.createElement('form');
//                $(this).after($(f).attr({
//                    method: 'POST',
//                    action: targetUrl
//                }).append('<input type="hidden" name="_method" value="DELETE" />'));
//                $(f).submit();
//                $(this).dialog("close");
//                parentListItemNode.remove()
//            },
//            "Cancel" : function() {
//                $(this).dialog("close");
//            }
//        }
//    });
//    $("#dialogDeleteTag").dialog("open");
//});

$(document).ready(function() {
    $("#tags").tagit({ tagSource: function(search, showChoices) {
        $.ajax({
            'url' : "/questions/tags/" + search.term,
            'dataType' : 'json',
            'async' : false,
            'success' : function (m) {
            	showChoices(m.tags);
            }
        });
    }
    });
});
//
//$(document).ready(function() {
//    $("#tagQuery").keydown(function(event) {
//        if (event.keyCode == 13) {
//            $("questionAddTagForm").submit();
//        }
//    });
//});