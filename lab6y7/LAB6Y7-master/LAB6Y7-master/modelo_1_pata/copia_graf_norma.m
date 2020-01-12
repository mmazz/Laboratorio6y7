function copia_graf_norma(p1,p2,p3,pata,errormax,pasoo)
   e1 = error_en_norma_vs_porcentaje_ruido_theta_2_off(p1,p2,p3,pata,errormax,pasoo);
   
   e2 = error_en_norma_vs_porcentaje_ruido_theta_3_off(p1,p2,p3,pata,errormax,pasoo);
  
      e3 = error_en_norma_vs_porcentaje_ruido_a_1(p1,p2,p3,pata,errormax,pasoo);
   
   e4 = error_en_norma_vs_porcentaje_ruido_a_2(p1,p2,p3,pata,errormax,pasoo);
  
   e5 = error_en_norma_vs_porcentaje_ruido_a_3(p1,p2,p3,pata,errormax,pasoo);
x= [1:pasoo:errormax];
%     h = {e4;e5;e1;e2};
  plot(x,e1,'--o',x,e2,'--o',x,e3,'--o',x,e4,'--o',x,e5,'--o', 'linewidth', 5);

    xlabel('% de Error agregado');% Set the X-axis label
    ylabel('norm(x,y) [mm]');
    legend('\theta_2^{off}','\theta_3^{off}','a_1','a_2','a_3');
    box on; grid on;
end
