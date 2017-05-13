# chrome-pdf

convert adoc document to pdf using chrome headless mode.  

# how to use

build

``` bash
sudo ./build.sh
```

create convert source

``` bash
mkdir data
cd data
git clone https://github.com/asciidoctor/asciidoctor.org.git
cd ../
sudo ./run.sh
```

show result

``` bash
find ./data/output
```
