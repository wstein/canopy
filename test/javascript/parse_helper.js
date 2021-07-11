"use strict"

const jstest = require("jstest")

module.exports = new jstest.Module({
  assertParse(tuple, { elements: [_, actual] }) {
    this.assertParseInner(tuple, actual)
  },

  assertParseInner([text, offset, elements, labelled], actual) {
    this.assertEqual( text, actual.text )
    this.assertEqual( offset, actual.offset )

    if (elements) {
      this.assertEqual( elements.length, actual.elements.length )

      for (let [i, elem] of elements.entries())
        this.assertParseInner(elem, actual.elements[i])
    }

    if (labelled) {
      for (let key in labelled)
        this.assertParseInner(labelled[key], actual[key])
    }
  }
})
