Node.HTMLElement
================

#### Simplified implementation of the DOM’s `HTMLElement` class

@todo describe


    class Node.HTMLElement extends Node
      C: 'Node.HTMLElement'
      toString: -> '[object Node.HTMLElement]'

      constructor: (@tagName) ->
        M = "/winlet/src/Node/Node.HTMLElement.litcoffee
          Node.HTML#{@tagName}Element()\n  "




Properties
----------


#### `childNodes <array>`
#### `firstChild and lastChild <Node|null>`
#### `parentNode <Node|null>`
#### `previousSibling and nextSibling <Node|null>`

        super()


#### `attributes <object>`
Xx. 

        @attributes = {}




Methods
-------


#### `appendChild()`
#### `insertBefore()`
#### `removeChild()`


#### `insertAdjacentHTML()`
- `position <enum>`  one of: beforebegin afterbegin beforeend afterend
- `text <object>`    the HTML to insert
- `<?>`              @todo what should it return?

Xx. 

      insertAdjacentHTML: (position, text) ->
        #@todo



#### `getAttribute()`
- `attributeName <string>`   the name of the attribute, eg 'id'
- `<string|null>`            the attribute value, or null if non-existant

Read the [MDN Article](https://goo.gl/imvRSq) for details. 

      getAttribute: (attributeName) ->
        value = @attributes[attributeName]
        if ªU == typeof value then null else value




#### `setAttribute()`
- `name <string>`   the name of the attribute, eg 'id'
- `value <string>`  the value of the attribute, eg 'my-element-53'
- `<undefined>`     does not return anything

Read the [MDN Article](https://goo.gl/k0DDqQ) for details. 

      setAttribute: (name, value) ->
        @attributes[name] = ''+value # coerce to string

        undefined


    ;
