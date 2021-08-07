---
title: "TypesAndClasses"
date: 2021-08-05T23:04:20-04:00
tags: ["Powershell", "types", "scripts"]
draft: false
---

# Types and Classes in Powershell

When using Powershell's type literal syntax like `$([string]::IsNullOrWhiteSpace($var))`,
these are actually class methods.

`[string]` is the class, `::IsNullOrWhiteSpace()` is the method that returns a `[boolean]` value
of $true or $false.

## Base types in Powershell

When writing out a type literal in Powershell, there are certain types/classes that expand to _one_ word when tab-completing, as opposed to _4_ words which is the usual occurance.

Here are a few of these base types:

- `[string]`
- `[object]`
- `[type]`
- `[psobject]`
- `[hashtable]`
- `[type]`
- `[boolean]`
- `[bool]`
- `[psvariable]`

### Filesystem classes

Being a shell, using Powershell has a lot to do with altering and modifying the file system.
Here are a few of the most important classes and methods that you'll run into while dealing with file system objects.

- `[System.IO.Path]`
  Some methods include: `::GetTempFileName()`, `::GetRandomFileName()`

#### Note about Get-Item and Get-ChildItem

Setting the value of a variable to the output of Get-ChildItem will assign the _object_ to the variable, not just the _path_ string.
The path string may be gotten by getting the FullName property.

> Always use `Get-Member` if you are unsure about which methods you have access to.



## A Collection of Collection Classes

- `$x = [System.Collections.Generic.List[object]]::new()`
  Creates a list of whatever type you choose.

- `[System.Collections.Specialized.ListDictionary]::new()`
- `System.Collections.Specialized.HybridDictionary new()
System.Collections.Specialized.HybridDictionary new(int initialSize)
System.Collections.Specialized.HybridDictionary new(bool caseInsensitive)
System.Collections.Specialized.HybridDictionary new(int initialSize, bool caseInsensitive)`

-`[hashtable]::new()` or `[System.Collections.Hashtable]::new()`
  The default collection type/class for dictionary-like objects in **Powershell**

> Hashtables can also be instanciated by using this syntax:
> `$hashtable = @{}`
> Afterwards, you have access to the `add(key, value)`

`[hashtable]` can contain _any_ powershell object, including other hashtables, arrays, and lists/collections.

- `[System.Collections.ObjectModel.Collection[psobject]]::new()`

### Collection of Immutable Collections

Immutable collections are collections that cannot be changed once they've been created.

Most of them exist in the `System.Collections.Immutable` namespace.

- `[System.Collections.Immutable.ImmutableArray]::Create($env:Path.Split(';'))`
  This will create an array consisting of the entries in Path.

### Alternative ways of creating Collections

> Check Powershell's _about_hash_tables_ document for more info.

Some dictionary types are able to be initialized with a simpler syntax.

You can create an ordered dictionary by using this syntax:

```powershell
$ordered = [ordered]@{name = "carl"; Shape = "Square"; Color = "Blue"}
# Then use GetType() to see the resulting type
$ordered.GetType().Name # => OrderedDictionary
```