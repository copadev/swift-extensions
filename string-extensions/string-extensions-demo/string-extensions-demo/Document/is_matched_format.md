## Declaration: 
> func isMatchedFormat(withRegex pattern: String) -> Bool


## Description: 
> Check if the given string is matched the Regex pattern or not.


#### Usage Example: 
`````
let pattern: String = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[-_+$!#%]).{5,32}"
let string: String = "Aa1234-"
print(string.isMatchedFormat(withRegex: pattern)) // true
`````

## Parameters: 
> pattern: regular expression rules.


## Returns: 
> The satisfied of a given string with the Regex pattern as a bool value.


## Images
![Puppeteer](https://octodex.github.com/images/puppeteer.png)


## GitHub Repo:
https://github.com/duonghominhhuy/swift-extensions



