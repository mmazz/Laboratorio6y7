function copia_graf(p1,p2,p3,pata,iteraciones,errormax,pasoo)
   error_en_z_vs_porcentaje_ruido_theta_2_off(p1,p2,p3,pata,iteraciones,errormax,pasoo)
   hold on;
   error_en_z_vs_porcentaje_ruido_theta_3_off(p1,p2,p3,pata,iteraciones,errormax,pasoo)
   hold on;
   error_en_z_vs_porcentaje_ruido_a_1(p1,p2,p3,pata,iteraciones,errormax,pasoo)
   hold on;
   error_en_z_vs_porcentaje_ruido_a_2_off(p1,p2,p3,pata,iteraciones,errormax,pasoo)
   hold on;
   error_en_z_vs_porcentaje_ruido_a_3(p1,p2,p3,pata,iteraciones,errormax,pasoo)
   legend('theta_2_off','theta_3_off','a_1','a_2','a_3');
end
