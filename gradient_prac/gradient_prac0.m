len_x=100;
len_y=100;

x=linspace(-4,4,len_x);
y=linspace(-4,4,len_y);
Gr=zeros(len_x,len_y); %x,y 크기만큼 0 행렬 생성 (100x100)

for x_index=1:len_x   %1~100
    for y_index=1:len_y   %1~100
        Gr(x_index,y_index)=-x(x_index)^2-y(y_index)^2+5;  %(x^2+y^2)형태의 그래프 
        % x의 x_index 번째 원소 가져와 제곱 
    end
end


mesh(x,y,Gr)
hold on;  % 기존 그래프 유지

% (0,0,0) 점 추가 (빨간색 원)   %plot3은 단지 plot에 축하나가 추가된 3차원 공간에서의 선 그래프 
plot3(1, 1, 3, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); 
%'ro' → 빨간색 원
%'MarkerSize', 10 → 점 크기를 10
%'MarkerFaceColor', 'r' → 점 내부를 빨간색으로 채움

xlabel('x축임');
ylabel('y축임');
zlabel('z축임');
title('곡면  임');


hold off;  % 그래프 수정 완료
