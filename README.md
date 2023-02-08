# Decode
How would you decode  different types for the same key in JSON? 

let jsonString01 = 
`
"""
 {
  "title" : "09DRO0000006W0Q",
  "message" : "LightningWebComponent",
  "messageData" : [
    {
    "url" : "services/data/v51.0/quickActions/barcodeScanner",
    "label" : "services/data/v51.0/quickActions/barcodeScanner/describe"
    }
  ]
}
"""
`

let jsonString02 = 
`
"""
 {
  "title" : "09DRO0000006W0Q",
  "message" : "LightningWebComponent",
  "messageData" : ["label", "label2"]
}
"""
`

`jsonString01` has `messageData` key which is an array of objects and `jsonString02` contains `messageData` key which is an array of strings. Basic idea is to use emums. But interestingly it's more tricky than we think. 

I went through several iterations. See [GIST here](https://gist.github.com/gmbharath12/06bac99e1e41f89a15a3eda524678bbc)
