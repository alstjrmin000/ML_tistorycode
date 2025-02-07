% clear; close all; clc;

%%곡면에서 각 점의 gradient 벡터 화살표

% f(x,y)= -x^2-y^2+5 그리기
x=-1:0.2:1;
y=-1:0.2:1;

for i_x=1:length(x)
    for i_y=1:length(y)
        f(i_x,i_y)=-x(i_x)^2- y(i_y)^2;   %행(x)x열(y)
    end
end

figure;
surf(x,y,f)
xlabel('x'); ylabel('y'); zlabel('f(x,y)')
hold on;

%% Gradient

% x방향 성분 quiver 그리기

u_x=zeros(length(x),length(y));
v_x=zeros(length(x),length(y));
w_x=zeros(length(x),length(y));

for i_x=1:length(x)
    for i_y=1:length(y)
        u_x(i_x,i_y)=-2*x(i_x);
       %v_x(i_x,i_y)=2*x(i_x)+y(i_y);
    end
end

x_p=zeros(length(x),length(y));
y_p=zeros(length(x),length(y));

for i_x=1:length(x)
    for i_y=1:length(y)
        x_p(i_x,i_y)=x(i_x);
        y_p(i_x,i_y)=y(i_y);
    end
end

quiver3(x_p,y_p,f,u_x,v_x,w_x)

%quiver3 설명

%quiver3(x0, y0, z0, dx, dy, dz, 'color', 'LineWidth', 'MaxHeadSize');
% (x0, y0, z0): 벡터의 시작점
% (dx, dy, dz): 벡터의 이동 방향 (끝점 - 시작점)
% 'b': 파란색 벡터
% 'LineWidth', 2: 화살표 선 두께 2
% 'MaxHeadSize', 0.5: 화살표 머리 크기 설정