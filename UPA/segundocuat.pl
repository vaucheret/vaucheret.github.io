slots_per_week(25).  % 25 10
slots_per_day(5). % 5 2
days_week(['Lunes','Martes','Miercoles','Jueves','Viernes']).

oclass_subject_teacher_times('2Cinf','Física_I' ,'C. Mesqui',7). % 3 7
class_subject_teacher_times('2Cinf','Alg_y_Geo','C. Ocampo',7). % 3 7
class_subject_teacher_times('2Cinf','Prograc_I','G. Pagnos',5).  % 2 5
class_subject_teacher_times('2Cinf','Sis_deC_I','A. Huayqu',5).  % 2 5

class_subject_teacher_times('2Cind','Física_I' ,'C. Mesqui',7).  % 3 7
class_subject_teacher_times('2Cind','Alg_y_Geo','C. Ocampo',7).  % 3 7
class_subject_teacher_times('2Cind','Sis_y_Mod','G. Mannuc',5).  % 2 5
class_subject_teacher_times('2Cind','Mat_y_Pro','G. Mannuc',5).  % 2 5

class_subject_teacher_times('2Cene','Física_I' ,'C. Mesqui',7). % 3 7
class_subject_teacher_times('2Cene','Sist.Tec' ,'P. Malian',5). % 2 5
class_subject_teacher_times('2Cene','Alg_y_Geo','C. Ocampo',7). % 3 7
class_subject_teacher_times('2Cene','Fund_Tier','J. Contre',5). % 2 5


class_subject_teacher_times('2LicCiePol','Teor_PolI','E. Casullo',6).
class_subject_teacher_times('2LicCiePol','Hist_SocG','J Perren',5).
class_subject_teacher_times('2LicCiePol','Pens_Cien','N. Medina',3).
class_subject_teacher_times('2LicCiePol','Int_Est_Ad','L. Paniceres',4).
class_subject_teacher_times('2LicCiePol','Inglés I','G. Polinori',4).

class_subject_teacher_times('2LicEducac','HistEedA','M. Mendoca',5).
class_subject_teacher_times('2LicEducac','SociEduc','J. Noriega',4).
class_subject_teacher_times('2LicEducac','Psic_Gen','A. Bonilla',3).
class_subject_teacher_times('2LicEducac','Pol_y_leg','G. Riccono',6).
class_subject_teacher_times('2LicEducac','SemProbEd','J. Noriega',3).
class_subject_teacher_times('2LicEducac','PráctProf','M Saavedra',4).

class_subject_teacher_times('2Psicolog','F.T.PsicoII','M. Melo',5).
class_subject_teacher_times('2Psicolog','T.PsicoanaI','M. Jensen',5).
class_subject_teacher_times('2Psicolog','PsicEvolutI','N. Menichetti',4).
class_subject_teacher_times('2Psicolog','NeurobioPsi','S. LLanos',4).

teacher_freeday('G. Pagnos', 0).


same_class(fi,'Física_I',['2Cinf','2Cind','2Cene']).
same_class(ag,'Alg_y_Geo',['2Cinf','2Cind','2Cene']).

%% room_alloc(magna,'2Cene','Física_I', 0).
%% room_alloc(magna,'2Cene','Física_I', 1).
%% room_alloc(magna,'2Cene','Física_I', 2).

%% room_alloc(magna,'2Cind','Alg_y_Geo',0).
%% room_alloc(magna,'2Cind','Alg_y_Geo',1).
%% room_alloc(magna,'2Cind','Alg_y_Geo',2).






coupling('2Cinf','Física_I', 0, 1).
coupling('2Cinf','Física_I', 1, 2). 
coupling('2Cinf','Física_I', 3, 4). %% 7 alt 1
coupling('2Cinf','Física_I', 5, 6).

coupling('2Cinf','Alg_y_Geo', 0, 1).
coupling('2Cinf','Alg_y_Geo', 2, 3). 
coupling('2Cinf','Alg_y_Geo', 4, 5). %% 7 alt 2
coupling('2Cinf','Alg_y_Geo', 5, 6).


coupling('2Cinf','Prograc_I', 0, 1). 
coupling('2Cinf','Prograc_I', 2, 3). % 5 alt 1
coupling('2Cinf','Prograc_I', 3, 4). 

coupling('2Cinf','Sis_deC_I', 0, 1). 
coupling('2Cinf','Sis_deC_I', 2, 3). % 5 alt 2
coupling('2Cinf','Sis_deC_I', 3, 4). 



coupling('2Cind','Física_I', 0, 1).
coupling('2Cind','Física_I', 1, 2). 
coupling('2Cind','Física_I', 3, 4). %% 7 alt 1
coupling('2Cind','Física_I', 5, 6).

coupling('2Cind','Alg_y_Geo', 0, 1).
coupling('2Cind','Alg_y_Geo', 2, 3). 
coupling('2Cind','Alg_y_Geo', 4, 5). %% 7 alt 2
coupling('2Cind','Alg_y_Geo', 5, 6).


coupling('2Cind','Sis_y_Mod', 0, 1). 
coupling('2Cind','Sis_y_Mod', 1, 2). % 5 alt 1
coupling('2Cind','Sis_y_Mod', 3, 4). 

coupling('2Cind','Mat_y_Pro', 0, 1). 
coupling('2Cind','Mat_y_Pro', 2, 3). % 5 alt 2
coupling('2Cind','Mat_y_Pro', 3, 4). 


coupling('2Cene','Física_I', 0, 1).
coupling('2Cene','Física_I', 1, 2). 
coupling('2Cene','Física_I', 3, 4).
coupling('2Cene','Física_I', 5, 6).

coupling('2Cene','Alg_y_Geo', 0, 1).
coupling('2Cene','Alg_y_Geo', 2, 3). 
coupling('2Cene','Alg_y_Geo', 4, 5). %% 7 alt 1
coupling('2Cene','Alg_y_Geo', 5, 6).

coupling('2Cene','Sist.Tec', 0, 1). 
coupling('2Cene','Sist.Tec', 1, 2). % 5 alt 1
coupling('2Cene','Sist.Tec', 3, 4). 

coupling('2Cene','Fund_Tier', 0, 1). 
coupling('2Cene','Fund_Tier', 2, 3). % 5 alt 2
coupling('2Cene','Fund_Tier', 3, 4). 



coupling('2LicCiePol','Teor_PolI', 0, 1).
coupling('2LicCiePol','Teor_PolI', 1, 2). %% 6
coupling('2LicCiePol','Teor_PolI', 3, 4).
coupling('2LicCiePol','Teor_PolI', 4, 5).

coupling('2LicCiePol','Hist_SocG', 0, 1).
coupling('2LicCiePol','Hist_SocG', 1, 2). %% 5
coupling('2LicCiePol','Hist_SocG', 3, 4).

coupling('2LicCiePol','Pens_Cien', 0, 1).
coupling('2LicCiePol','Pens_Cien', 1, 2). %% 3

coupling('2LicCiePol','Int_Est_Ad', 0, 1). %% 4
coupling('2LicCiePol','Int_Est_Ad', 2, 3).

coupling('2LicCiePol','Inglés I', 0, 1). %% 4
coupling('2LicCiePol','Inglés I', 2, 3).


coupling('2LicEducac','HistEedA', 0, 1).
coupling('2LicEducac','HistEedA', 1, 2). %% 5
coupling('2LicEducac','HistEedA', 3, 4).

coupling('2LicEducac','SociEduc', 0, 1). %% 4
coupling('2LicEducac','SociEduc', 2, 3).

coupling('2LicEducac','Psic_Gen', 0, 1).
coupling('2LicEducac','Psic_Gen', 1, 2). %% 3

coupling('2LicEducac','Pol_y_leg', 0, 1).
coupling('2LicEducac','Pol_y_leg', 1, 2). %% 6
coupling('2LicEducac','Pol_y_leg', 3, 4).
coupling('2LicEducac','Pol_y_leg', 4, 5).

coupling('2LicEducac','SemProbEd', 0, 1).
coupling('2LicEducac','SemProbEd', 1, 2). %% 3

coupling('2LicEducac','PráctProf', 0, 1). %% 4
coupling('2LicEducac','PráctProf', 2, 3).


coupling('2Psicolog','F.T.PsicoII', 0, 1).
coupling('2Psicolog','F.T.PsicoII', 1, 2). %% 5
coupling('2Psicolog','F.T.PsicoII', 3, 4).

coupling('2Psicolog','T.PsicoanaI', 0, 1).
coupling('2Psicolog','T.PsicoanaI', 1, 2). %% 5
coupling('2Psicolog','T.PsicoanaI', 3, 4).

coupling('2Psicolog','PsicEvolutI', 0, 1). %% 4
coupling('2Psicolog','PsicEvolutI', 2, 3).

coupling('2Psicolog','NeurobioPsi', 0, 1). %% 4
coupling('2Psicolog','NeurobioPsi', 2, 3).

