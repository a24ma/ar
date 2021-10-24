#!/usr/bin/env pwsh

$mdpath_list = @(ls ./etc_rrb/*.md)
foreach ($path in $mdpath_list) {
    $outpath = $path -replace "etc_rrb","etc_rrb_html" -replace ".md",".html"
    $cssUri = "./markdown.css"
    ConvertTo-Html `
        -Body (ConvertFrom-Markdown -Path $path).Html `
        -CssUri $cssUri | `
        Out-File -Filepath $outpath
}

