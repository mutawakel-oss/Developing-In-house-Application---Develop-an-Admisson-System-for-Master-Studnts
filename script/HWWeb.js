// AJAX MDI Sample Script File

var DefaultClassObject = {
    create: function() {
        return function() {
            this.initialize.apply(this, arguments);
        }
    }
}

// Object utility to create and manipulate the Windows
var HWWeb = DefaultClassObject.create();

HWWeb.prototype = {
    
    themeName : "mac_os_x",
    width : 400,
    height : 200,
    top : 0,
    left : 0,
    winObj : null,
    winID : "",
    title : "",
    url : "http://about:blank/",
    

    // Constructor
    initialize: function(id) {
        this.winID = id;
    },

    // Destructor
    /*
    destroy: function() {
        
    },
    */
    
    showWindow : function (oArg) {
        this.width = oArg.width || this.width;
        this.height = oArg.height || this.height;
        this.left = oArg.left || this.left;
        this.top = oArg.top || this.top;
        this.themeName = oArg.themeName || this.themeName;
        this.title = oArg.title || this.title;
        this.url = oArg.url || this.url;
        
        
	    this.winObj = new Window(this.winID, {className: this.themeName, title:  this.title, 
								  top:this.top, left:this.left, width:this.width, height:this.height, 
								  closable: true, url: this.url, hideEffectOptions: {duration:1}, showEffectOptions: {duration:1}});
	    
	    this.winObj.setDestroyOnClose();
	    
	    this.winObj.show();          
    },
    
    showDialog : function (oArg) {
        this.width = oArg.width || this.width;
        this.height = oArg.height || this.height;
        this.left = oArg.left || this.left;
        this.top = oArg.top || this.top;
        this.themeName = oArg.theme || this.themeName;
        this.title = oArg.title || this.title;
        this.url = oArg.url || this.url;
        
        
	    this.winObj = new Window(this.winID, {className: this.themeName, title:  this.title, 
								  top:this.top, right:this.left, width:this.width, height:this.height, 
								  resizable: true, url: this.url});
	    
	    this.winObj.setDestroyOnClose();
	    		
	    this.winObj.show(true);        
    }, 
    
    findWindow : function (id) {
        return (Windows.getWindow(id));
        
    },
    
    findWindowFrom : function (id, from) {
        return (from.Windows.getWindow(id));
        
    }    
    ,
    toFront : function () {
       this.winObj.toFront();
    }
  

}

// Check if a window exist
function isWinExist(id) {
    var exist = false;
    var win = Windows.getWindow(id);
    // Asks delegate if exists
    if (win && win.visible) {
        exist = true;
    }

    return(exist);        
}

// Close all Windows
function closeAllWindows() {
    Windows.closeAll();  
}


// Close all modals Windows
function closeAllModalWindows() {
    Windows.closeAllModalWindows();
}
        
// Tile all Windows
function tileAllWindows(xRatio, yRation) {
    var x = xRatio;
    var y = yRation;

    Windows.windows.each( function(w) {
        if (w.getId != null) {
            w.setLocation(x,y);
            w.toFront();
            x += xRatio;
            y += yRation;
        }
    });
}
