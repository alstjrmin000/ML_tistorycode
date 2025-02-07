clc; clear; close all;

%% Contour Plot and Gradient Field of f(x,y) = -x^2 - y^2 + 5

% 변수 정의

x=-1:0.2:1;
y=-1:0.2:1;
[X, Y] = meshgrid(x,y);

% 함수 정의
F = -X.^2 - Y.^2 + 5;

% Gradient 계산
[Fx, Fy] = gradient(F, x, y);

%Fx : 각 점에서 x방향 미분값
%Fy : 각 점에서 y방향 미분값

% 등고선 플롯
figure;
contour(X, Y, F, 20, 'LineWidth', 1.2); % 등고선 그림
%X,Y : 등고선의 좌표 격자(meshgrid로 생성)
%F : 등고선을 그릴 함수 
%20 : 등고선 수
%'LineWidth', 1.2 : 등고선 두께

hold on;
quiver(X, Y, Fx, Fy, 'r', 'LineWidth', 1.2); % 그래디언트 벡터 그리기
hold off;

% 그래프 설정
xlabel('x');
ylabel('y');
title('Contour Plot and Gradient Field of f(x,y) = -x^2 - y^2 + 5');
grid on;
axis equal;
