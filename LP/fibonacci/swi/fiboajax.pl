:- use_module(library(http/http_server)).
:- use_module(library(http/html_write)).
:- use_module(library(http/js_write)).
:- use_module(library(www_browser)).
:- use_module(library(http/html_head)).

:- http_handler(root(fibonacchi),handlerfibo,[]).
:- http_handler(root(api/calcular), api_calc_fib, [method(post)]).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

:- server(6500).
:- www_open_url('http:/localhost:6500/fibonacchi').

f(0,1).
f(1,1).
f(N,R):-
    N >=2,
    faux(2,N,1,1,R).

faux(N,N,A1,A2,R) :- R is A1 + A2.
faux(I,N,A1,A2,R) :-
    I1 is I + 1,
    A is A1 + A2,
    faux(I1,N,A2,A,R).


api_calc_fib(Request) :-
    http_read_json_dict(Request, JsonDict),
    atom_number(JsonDict.num,N),
    f(N,R),
    phrase(html(["es el numero ",b("~d"-[R])]),HTML),
    format('Content-type: text/html~n~n'),
    print_html(HTML).
							     
    
		      


handlerfibo(_Request) :-
    reply_html_page([
			   title("Numero de Fibonacci"),
			   meta([name=viewport, content='width=device-width, initial-scale=1'])
		       ],
		    [
 			\html_requires("https://www.w3schools.com/w3css/5/w3.css"),
			\html_requires("https://www.w3schools.com/lib/w3.js"),
			header(class="w3-container w3-teal",h1(class="w3-jumbo","Numero de Fibonacci")),
			div(class("w3-container w3-light-green w3-margin w3-padding-16"),[
				label(class("w3-text-white"),"El numero de Fibonacci de"),
				input([class("w3-input"),type="text",name="numero",id=num,placeholder="Entre el Numero",size="12", autofocus, required],[]),

				div(span([id=resultado,class="w3-xxlarge"],"")),

				button([class="w3-btn w3-white",onclick="calcfib()",for=num], "Calcular")

	     ]),
			div([id=error,class="w3-panel w3-red w3-display-container",style="display:none"],[
				span([onclick="w3.hide('#error')",
		   class="w3-button w3-large w3-display-topright"],&(times)),
	     h3("Error"),
	     p("Por favor ingresa un valor")]),
	 footer(class("w3-container w3-teal w3-xlarge w3-center"),"Powered by swi-prolog and w3.css"),
	 \js_script({|javascript||
		      function fetchajax(url,data,dom) {
			  fetch(url ,{
				    method: "POST",
				    headers: {
					"Content-Type": "application/json"
				    },
				    body: JSON.stringify(data)
				})
			  .then(response => response.text())
			  .then(html => {
				    document.getElementById(dom).innerHTML = html;
				});
		      };

		      
		      function calcfib() {
			  const newValue = document.getElementById("num").value;
			  if (!newValue.trim()) {
			      w3.show('#error');
			      return;
			  }
			  else
			  {
			      fetchajax("api/calcular", {
					num: newValue
				    },
					"resultado");
			      w3.hide('#error');
			  };
			  }
			  
		 |})
		
		]).

