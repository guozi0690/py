# lsci

*An LFE Wrapper Library for SciPy, NumPy, and matplotlib*

<img src="resources/images/WelcomeHomeElsie.jpg"/>


## Introduction

This project has the lofty goal of making numerical processing an efficient and
easy thing to do in LFE/Erlang. The engine behind this work is
[ErlPort](http://erlport.org/docs/python.html).

Right now, the following Python modules have been wrapped:

 * [math](https://docs.python.org/3/library/math.html)
 * [cmath](https://docs.python.org/3/library/cmath.html)

These also include some builtins and operators in each, provided for
convenience.

In the future, we plan on supporting as many of the following as possible:
 * [NumPy](http://www.numpy.org/)
 * [SciPy](http://www.scipy.org/scipylib/index.html)
 * [Pandas](http://pandas.pydata.org/)
 * [matplotlib](http://matplotlib.org/)
 * [SymPy](http://www.sympy.org/en/index.html)

And it's pronounced "Elsie".


## Requirements

To use lsci, you need the following:

* [lfetool](http://docs.lfe.io/quick-start/1.html)
* [Python 3](https://www.python.org/downloads/)


## Development

For the latest thoughts on interface, archiecture, etc., see the
[project Wiki](https://github.com/oubiwann/lsci/wiki).


## Installation

For now, just run it from a git clone:

```bash
$ git clone git@github.com:oubiwann/lsci.git
$ cd lsci
$ make
```


## Usage

Activate your Python virtualenv and then start up the LFE REPL:

```bash
$ . ./python/.venv/bin/activate
$ make repl-no-deps
```

Note that the ``repl`` and ``repl-no-deps`` targets automatically start up
the lsci (and thus ErlPort) Erlang Python server. If you run the REPL without
these ``make`` targets, you'll need to manually start things:

```bash
$ lfetool repl lfe -s lsci
```


### Basic Usage

Below we show some basic usage of lsci from both LFE and Erlang. In a
separate section a list of docs are linked showing detailed usage of wrapped
libraries.


#### LFE

Start up the LFE REPL:

```cl
Erlang/OTP 17 [erts-6.2] [source] [64-bit] [smp:4:4] [async-threads:10] ...

LFE Shell V6.2 (abort with ^G)
>
```

First things first: let's make sure that you have the appropriate versions
of things -- in particular, let's confirm that you're running Python 3:

```cl
> (lsci-util:get-versions)
(#(erlang "17")
 #(emulator "6.2")
 #(driver-version "3.1")
 #(lfe "0.9.0")
 #(lsci "0.0.1")
 #(python
   ("3.4.2 (v3.4.2:ab2c023a9432, Oct  5 2014, 20:42:22)"
    "[GCC 4.2.1 (Apple Inc. build 5666) (dot 3)]"))
 #(numpy "1.9.1"))
>
```

lsci provides a wrapper for the ErlPort ``(python:call pid ...)`` form:

```cl
> (lsci:py 'os 'getcwd)
"/Users/yourname/lab/erlang/lsci"
```

lsci can do this because it starts up a Python server and registers the pid
with a name.


#### Erlang

We can, of course, do the same thing from Erlang:

```bash
$ make shell-no-deps
```

```erlang
1> 'lsci-util':'get-versions'().
[{erlang,"17"},
 {emulator,"6.2"},
 {'driver-version',"3.1"},
 {lfe,"0.9.0"},
 {lsci,"0.0.1"},
 {python,["3.4.2 (v3.4.2:ab2c023a9432, Oct  5 2014, 20:42:22)",
          "[GCC 4.2.1 (Apple Inc. build 5666) (dot 3)]"]},
 {numpy,"1.9.1"}]
2> lsci:py(os, getcwd).
"/Users/oubiwann/Dropbox/lab/erlang/lsci"
```


### Wrapped Library Docs

More detailed usage information in separate docs, per-wrapped library:

* [lsci-math & lsci-cmath](doc/math.md) - ``math`` and ``cmath`` Python
  Standard library modules in LFE
* [lsci-np](doc/numpy.md) - NumPy in LFE
