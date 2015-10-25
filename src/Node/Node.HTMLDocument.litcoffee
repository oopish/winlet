Node.HTMLDocument
=================

#### Simplified implementation of the DOM’s `HTMLDocument` class

@todo describe


    class Node.HTMLDocument extends Node
      C: 'Node.HTMLDocument'
      toString: -> '[object Node.HTMLDocument]'

      constructor: (config={}) ->
        M = "/winlet/src/Node/Node.HTMLDocument.litcoffee
          Node.HTMLDocument()\n  "




Properties
----------


#### `childNodes <array>`                     - always `[DocumentType, <HTML>]`
#### `firstChild <Node>`                      - always `DocumentType`
#### `lastChild <Node>`                       - always `<HTML>`
#### `parentNode <null>`                      - always `null`
#### `previousSibling and nextSibling <null>` - always `null`

@todo `DocumentType` and `<HTML>`

        super()


#### `body <HTMLElement>`
Polyfill the `document.body` element. 

        @body = new Node.HTMLElement




Inherited Methods
-----------------


#### `appendChild()`
#### `insertBefore()`
#### `removeChild()`




Methods
-------


#### `createElement()`
- `tagName <string>`  the type of element to be made, eg 'blockquote' or 'h2'
- `<HTMLElement>`     reference to the newly created element

Read the [MDN Article](https://goo.gl/nGjkTI) for details. 

      createElement: (tagName) ->
        new Node.HTMLElement tagName




#### `createTextNode()`
- `data <string>`  the text of the new element
- `<HTMLElement>`  reference to the newly created element

Read the [MDN Article](https://goo.gl/KxNuqf) for details. 

      createTextNode: (data) ->
        new Node.Text data




#### `querySelector()`
- `selectors <string>`  a group of selectors to match on
- `<HTMLElement|null>`  reference to the first match, or `null` if not found

Read the [MDN Article](https://goo.gl/kCl3d7) for details. 

      querySelector: (selectors) ->
        if 'body' == selectors then return @body
        #@todo implement basic selector logic
        null




#### `querySelectorAll()`
- `selectors <string>`       a group of selectors to match on
- `<array of HTMLElements>`  a non-live list of element references

Read the [MDN Article](https://goo.gl/BH6U72) for details. 

      querySelectorAll: (selectors) ->
        if 'body' == selectors then return [@body]
        #@todo implement basic selector logic
        []


    ;
