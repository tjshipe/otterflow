$(document).ready(function () {
    $('#user_questions').removeClass('tab');

    $('ul.tabs li').on('click', 'a', function(e){
        e.preventDefault();
        changeActiveTab(this);
        changeTabContent(this);
    });

    function changeActiveTab(clicked_object) {
        $('ul.tabs li').removeClass('active');
        $(clicked_object).parent().addClass('active');
    }

    function changeTabContent(clicked_object) {
        $('.user_content').children('div').addClass('tab');
        var tabID = $(clicked_object).attr('href');
        $(tabID).removeClass('tab');
    }
});