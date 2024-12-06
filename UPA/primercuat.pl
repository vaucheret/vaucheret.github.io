slots_per_week(25).  % 25 10
slots_per_day(5).   % 5 2
days_week(['Lunes','Martes','Miercoles','Jueves','Viernes']).

class_subject_teacher_times('1Cinf','Cálculo_I','C. Ocampo',7). % 3 7
class_subject_teacher_times('1Cinf','Int_Infor','M. Monser',7). % 3 7
class_subject_teacher_times('1Cinf','Mat_Discr','P. Bohosl',5). % 2 5
class_subject_teacher_times('1Cinf','Alg_y_Est','G. Pagnos',5). % 2 5

class_subject_teacher_times('1Cind','Cálculo_I','C. Ocampo',7). % 3 7
class_subject_teacher_times('1Cind','Int_Infor','M. Monser',7). % 3 7
class_subject_teacher_times('1Cind','Quím_Gen' ,'M. Salica',5). % 2 5
class_subject_teacher_times('1Cind','Int_Ingen','B. CaresL',4). % 2 4

class_subject_teacher_times('1Cene','Cálculo_I','C. Ocampo',7). % 3 7
class_subject_teacher_times('1Cene','Int_Ingen','B. CaresL',4). % 2 4
class_subject_teacher_times('1Cene','Sist_Repr','S. Burgos',5). % 2 5
%class_subject_teacher_times('1Cene','Quimica_1','M. Salica',6). % 2 6
class_subject_teacher_times('1Cene','Quím_Gen' ,'M. Salica',5). % 2 5 

class_subject_teacher_times('1LicCiePol','IntCienPol','V. Amsteinm',6). % 6 2
class_subject_teacher_times('1LicCiePol','Economía_I','P.  Guido',4).  % 4 2
class_subject_teacher_times('1LicCiePol','Derech_Con','M Urruti',4).  % 4 2
class_subject_teacher_times('1LicCiePol','Int_a_Soci','L. Bensegues',4). % 4 2
class_subject_teacher_times('1LicCiePol','Taller_Esc','M. Godino',4).  % 4 2

class_subject_teacher_times('1LicEducac','Meto_Estud','M. Godino',3). % 3 1
class_subject_teacher_times('1LicEducac','Real_social','N. Heredia',4). % 4 2
class_subject_teacher_times('1LicEducac','PedagogíaG','M. Larraburu',4). % 4 2
class_subject_teacher_times('1LicEducac','Historia_G','M. Mendoca',5). % 5 2
class_subject_teacher_times('1LicEducac','Fund_Bioló','J. Trapassi',3). % 3 1

class_subject_teacher_times('1Psicolog','FundTeóPsiI','M Melo',5).  % 5 2
class_subject_teacher_times('1Psicolog','Hist_Psicol','A Juárez',4). % 4 2
class_subject_teacher_times('1Psicolog','Filosofía','M Properzi',4). % 4 2
class_subject_teacher_times('1Psicolog','Taller_Pro','M Lértora',4). % 4 2
class_subject_teacher_times('1Psicolog','Tutoría_I','M González',2). % 2.25 1



same_class(ca,'Cálculo_I',['1Cind','1Cinf','1Cene']).
same_class(in,'Int_Infor',['1Cind','1Cinf']).
same_class(nn,'Int_Ingen',['1Cind','1Cene']).
same_class(qg,'Quím_Gen', ['1Cind','1Cene']).

%% room_alloc(magna,'1Cene','Cálculo_I', 0).
%% room_alloc(magna,'1Cene','Cálculo_I', 1).
%% room_alloc(magna,'1Cene','Cálculo_I', 2).

%% room_alloc(magna,'1Cene','Int_Ingen', 0).
%% room_alloc(magna,'1Cene','Int_Ingen', 1).

%% room_alloc(magna,'1Cinf','Int_Infor', 0).
%% room_alloc(magna,'1Cinf','Int_Infor', 1).
%% room_alloc(magna,'1Cinf','Int_Infor', 2).


%% teacher_freeday('P. Bohosl', 4).

coupling('1Cinf','Cálculo_I', 0, 1).
coupling('1Cinf','Cálculo_I', 1, 2). 
coupling('1Cinf','Cálculo_I', 3, 4). %% 7 alt 1
coupling('1Cinf','Cálculo_I', 5, 6).

coupling('1Cinf','Int_Infor', 0, 1).
coupling('1Cinf','Int_Infor', 2, 3). %% 7 alt 2
coupling('1Cinf','Int_Infor', 4, 5).
coupling('1Cinf','Int_Infor', 5, 6). 


coupling('1Cinf','Mat_Discr', 0, 1). 
coupling('1Cinf','Mat_Discr', 1, 2). % 5 alt 1
coupling('1Cinf','Mat_Discr', 3, 4). 

coupling('1Cinf','Alg_y_Est', 0, 1). 
coupling('1Cinf','Alg_y_Est', 2, 3). % 5 alt 2
coupling('1Cinf','Alg_y_Est', 3, 4). 


coupling('1Cind','Cálculo_I', 0, 1).
coupling('1Cind','Cálculo_I', 1, 2). 
coupling('1Cind','Cálculo_I', 3, 4). %% 7 alt 1
coupling('1Cind','Cálculo_I', 5, 6).

coupling('1Cind','Int_Infor', 0, 1).
coupling('1Cind','Int_Infor', 2, 3). %% 7 alt 2
coupling('1Cind','Int_Infor', 4, 5).
coupling('1Cind','Int_Infor', 5, 6). 

coupling('1Cind','Int_Ingen', 0, 1). %% 4 
coupling('1Cind','Int_Ingen', 2, 3). 

coupling('1Cind','Quím_Gen', 0, 1). %% 5 alt 1
coupling('1Cind','Quím_Gen', 1, 2).
coupling('1Cind','Quím_Gen', 3, 4). 

coupling('1Cene','Quím_Gen', 0, 1). %% 5 alt 1
coupling('1Cene','Quím_Gen', 1, 2).
coupling('1Cene','Quím_Gen', 3, 4). 

coupling('1Cene','Quimica_1', 0, 1). %% 6 alt  3 3
coupling('1Cene','Quimica_1', 1, 2).
coupling('1Cene','Quimica_1', 3, 4).
coupling('1Cene','Quimica_1', 4, 5). 

coupling('1Cene','Cálculo_I', 0, 1).
coupling('1Cene','Cálculo_I', 1, 2). 
coupling('1Cene','Cálculo_I', 3, 4). %% 7 alt 1
coupling('1Cene','Cálculo_I', 5, 6).

coupling('1Cene','Int_Ingen', 0, 1). %% 4 
coupling('1Cene','Int_Ingen', 2, 3). 

coupling('1Cene','Sist_Repr', 0, 1). %% 5 alt 2
coupling('1Cene','Sist_Repr', 2, 3).
coupling('1Cene','Sist_Repr', 3, 4). 


coupling('1LicCiePol','IntCienPol', 0, 1).
coupling('1LicCiePol','IntCienPol', 1, 2). %% 6
coupling('1LicCiePol','IntCienPol', 3, 4).
coupling('1LicCiePol','IntCienPol', 4, 5).

coupling('1LicCiePol','Economía_I', 0, 1). %% 4
coupling('1LicCiePol','Economía_I', 2, 3).

coupling('1LicCiePol','Derech_Con', 0, 1). %% 4
coupling('1LicCiePol','Derech_Con', 2, 3).

coupling('1LicCiePol','Int_a_Soci', 0, 1). %% 4
coupling('1LicCiePol','Int_a_Soci', 2, 3).

coupling('1LicCiePol','Taller_Esc', 0, 1). %% 4
coupling('1LicCiePol','Taller_Esc', 2, 3).



coupling('1LicEducac','Meto_Estud', 0, 1).
coupling('1LicEducac','Meto_Estud', 1, 2). %% 3

coupling('1LicEducac','Real_social', 0, 1). %% 4
coupling('1LicEducac','Real_social', 2, 3).

coupling('1LicEducac','PedagogíaG', 0, 1). %% 4
coupling('1LicEducac','PedagogíaG', 2, 3).

coupling('1LicEducac','Historia_G', 0, 1).
coupling('1LicEducac','Historia_G', 1, 2). %% 5
coupling('1LicEducac','Historia_G', 3, 4).

coupling('1LicEducac','Fund_Bioló', 0, 1).
coupling('1LicEducac','Fund_Bioló', 1, 2). %% 3




coupling('1Psicolog','FundTeóPsiI', 0, 1).
coupling('1Psicolog','FundTeóPsiI', 1, 2). %% 5
coupling('1Psicolog','FundTeóPsiI', 3, 4).

coupling('1Psicolog','Hist_Psicol', 0, 1). %% 4
coupling('1Psicolog','Hist_Psicol', 2, 3).

coupling('1Psicolog','Filosofía', 0, 1). %% 4
coupling('1Psicolog','Filosofía', 2, 3).

coupling('1Psicolog','Taller_Pro', 0, 1). %% 4
coupling('1Psicolog','Taller_Pro', 2, 3).

coupling('1Psicolog','Tutoría_I', 0, 1). %% 2

