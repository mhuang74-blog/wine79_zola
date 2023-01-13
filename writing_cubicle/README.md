# Writing Cubicle

## Process for writing new articles

* grab some wine names from `context/wine_todo_list.json` and combine with `context/prompt_templates.json` to create context file for a new batch of articles. Name it `YYYY-MM-DD-batch_of_N.json`.
* review the prompts
* generate content 

`$ RUST_LOG=teraw=info teraw context/2023-01-14_batch_of_10.json`

* manually edit content

* convert to Korean

`$ translate -f context/2023-01-14_batch_of_10.content.json -s en -l ko -o context`

* generate Zola Markdown files

`$ teraw context/2023-01-14_batch_of_10.content.ko.json -t templates/index.md -d wine_name -o output`

* move content files to appropriate Wine Style sections

```
$ cd output
$ rg -l 적포도주 | sed 's/\/.*//g;' | xargs -n 1 -I {} mv {} ../../content/cellar/적포도주
$ rg -l 백포도주 | sed 's/\/.*//g;' | xargs -n 1 -I {} mv {} ../../content/cellar/백포도주
$ rg -l 스파클링 | sed 's/\/.*//g;' | xargs -n 1 -I {} mv {} ../../content/cellar/스파클링
$ rg -l 디저트_와인 | sed 's/\/.*//g;' | xargs -n 1 -I {} mv {} ../../content/cellar/디저트_와인

```

* replace unicode characters

** eg, replace `&#39;` with `'`