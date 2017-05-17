var username, password, $elementEdit;
$(function(){

    $("#btnRegister").addClass("disabled");
    
    //注册时发送数据到服务器
    $('#btnRegister').click(function () {
        var username = $('#registerUsername').val();
        var password = $('#registerPassword').val();
        if(username == ""){
            alert('用户名不能为空！');
            return;
        } if(password == ""){
            alert('密码不能为空！');
            return;
        }

        var usrInfo = {username: username, password: password};
        $.post('/api/users/newUser', usrInfo, function(data,status) {
            alert("注册成功！");
        });
    });

    //注册时验证用户名是否可用
    $("#registerUsername").keyup(function () {
        var username = $('#registerUsername').val();
        if(username.length == 0){
            $('#notExist').hide();
            $('#exist').hide();
            $("#btnRegister").addClass("disabled");
            return;
        }
        $.get('/api/users?username=' + username, function (data,status) {
            if(data.length > 0){
                $('#notExist').hide();
                $('#exist').show();
                $("#btnRegister").addClass("disabled");
            } else {
                $('#exist').hide();
                $('#notExist').show();
                $("#btnRegister").removeClass("disabled");
            }
        });
    });

    //点击注册按钮时，弹出遮罩层
    $('#aRegister').click(function(){
        $('#registerUsername').val("");
        $('#registerPassword').val("");
        $('#exist').hide();
        $('#notExist').hide();
    });

    //登录的验证
    $('#btnSignIn').click(function () {
        username = $('#signInUsername').val();
        password = $('#signInPassword').val();
        var usrInfo = {username: username, password: password};
        $.post('/api/users/userAuthentication', usrInfo, function(data, status){
            if(data.length > 0){
                $('#signInUsername').val("");
                $('#signInPassword').val("");
                $('#signInBlock').hide(600);
                $('#mytab').show(600);
                $('.tab-content').show();
                $('.tab-pane.fade').show(600);
                $('.dropdown-toggle').fadeIn(200);

                //登录后获得该用户的ToDoList列表
                $.get('/api/users/todolist?username=' + data[0].username, function(data, status){
                    for(var i in data){
                        var deadline = data[i].deadline;
                        var type = getType(deadline);

                        if(data[i].state == 'doing' && type == 'outDate') {
                            updateList(data[i], '#outDate');
                        } else if(data[i].state == 'doing') {
                            updateList(data[i], '#doingList');
                        } else if(data[i].state == 'done') {
                            updateList(data[i], '#doneList');
                        }
                    }
                    $('#doingList tbody tr').each(function () {
                        var deadline = $(this).children().first().next().text();
                        var type = getType(deadline);
                        $(this).addClass(type);
                    });

                    $('#doneList tbody tr').each(function () {
                        $(this).addClass('success');
                    });
                    $('.tab-pane').each(function(){
                        $(this).removeAttr('style');
                    });
                });
            } else{
                alert('登录失败，请检查用户名以及密码！');
            }
        });
    });

    //退出按钮
    $('#signout').click(function(){
        location.reload();
    });

});


