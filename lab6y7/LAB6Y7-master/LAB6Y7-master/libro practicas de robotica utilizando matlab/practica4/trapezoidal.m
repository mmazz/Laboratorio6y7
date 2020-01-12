% TRAPEZOIDAL  Perfil de velocidad trapezoidal
%    PERFIL=TRAPEZOIDAL(U) devuelve un vector 1x2 que contiene la velocidad 
%    y la aceleración de un perfil de velocidad trapezoidal en un determinado 
%    instante de tiempo. PERFIL(1) contiene la velocidad y PERFIL(2) la 
%    aceleración. U(1) representa el instante de tiempo actual(seg). U(2) es 
%    la velocidad máxima. U(3) es el tiempo de aceleración(seg). U(4) es el
%    tiempo de velocidad constante(seg). U(5) es el tiempo de deceleración(seg).

function perfil=trapezoidal(u)

t      = u(1);	% Instante de tiempo actual
velmax = u(2);  % Velocidad máxima
tacel  = u(3);	% Tiempo de aceleración
tconst = u(4);	% Tiempo de velocidad constante
tdecel = u(5);	% Tiempo de deceleración

% Se calcula la velocidad y la aceleración
if t <= tacel
   % Intervalo de aceleración
   acel = velmax/tacel;
   vel  = acel*t;
else
    if t < (tacel+tconst)
	% Intervalo de velocidad constante
        vel  = velmax;
        acel = 0;
    else
        if t>(tacel+tconst+tdecel)
	   % Velocidad y aceleración nula
           vel  = 0;
           acel = 0;
        else
	   % Intervalo de deceleración
           acel = -velmax/tdecel;
           vel  = velmax+acel*(t-tacel-tconst);
        end         
   end
end

% Se devuelve la velocidad y la aceleración
perfil = [vel acel];
