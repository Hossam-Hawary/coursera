/**
 * Created by hossam on 30/04/16.
 */
$(function () {
    $("#like_but").on("click",like_lec)
    function like_lec() {
        var lec_id=$("#lec_id").val();
        $.ajax({
            url: "http://localhost:3000/lectures/"+lec_id+"/like_lec",
            success: function(resp){
                $("#likes").text(resp['likes']+" Likes");
                $("#dislikes").text(resp['dislikes']+" Disikes");
            },
            error: function(){
                alert("Somthing wrong with this request.");
            }
        });
    }
    $("#dislike_but").on("click",dislike_lec)
    function dislike_lec() {
        var lec_id=$("#lec_id").val();
        $.ajax({
            url: "http://localhost:3000/lectures/"+lec_id+"/dislike_lec",
            success: function(resp){
                $("#likes").text(resp['likes']+" Likes");
                $("#dislikes").text(resp['dislikes']+" Disikes");
           },
            error: function(){
                alert("Somthing wrong with this request.");
            }
        });
    }
    $("#spam_but").on("click",spam_lec)
    function spam_lec() {
        var lec_id=$("#lec_id").val();
        $.ajax({
            url: "http://localhost:3000/lectures/"+lec_id+"/spam_lec",
            success: function(resp){
                $("#spams").text(resp['spam']+" Spam");
                if (resp['removed?']){
                    alert("this Lecture has been removed")
                    window.location="http://localhost:3000/lectures"
                }
            },
            error: function(){
                alert("Somthing wrong with this request.");
            }
        });
    }
});
