function graficador_usando_boxplot(p1,p2,p3,pata,iteraciones,errormax,pasoo)
grupo = 1:pasoo:errormax;   
e1 = error_en_z_vs_porcentaje_ruido_theta_2_off(p1,p2,p3,pata,iteraciones,errormax,pasoo);
box_1 = boxplot(e1,'colors','b','positions',grupo,'width',1);
    
hold on  % Keep the Month_O boxplots on figure overlap the Month_S boxplots 
   e2 = error_en_z_vs_porcentaje_ruido_theta_3_off(p1,p2,p3,pata,iteraciones,errormax,pasoo);
grupo2 = 1.5:pasoo:(errormax+0.5);  % Define position for 12 Month_S boxplots  
box_2 = boxplot(e2,'colors','r','positions',grupo2,'width',1);
% hold on
%    e3 = error_en_z_vs_porcentaje_ruido_a_1(p1,p2,p3,pata,iteraciones,errormax,pasoo);
%    grupo3 = 2:pasoo:(errormax+1);  % Define position for 12 Month_S boxplots  
% box_3 = boxplot(e3,'colors','g','positions',grupo3,'width',1);
% hold on
   e4 = error_en_z_vs_porcentaje_ruido_a_2(p1,p2,p3,pata,iteraciones,errormax,pasoo);
  grupo4 = 2.5:pasoo:(errormax+1.5);  % Define position for 12 Month_S boxplots  
box_4 = boxplot(e4,'colors','m','positions',grupo4,'width',1);
hold on
   e5 = error_en_z_vs_porcentaje_ruido_a_3(p1,p2,p3,pata,iteraciones,errormax,pasoo);
grupo5 = 3:pasoo:(errormax+2);  % Define position for 12 Month_S boxplots  
box_5 = boxplot(e5,'colors','k','positions',grupo5,'width',1);
 set(gca,'XTickLabel',{' '})  % Erase xlabels  
ylim([0 (max(e2(1,:)+5))])
xlim([0 errormax])
    xlabel('Porcentaje de Ruido');% Set the X-axis label
    ylabel('Error en la Pose (mm)');
%    legend('theta_2_off','theta_3_off','a_1','a_2','a_3');
    grid on
end
