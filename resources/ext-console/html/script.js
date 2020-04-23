var debug = true;
var fullDebug = false;

var cont = document.getElementById("cont");
var container = document.getElementById("container");
if (debug == false) {$(cont).fadeOut(1);}
else {$(cont).fadeIn(1);}

var titlebar = document.getElementById("title-bar");
var txtContainer = document.getElementById("txt-container");
var cmdContainer;
var cmdText;

var x,y;
var offX,offY;

var dragging = false;
var shifting = true;

window.onmousedown = function(event) {
  console.log(event.target.id);
  if (event.target.id == "title-bar" || event.target.id == "title-bar-text") {
    dragging = container;
    x = event.x
    y = event.y    

    offX = false;
    offY = false;
  } else {
    shifting = false;
  }
}

window.onmousemove = function(event) {
  if (dragging) {
    if (offX == false) {
      offX = getOffset(container).left - event.x;
      offY = getOffset(container).top  - event.y;
    }
    dragging.style.left  = event.x + offX;
    dragging.style.top   = event.y + offY;
  }
  titlebar.style.width = parseInt(container.style.width)-2;
  CheckPositon()
}

window.onmouseup = function(event) {
  if (dragging) {
    dragging = false;
    var _x = event.x;
    var _y = event.y;
  }
  if (!shifting) {
    shifting = true;
  }
}

window.addEventListener('message', function(event) {
  console.log(event.data.type);
  if (event.data.type == "open") {
    OpenUI();
  } else if (event.data.type == "close") {
    FadeOut();
  } else if (event.data.type == "message") {
    PopMessage(event.data.resource,event.data.message,event.data.color,event.data.extras);
  } else if (event.data.type == "setAlpha") {
    SetAlpha(event.data.alpha);
  }
})

SetAlpha = function(a) {
  cont.style.opacity = (a || 0.1)
}

function OpenUI() {
  FadeIn();
  if (!cmdContainer) {
    setTimeout(function() {
      OpenCommandLine();
      CheckPositon();
    },100);
  }
}

document.onkeydown = function (data) {
  if (data.which == 13) { // enter key
    data.preventDefault();
    if (cmdText) {
      if (cmdText.value && cmdText.value.length > 0) {
        var n = cmdText.value.indexOf('stop')
        if (n != -1 || n >= 0) {
          $.post('http://ext-console/stop', JSON.stringify({"str":cmdText.value.toString() }));
        } else {
          $.post('http://ext-console/posted', JSON.stringify({"str":cmdText.value.toString() }));
        }
      }
    }
  } else if (data.which == 118) { // Escape key
    FadeOut();
    $.post('http://ext-console/unfocus', JSON.stringify({}));    
  } else if (data.which == 116) {
    $.post('http://ext-console/unfocus', JSON.stringify({}));    
  }
};

function getOffset(el) {
  const rect = el.getBoundingClientRect();
  return {
    left: rect.left + window.scrollX,
    top: rect.top + window.scrollY
  };
}

function PopMessage(res,msg,col,extras) {
  col = (col ? col : "white")
  txtContainer.innerHTML = txtContainer.innerHTML + "[" + res.fontcolor("gray") + "] > " + msg.replace(/\s/g, '&nbsp;').fontcolor(col);
  if (extras) {
    var tick = parseInt(0);
    for (var key in extras) {
      var val = extras[key];
      txtContainer.innerHTML = txtContainer.innerHTML + key.replace(/\s/g, '&nbsp;').fontcolor("yellow") + " : " + val.fontcolor("red");
    }
  }
  txtContainer.innerHTML = txtContainer.innerHTML + "<br>";
  if (shifting == true) {
    txtContainer.scrollTop = txtContainer.scrollHeight;
    txtContainer.animate({scrollTop: txtContainer.scrollHeight});
  };
}

function FadeOut() {
  $(cont).fadeOut(100);
  $.post('http://ext-console/closed', JSON.stringify({}));
}

function FadeIn() {
  $(cont).fadeIn(100);
}

function OpenCommandLine() {
  eleC = document.createElement('form');
  eleC.classList = "cmd-container";

  eleT = document.createElement('input');
  eleT.classList = "cmd-text";
  eleC.appendChild(eleT);

  cmdContainer = eleC
  cmdText = eleT

  cont.appendChild(cmdContainer);
  CheckPositon();
}

function CheckPositon() {
  if (cmdContainer) {
    var left = container.style.left;
    var top = container.style.top;
    var width = container.style.width;
    if (!left || left == "" || left == null) {
      left = $(container)[0].offsetLeft;
      top = $(container)[0].offsetTop;
      width = $(container)[0].offsetWidth-2;
    }

    cmdContainer.style.left = left;
    cmdContainer.style.top = top;
    cmdContainer.style.width = width;
  }
}


// Debug/test stuff

if (debug == true && fullDebug == true) {
  setTimeout(function() {
    for (var i=1;i<100;i++) {
      setTimeout(function() {
        var r = Math.random()*10
        if (r > 7) {
          PopMessage("Console","Error message here","red")
        } else if (r > 3) {
          PopMessage("Console","Positive message here","green")      
        } else {
          PopMessage("Console","Normal message here. Just gonna make this a super long message to text how the text wraps, and so on...")          
        }
      },1 * i)  
    }
    for (var i=1;i<100;i++) {
      setTimeout(function() {
        var r = Math.random()*10
        if (r > 7) {
          PopMessage("Console","Error message here","red")
        } else if (r > 3) {
          PopMessage("Console","Positive message here","green")      
        } else {
          PopMessage("Console","Normal message here. Just gonna make this a super long message to text how the text wraps, and so on...")          
        }
      },500 * i)  
    }
  },1500)
}

$(cont).fadeOut(1);