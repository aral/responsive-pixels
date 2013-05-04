# Simple test runner for DOM-style CSS unit tests.
#
# Copyright © 2013 Aral Balkan

numAssertions = 0
numPassedAssertions = 0
numFailedAssertions = 0

# console.log document.styleSheets[0].cssRules[2]

divs = document.getElementsByTagName('div')

for div in divs
	dataAssertString = div.getAttribute('data-assert')
	if dataAssertString
		assertions = dataAssertString.split(';')
		for assertion in assertions
			assertion = assertion.trim()
			assertionTokens = assertion.split(':')

			# Allow for semi-colon at the end
			if assertionTokens.length != 2
				continue

			# Valid assertion, process it…
			numAssertions++
			propertyName = assertionTokens[0].trim()
			propertyValue = assertionTokens[1].trim()
			computedStyle = window.getComputedStyle(div)
			computedPropertyValue = computedStyle.getPropertyValue(propertyName)

			# console.log div.style

			if computedPropertyValue == propertyValue
				numPassedAssertions++
				div.style.backgroundColor = 'green'
			else
				numFailedAssertions++
				console.log 'Assertion failed: ' + propertyName + ' should have been ' + propertyValue + ' but was ' + computedPropertyValue + ' instead.'
				div.style.backgroundColor = 'red'

			div.style.color = 'white'

console.log(numAssertions + ' assertions tested. ' + numPassedAssertions + ' passed. ' + numFailedAssertions + ' failed.')

