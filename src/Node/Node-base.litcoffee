Node
====

#### Simplified combination of the DOM’s `EventTarget` and `Node` classes

@todo EventTarget methods  
@todo describe


    class Node
      C: 'Node'
      toString: -> '[object Node]'

      constructor: (config={}) ->
        M = "/winlet/src/Node/Node-base.litcoffee
          Node()\n  "




Properties
----------


#### `childNodes <array>`
Xx. 

        @childNodes = []


#### `firstChild and lastChild <Node|null>`
Xx. 

        @firstChild = null
        @lastChild  = null


#### `parentNode <Node|null>`
Xx. 

        @parentNode = null


#### `previousSibling and nextSibling <Node|null>`
Xx. 

        @previousSibling = null
        @nextSibling     = null




Methods
-------


#### `appendChild()`
- `aChild <Node>`  the Node to append
- `<Node>`         the appended Node

Read the [MDN Article](https://goo.gl/e4S15a) for details. 

      appendChild: (aChild) ->
        M = "/winlet/src/Node/Node-base.litcoffee
          Node.appendChild()\n  "
        if ! (aChild instanceof Node) then throw TypeError "
          #{M}`achild` does not inherit from `Node`"

Move `aChild` from its previous parent. 

        aChild.parentNode?.removeChild aChild
        aChild.parentNode = @

Add `aChild` to the end of `childNodes`, and update all cross-references. 

        length = @childNodes.push aChild
        @firstChild = @childNodes[0]
        @lastChild  = aChild
        aChild.nextSibling = null
        if 1 == length
          aChild.previousSibling = null
        else
          aChild.previousSibling = @childNodes[length-2]
          aChild.previousSibling.nextSibling = aChild

`appendChild()` returns the appended Node. 

        return aChild




#### `insertBefore()`
- `newNode <Node>`        the Node to insert
- `referenceNode <Node>`  he node before which `newNode` is inserted
- `<Node>`                the inserted Node

Read the [MDN Article](https://goo.gl/LlMIQN) for details. 

      insertBefore: (newNode, referenceNode) ->
        M = "/winlet/src/Node/Node-base.litcoffee
          Node.insertBefore()\n  "
        if ! (newNode instanceof Node) then throw TypeError "
          #{M}`newNode` does not inherit from `Node`"
        if ! (referenceNode instanceof Node) then throw TypeError "
          #{M}`referenceNode` does not inherit from `Node`"

Get the index of `referenceNode`. 

        i = @childNodes.indexOf referenceNode
        if -1 == i then throw RangeError "
          #{M}`referenceNode` not found in `childNodes`"

Insert `newNode` before `referenceNode`, and update all cross-references. 

        @childNodes.splice i, 0, newNode
        @firstChild = @childNodes[0]
        @lastChild  = @childNodes[length-1]
        newNode.nextSibling = referenceNode
        if 0 == i
          newNode.previousSibling = null
        else
          newNode.previousSibling = referenceNode.previousSibling
          referenceNode.previousSibling.nextSibling = newNode
        referenceNode.previousSibling = newNode

Move `newNode` from its previous parent. We have finished using `i`, so it’s 
now ok if `insertBefore()` is being used to move a Node’s sibling-position.  
@todo test `insertBefore()` itself, eg `insertBefore(myNode, myNode)`

        newNode.parentNode?.removeChild newNode
        newNode.parentNode = @

`insertBefore()` returns the inserted Node. 

        return newNode




#### `removeChild()`
- `child <Node>`  the Node to remove
- `<Node>`        the removed Node

Read the [MDN Article](https://goo.gl/bsDM9b) for details. 

      removeChild: (child) ->
        M = "/winlet/src/Node/Node-base.litcoffee
          Node.removeChild()\n  "
        if ! (child instanceof Node) then throw TypeError "
          #{M}`child` does not inherit from `Node`"

Get the index of `child`. 

        i = @childNodes.indexOf child
        if -1 == i then throw RangeError "
          #{M}`child` not found in `childNodes`"

Remove `child`, and update all cross-references. 

        @childNodes.splice i, 1
        @firstChild = @childNodes[0]
        @lastChild  = @childNodes[length-1]
        child.previousSibling?.nextSibling = child.nextSibling
        child.nextSibling?.previousSibling = child.previousSibling

`child` may still be referenced elsewhere in the app, so update its properties. 

        child.parentNode      = null
        child.previousSibling = null
        child.nextSibling     = null
        return child


    ;

