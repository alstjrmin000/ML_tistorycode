
clear; close all; clc;

%%곡면 위 점(1,1,3)에서의 x방향 접선의 접선 벡터

syms x y
G = -x^2 - y^2 + 5;  % 함수 정의

Gx = diff(G, x);  % x에 대한 편미분    %Gx: G를 x에 대해 미분한 결과를 저장하는 변수 (-2*x)
Gy = diff(G, y);  % y에 대한 편미분

% 2. (1,1)에서 편미분 값 계산
Gx_val = double(subs(Gx, [x, y], [1,1]));  % x 방향 편미분 값
Gy_val = double(subs(Gy, [x, y], [1,1]));  % y 방향 편미분 값

%subs(expression, old_vars, new_values)는 변수에 값을 대입(substitute)하는 함수
%[x,y] 대체할 변수 목록
%[1,1] 해당 변수에 대입할 값 

%Gx에서 x와 y를 각각 1로 대입 (y가 없으므로 pass)

%subs(Gx, [x, y], [1,1]) -> -2  
%subs(Gy, [x, y], [1,1]) -> -2

% subs(Gx, [x, y], [1,1]) → x=1, y=1을 대입한 심볼릭 표현
% whos a
%   Name      Size            Bytes  Class    Attributes
% 
%   a         1x1                 8  sym   

% double(...) → 심볼릭 값을 일반 숫자(double 타입) 로 변환


% 3. (1,1,3)에서 벡터 화살표 추가를 위한 시작점 및 방향 설정
start_x = 1;
start_y = 1;
start_z = 3;


%접선의 벡터를 만들기 위해서 편미분 값 -2를 vector [-1,2]로 설정 
end_x = start_x - 1;  % x 방향 이동
end_y = start_y;                 % y 값 유지
end_z = start_z+2;                 % z 값 유지


% 4. 3D 그래프 설정
len_x = 50;
len_y = 50;

x_vals = linspace(-4,4,len_x); %50개 점 생성
y_vals = linspace(-4,4,len_y);
[X, Y] = meshgrid(x_vals, y_vals);
%격자 형태의 x,y 좌표 행렬 생성 

Z = -X.^2 - Y.^2 + 5;  % G(x, y) 값 계산

% 5. 메쉬 그래프 출력
mesh(X, Y, Z);
hold on;

% (1,1,3) 지점에 빨간 점 추가
plot3(start_x, start_y, start_z, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

% 6. 편미분 벡터(화살표) 추가
quiver3(start_x, start_y, start_z, end_x-start_x, end_y-start_y, end_z-start_z, ...
    'b', 'LineWidth', 2, 'MaxHeadSize', 0.5);

%quiver3(x0, y0, z0, dx, dy, dz, 'color', 'LineWidth', 'MaxHeadSize');
% (x0, y0, z0): 벡터의 시작점
% (dx, dy, dz): 벡터의 이동 방향 (끝점 - 시작점)
% 'b': 파란색 벡터
% 'LineWidth', 2: 화살표 선 두께 2
% 'MaxHeadSize', 0.5: 화살표 머리 크기 설정


% 7. 그래프 설정
xlabel('x축');
ylabel('y축');
zlabel('z축');
title('곡면 위에서의 기울기 벡터');
grid on;
hold off;
