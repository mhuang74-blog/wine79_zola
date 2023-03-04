# Writing Cubicle

## Process for writing new articles

* grab some wine names from `context/wine_todo_list.json` and combine with `context/prompt_templates.json` to create context file for a new batch of articles. Name it `YYYY-MM-DD-batch_of_N.json`.
* review the prompts
* generate content 

`$ RUST_BACKTRACE=1 RUST_LOG=teraw=info teraw context/2023-01-14_batch_of_10.json`

* manually edit content

* convert to Korean

`$ conda activate translate; translate -f context/2023-01-14_batch_of_10.content.json -s en -l ko -o context`

* generate Zola Markdown files

`RUST_BACKTRACE=1 RUST_LOG=tera=info teraw -o output -t templates/index.md --cat_sub  wine_style --title_sub wine_name context/2023-03-01_batch_of_10.content.ko.json 
`

* since already in right directory strucuture, just recursively copy content files to cellar

```
cp -Rp writing_cubicle/output/* content/cellar

```

* replace unicode characters

** eg, replace `&#39;` with `'`
