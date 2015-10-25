Export Module
=============

#### The module’s only entry-point is the `Winlet` class

First, try defining an AMD module, eg for [RequireJS](http://requirejs.org/). 

    if ªF == typeof define and define.amd
      define -> Winlet

Next, try exporting for CommonJS, eg for [Node.js](http://goo.gl/Lf84YI):  
`var Winlet = require('winlet');`

    else if ªO == typeof module and module and module.exports
      module.exports = Winlet

Otherwise, add the `Winlet` class to global scope.  
Browser usage: `var winlet = new window.Winlet();`

    else ªG.Winlet = Winlet
    ;



