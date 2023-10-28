
## Create grammar file handy tool

https://grammar.intrinsiclabs.ai/

## step-1 crate a type definition 

```
interface answer {
    id: number;
    name: string;
}
```

## step-2 click generate grammar file

```
root ::= answer
answer ::= "{"   ws   "\"id\":"   ws   number   ","   ws   "\"name\":"   ws   string   "}"
answerlist ::= "[]" | "["   ws   answer   (","   ws   answer)*   "]"
string ::= "\""   ([^"]*)   "\""
boolean ::= "true" | "false"
ws ::= [ \t\n]*
number ::= [0-9]+   "."?   [0-9]*
stringlist ::= "["   ws   "]" | "["   ws   string   (","   ws   string)*   ws   "]"
numberlist ::= "["   ws   "]" | "["   ws   string   (","   ws   number)*   ws   "]"
```

## step-3 run llm model with grammar file with llama.cpp
```
./main -m ./models/Mistral-7B-Instruct-v0.1-Q8.gguf -n 256 --grammar-file grammars/answer.gbnf -p 'Q: Name the planets in the solar system? A:'
```

## step-4. LLM response in json format
```
Response: Q: Name the planets in the solar system? A:{ "id": 1, "name": "Mercury"} [end of text]
```

<!-- 
#!cat restaurant_receipt.gbnf
# from llama_cpp import LlamaGrammar 
# receipt_rules=LlamaGrammar.from_file("restaurant_receipt.gbnf")
# tokens = llm.tokenize(b"give me a sample receipt")
# output=[]
# for token in llm.generate(tokens,grammar=receipt_rules):
#      output.append(llm.detokenize([token]))
# output
 -->