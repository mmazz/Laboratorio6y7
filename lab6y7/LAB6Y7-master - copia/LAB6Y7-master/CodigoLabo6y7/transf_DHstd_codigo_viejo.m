%CODIGO DE FACUNDO PESSACG!!!
%DENAVIT    Matriz de Transformaci�n Homog�nea
%Esta funci�n devuelve la matriz de transformaci�n homog�nea de 4x4, a
%partir de los par�metros de D-H: d_i, a_i, alpha_i, theta_i.
function [T] = transf_DHstd(param)
%param es una STRUCTURE con distintos elementos dentro: alpha, a, d, q.
%clear
%syms q1 q2 q3 ;
%definimos los elementos de la STRUCTURE param.
%para correr luego el programa y obtener la  matriz de transf. del sist i-1
%al sist i, hay que INICIALIZAR los parametros. Por ej:
%alpha=param.alpha;
%param.a = 16;
%param.d = 349;
%param.q = 0;
%param.alpha = pi/2;
%Una vez inicializados los par�metros, ya que son el input de la funci�n
%definida arriba, se los asocia a unas ciertas variables:
alpha=param.alpha;
a=param.a;
d=param.d;
q=param.q;

%las definiciones de abajo son ESTRICTAMENTE necesarias, para no tener
%conflictos de nombre. (Se puede probar que sin redefinir cos(q), sin(q), etc) el programa no corre correctamente.
%Esto es, cuando matlab quiera calcular la matriz T que est� un par de
%l�neas mas abajo, vamos a tener una funci�n que adentro tiene otra funci�n
%que todav�a no fue inicializada, por lo que no sabe que computar (?)
%Una suerte de explicaci�n est� ac�:
%http://greenteapress.com/matlab/downey08matlab.pdf , en la p�g. 74
cq=cos(q);
sq=sin(q);
calpha=cos(alpha);
salpha=sin(alpha);

%0 es 0 jej solo que la compu no lo sabe, entonces se lo asignamos.
if (-1*1e-10 < calpha) && (calpha< 1e-10),calpha=0;end
if (-1*1e-10 < salpha) && (salpha< 1e-10),salpha=0;end

T=[cq -sq*calpha   sq*salpha   a*cq;...
   sq  cq*calpha  -cq*salpha   a*sq;...
   0   salpha         calpha      d;...
   0    0                0      1];


 end