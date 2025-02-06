% 1. 심볼릭 변수 정의 및 편미분 계산
syms x y
G = -x^2 - y^2 + 5;  % 함수 정의

Gx = diff(G, x);  % x에 대한 편미분
Gy = diff(G, y);  % y에 대한 편미분

% 2. (1,1)에서 편미분 값 계산
Gx_val = double(subs(Gx, [x, y], [1,1]));  % x 방향 편미분 값
Gy_val = double(subs(Gy, [x, y], [1,1]));  % y 방향 편미분 값

%subs(expression, old_vars, new_values)는 변수에 값을 대입(substitute)하는 함수
%[x,y] 대체할 변수 목록
%[1,1] 해당 변수에 대입할 값 

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

end_x = start_x + Gx_val;  % x 방향 이동
end_y = start_y;                 % y 값 유지
end_z = start_z;                 % z 값 유지


% 4. 3D 그래프 설정
len_x = 50;
len_y = 50;

x_vals = linspace(-4,4,len_x);
y_vals = linspace(-4,4,len_y);
[X, Y] = meshgrid(x_vals, y_vals);
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
xlabel('x축임');
ylabel('y축임');
zlabel('z축임');
title('심볼릭 편미분을 이용한 x 방향 기울기');
grid on;
hold off;
