
presentation -->
    {title(T),
     author(A),
     date(D),
     theme(Theme),
     transition(Transition)},
    "<!DOCTYPE html>\n",
    el(html,
       (
  	   el(head,
  	      (
  		  el(title,T),
  		  "<link rel=\"stylesheet\" href=\"https://unpkg.com/reveal.js/dist/reveal.css\">",
  		  "<link rel=\"stylesheet\" href=\"https://unpkg.com/reveal.js/dist/theme/",Theme,".css\">",

"<link rel=\"stylesheet\" href=\"grids.css\"/>\n",
"<!-- If the query includes 'print-pdf', include the PDF print sheet -->\n",
"<script>\n",
"    if( window.location.search.match( /print-pdf/gi ) ) {\n",
"        var link = document.createElement( 'link' );\n",
"        link.rel = 'stylesheet';\n",
"        link.type = 'text/css';\n",
"        link.href = 'https://cdn.jsdelivr.net/npm/reveal.js/css/print/pdf.css';\n",
"        document.getElementsByTagName( 'head' )[0].appendChild( link );\n",
"    }\n",
"</script>\n",
"<script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-AMS-MML_HTMLorMML\"></script>\n",
"<link rel=\"stylesheet\" href=\"https://unpkg.com/@highlightjs/cdn-assets@11.9.0/styles/default.min.css\">\n",
"<script src=\"https://unpkg.com/@highlightjs/cdn-assets@11.9.0/highlight.min.js\"></script>\n",
"<script>hljs.highlightAll();</script>\n"
  	      )),
	   el(body,
	      (	  
	      el(div,class="reveal",
		 (
		     el(div,class="slides",
			(
			    el(section,id="sec-title-slide",
			       (   
				   el(h1,class="title",T),
				   el(h2,class="author",A),
				   el(h3,class="date",D))
			      ),
			    slides
			))
		 )),
	      el(script,src="https://unpkg.com/reveal.js/dist/reveal.js",[]),
	      el(script,
		 (
		     "Reveal.initialize({",
		     "      transition: '",Transition,"'",
		     "});"
		 ))
	     ))
         )).

	    

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


p(Body) -->
    el(p,Body).
p(Opt,Body) -->
    el(p,Opt,Body).

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

b(Body) -->
    el(b,Body).
b(Opt,Body) -->
    el(b,Opt,Body).

em(Body) -->
    el(em,Body).
em(Opt,Body) -->
    el(em,Opt,Body).


code(Language,Code) -->
    "<pre><code class=\"",
    Language,
    "\">\n",
    Code,
    "</code></pre>\n".

code(Code) -->
    "<pre><code>\n",
    Code,
    "</code></pre>\n".
    


fig(A) -->
    "<div class=\"figure\">\n",
    A,
    "</div>\n".

fig(A,Caption) -->
    "<figure>\n",
    A,
    "<figcaption>\n",
    Caption,
    "</figcaption>\n",
    "</figure>\n".
    


img(File,Width,Height) -->
	   "<img src=",
	   File,
	   "  width=",
	   Width,
	   "  height=",
	   Height.



link(Ref,Text) -->
    "<a href=\n",
    Ref,
    ">\n",
    Text,
    "</a>\n".
	   

split(A,B) -->
    "<div class=\"gridded_frame_with_columns\">\n",
    "<div class=\"one_of_2_columns\">\n",
    A,
    "</div>\n",
    "<div class=\"one_of_2_columns\">\n",
    B,
    "</div>\n",
    "</div>\n".
    

col(Col,Text) -->
   { atom_codes(Col,Color)},
    "<span style=\"color:",
    Color,
    ";\">",
    Text,
    "</span>".


section(animate,Title) -->
    el(section," data-auto-animate ",
       (
	   el(h2,Title),
	   "<div class=\"outline-text-2\" ></div>\n"
       )).


section(Title) -->
    el(section,
       (
	   el(h2,Title),
	   "<div class=\"outline-text-2\" ></div>\n"
       )).

slide(animate,Title,Body) -->
    el(section," data-auto-animate ",
       (
	   el(h3,Title),
	   Body
       )).

slide(SizeFont,Title,Body) -->
    el(section,
       (
	   el(h3,Title),
	   "<div style=\"font-size: ",
	   SizeFont,
	   ";\">\n",
	   Body
       )).


slide(Title,Body) -->
    el(section,
       (
	   el(h3,Title),
	   Body
       )).

enum(Fragm,L) -->
    { atom_codes(Fragm,Frag)},
    "<ol>",
    items(Frag,L),
    "</ol>\n".

item(Fragm,L) -->
    { atom_codes(Fragm,Frag)},
    "<ul>",
    items(Frag,L),
    "</ul>\n".


items(_,[]) --> [].
items(Frag,[X|L]) -->
    "<li class=\"fragment ",
    Frag,
    "\">",
    X,
    "</li>\n",
    items(Frag,L).

enum(L) -->
    "<ol>",
    items(L),
    "</ol>\n".

item(L) -->
    "<ul>",
    items(L),
    "</ul>\n".


items([]) --> [].
items([X|L]) -->
    "<li>",
    X,
    "</li>\n",
    items(L).
       

