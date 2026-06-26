fprintf('Running VFD Simulation...\n');
vfd_out = sim('VFD_Analyzer_1.slx'); 

fprintf('Running DOL Simulation...\n');
dol_out = sim('DOL_Starter.slx'); 

vfd_struct = vfd_out.vfd_data; 
dol_struct = dol_out.dol_data;

time_vfd    = vfd_struct.time;
speed_vfd   = vfd_struct.signals(1).values;
current_vfd = vfd_struct.signals(2).values;

time_dol    = dol_struct.time;
speed_dol   = dol_struct.signals(1).values;
current_dol = dol_struct.signals(2).values;

figure('Color', [1 1 1]); 
subplot(2,1,1);
plot(time_dol, speed_dol, 'r', 'LineWidth', 1.5); hold on;
plot(time_vfd, speed_vfd, 'b', 'LineWidth', 1.5);
grid on;
title('Rotor Speed Comparison');
xlabel('Time (seconds)');
ylabel('Speed (RPM)');
legend('Direct-On-Line (DOL)', 'VFD Soft Start', 'Location', 'best');

subplot(2,1,2);
plot(time_dol, current_dol, 'r', 'LineWidth', 1.2); hold on;
plot(time_vfd, current_vfd, 'b', 'LineWidth', 1.2);
grid on;
title('Stator Current Comparison');
xlabel('Time (seconds)');
ylabel('Current (Amperes)');
legend('Direct-On-Line (DOL)', 'VFD Soft Start', 'Location', 'best');