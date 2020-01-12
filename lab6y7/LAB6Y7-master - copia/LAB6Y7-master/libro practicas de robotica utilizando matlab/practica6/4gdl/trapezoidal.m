% TRAPEZOIDAL  Perfil de velocidad trapezoidal
%    PERFIL=TRAPEZOIDAL(U) devuelve un vector 1x2 que contiene la velocidad 
%    y la aceleraci�n de un perfil de velocidad trapezoidal en un determinado 
%    instante de tiempo. PERFIL(1) contiene la velocidad y PERFIL(2) la 
%    aceleraci�n. U(1) representa el instante de tiempo actual(seg). U(2) es 
%    la velocidad m�xima. U(3) es el tiempo de aceleraci�n(seg). U(4) es el
%    tiempo de velocidad constante(seg). U(5) es el tiempo de deceleraci�n(seg).

function perfil=trapezoidal(u)

t      = u(1);	% Instante de tiempo actual
velmax = u(2);  % Velocidad m�xima
tacel  = u(3);	% Tiempo de aceleraci�n
tconst = u(4);	% Tiempo de velocidad constante
tdecel = u(5);	% Tiempo de deceleraci�n

% Se calcula la velocidad y la aceleraci�n
if t <= tacel
   % Intervalo de aceleraci�n
   acel = velmax/tacel;
   vel  = acel*t;
else
    if t < (tacel+tconst)
	% Intervalo de velocidad constante
        vel  = velmax;
        acel = 0;
    else
        if t>(tacel+tconst+tdecel)
	   % Velocidad y aceleraci�n nula
           vel  = 0;
           acel = 0;
        else
	   % Intervalo de deceleraci�n
           acel = -velmax/tdecel;
           vel  = velmax+acel*(t-tacel-tconst);
        end         
   end
end

% Se devuelve la velocidad y la aceleraci�n
perfil = [vel acel];
