# shellines
Useful shell scripts


pytest with html
```
pytest --cov-report html --cov-report xml --cov-report annotate --cov=[module] --cov=[second_module] [source]
```

```
pytest --cov-report html --cov=[module] --cov=[second_module] [source]
```


zip no trash
```
zip -r httpserver.zip . -x ".*" -x "*/.*" -x "__MACOSX" -x "*/__pycache__/*" -x "*/__pycache__/" -x "*/*,cover"
```

```
zip -r httpserver.zip . -x ".*" -x "*/.*" -x "__MACOSX" -x "*/__pycache__/*" -x "*/__pycache__/" -x "__pycache__/*" -x "*/*,cover" -x "htmlcov/*" -x "htmlcov/" -x "venv/*" -x "venv/"
```

```
 zip -r httpserver.zip . -x ".*" -x "*/.*" -x "__MACOSX" -x "*/__pycache__/*" -x "*/__pycache__/" -x "__pycache__/*" -x "*/*,cover" -x "htmlcov/*" -x "htmlcov/" -x "venv/*" -x "venv/" -x "*.log"  
```

# webserver zip
```
zip -r httpserver.zip . -x ".*" -x "*/.*" -x "__MACOSX" -x "*/__pycache__/*" -x "*/__pycache__/" -x "__pycache__/*" -x "*/*,cover" -x "htmlcov/*" -x "htmlcov/" -x "venv/*" -x "venv/" -x "*.log" -x "*/chroma.jpg"
```
