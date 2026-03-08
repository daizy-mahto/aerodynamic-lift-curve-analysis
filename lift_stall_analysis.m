% Analysing how Lift Coefficient (CL) varies with Angle of
% Attack(alpha) and plots between CL vs alpha and Lift vs alpha

% Defining Angles
alpha_deg = -5:1:20;  % Angle in degrees
alpha_rad = deg2rad(alpha_deg); % Convert to radians

rho = input('Enter air density (kg/m^3):');
V = input('Enter flight velocity (m/s):');
A = input('Enter wing area (m^2):');

stall_angle = input('Enter stall angle (degrees):');

% Computing CL
CL_theory = 2*pi*alpha_rad;  % Thin airfoil theory
CL_approx = 0.1*alpha_deg; % Simplified approximation

% Adding Stall (After 15 degrees)
for i=1:length(alpha_deg)
    if alpha_deg(i)>stall_angle
        CL_theory(i)=CL_theory(i)-0.15*(alpha_deg(i)-stall_angle)^2;
        CL_approx(i)=CL_approx(i)-0.15*(alpha_deg(i)-stall_angle)^2;
    end
end

% Plot Comparison between CL vs alpha
figure
plot(alpha_deg,CL_theory,'LineWidth',1)
hold on
plot(alpha_deg,CL_approx,'--','LineWidth',1)
hold on
plot(stall_angle,2*pi*deg2rad(stall_angle),'ro','MarkerSize',8,'MarkerFaceColor','b')
xlabel('Angle of Attack(degrees)','FontSize',12)
ylabel(' Lift coefficient(C_L)','FontSize',12)
title('Comparison of Theoretical and Approximate Lift Curves','FontSize',13)
legend('Thin Airfoil Theory(2\pi\alpha)','Approximation(0.1\alpha)','Location','northwest')
grid on

% Computing actual lift

L = 0.5*rho*V^2*A.*CL_theory;

% Plot for Lift vs alpha
figure
plot(alpha_deg,L,'LineWidth',1)
hold on

xlabel('Angle of Attack(degrees)','FontSize',12)
ylabel('Lift Force(N)','FontSize',12)
title('Lift Force vs Angle of Attack','FontSize',13)
grid on

% Comparing lift at two different velocities
V1 = 20; % velocity 1 (m/s)
V2 = 30; % velocity 2 (m/s)

L1 = 0.5*rho*V1^2*A.*CL_theory;
L2 = 0.5*rho*V2^2*A.*CL_theory;

%Plot comparison
figure
plot(alpha_deg,L1,'LineWidth',1)
hold on
plot(alpha_deg,L2,'--','LineWidth',2)
xlabel('Angle of Attack(degrees)','FontSize',12)
ylabel('Lift Force(N)','FontSize',12)
title('Lift vs Angle of attack at different velocities','FontSize',13)
legend('V=20 m/s','V=30 m/s','Location','northwest')
grid on


