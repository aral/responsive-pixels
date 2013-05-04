# Simple test runner for DOM-style CSS unit tests.
#
# Copyright © 2013 Aral Balkan

numAssertions = 0
numPassedAssertions = 0
numFailedAssertions = 0

divs = document.getElementsByTagName('div')

for div in divs
	dataAssertString = div.getAttribute('data-assert')
	if dataAssertString
		assertions = dataAssertString.split(';')
		for assertion in assertions
			numAssertions++
			assertion = assertion.trim()
			assertionTokens = assertion.split(':')
			propertyName = assertionTokens[0].trim()
			propertyValue = assertionTokens[1].trim()
			computedStyle = window.getComputedStyle(div)
			computedPropertyValue = computedStyle.getPropertyValue(propertyName)

			if computedPropertyValue == propertyValue
				numPassedAssertions++
				div.style.backgroundColor = 'green'
			else
				numFailedAssertions++
				console.log propertyName + ' failed. Actual value = ' + computedPropertyValue
				div.style.backgroundColor = 'red'

			div.style.color = 'white'

