el(Tag,Body) -->
     format_("<~w>",[Tag]),
     Body,
     format_("</~w>\n",[Tag]).

el(Tag,Opt,Body) -->
     format_("<~w",[Tag]),
     Opt,
     format_(" >",[]),
     Body,
     format_("</~w>\n",[Tag]).

=(A,S) -->
    format_(" ~a = \"",[A]),
    S,
    "\"".


div(Body) -->
    el(div,Body).
div(Opt,Body) -->
    el(div,Opt,Body).

header(Body) -->
    el(header,Body).
header(Opt,Body) -->
    el(header,Opt,Body).

button(Body) -->
    el(button,Body).
button(Opt,Body) -->
    el(button,Opt,Body).

h1(Body) -->
    el(h1,Body).
h1(Opt,Body) -->
    el(h1,Opt,Body).

h2(Body) -->
    el(h2,Body).
h2(Opt,Body) -->
    el(h2,Opt,Body).

h3(Body) -->
    el(h3,Body).
h3(Opt,Body) -->
    el(h3,Opt,Body).


p(Body) -->
    el(p,Body).
p(Opt,Body) -->
    el(p,Opt,Body).

html(Body) -->
    el(html,Body).
html(Opt,Body) -->
    el(html,Opt,Body).

head(Body) -->
    el(head,Body).
head(Opt,Body) -->
    el(head,Opt,Body).

body(Body) -->
    el(body,Body).
body(Opt,Body) -->
    el(body,Opt,Body).


a(Body) -->
    el(a,Body).
a(Opt,Body) -->
    el(a,Opt,Body).

strong(Body) -->
    el(strong,Body).
strong(Opt,Body) -->
    el(strong,Opt,Body).

script(Body) -->
    el(script,Body).
script(Opt,Body) -->
    el(script,Opt,Body).

title(Body) -->
    el(title,Body).
title(Opt,Body) -->
    el(title,Opt,Body).

table(Body) -->
    el(table,Body).
table(Opt,Body) -->
    el(table,Opt,Body).

thead(Body) -->
    el(thead,Body).
thead(Opt,Body) -->
    el(thead,Opt,Body).


tr(Body) -->
    el(tr,Body).
tr(Opt,Body) -->
    el(tr,Opt,Body).


th(Body) -->
    el(th,Body).
th(Opt,Body) -->
    el(th,Opt,Body).

td(Body) -->
    el(td,Body).
td(Opt,Body) -->
    el(td,Opt,Body).

i(Body) -->
    el(i,Body).
i(Opt,Body) -->
    el(i,Opt,Body).


form(Body) -->
    el(form,Body).
form(Opt,Body) -->
    el(form,Opt,Body).

label(Body) -->
    el(label,Body).
label(Opt,Body) -->
    el(label,Opt,Body).

span(Body) -->
    el(span,Body).
span(Opt,Body) -->
    el(span,Opt,Body).


b(Body) -->
    el(b,Body).
b(Opt,Body) -->
    el(b,Opt,Body).

em(Body) -->
    el(em,Body).
em(Opt,Body) -->
    el(em,Opt,Body).


input(Body) -->
    el(input,Body).
input(Opt,Body) -->
    el(input,Opt,Body).

option(Body) -->
    el(option,Body).
option(Opt,Body) -->
    el(option,Opt,Body).

img(Body) -->
    el(img,Body).
img(Opt,Body) -->
    el(img,Opt,Body).








