function KeyPoints_f = LocateKeyPoint(sigma,GuassianPyramid,n)

% :param DoG: DoG Pyramid of the original img
% :param sigma: default sigma 1.6
% :param GuassianPyramid: the GuassianPyramid of the original img
% :param n: how many stacks of feature that you want to extract.
% :param BinNum: 1 direction per 10 degrees ,a total of 36 direction
% return :

    %%%%%%%%%
    %减少方向提高速率
    binNum = 36 ; % 确定主方向时方向个数（直方图个数）
    %%%%%%%%
    
    KeyPoints = [];
    KeyPoints_f = [];
    [~,octaves,~] = size(GuassianPyramid);

     for o=1:octaves
         
         
          Points = detectFASTFeatures(GuassianPyramid(o).octaves);
          KeyPointLocation = Points.Location ;
          count = Points.Count;
          
          KeyPoints = [KeyPoints ; KeyPointLocation(:,2).*(2^(o-1)) ,...
                        KeyPointLocation(:,1).*(2^(o-1)),...
                        o*ones(count,1),...
                        ones(count,1),...
                        ones(count,1)*sigma *(2.0^((1 + n*o )/ n))];

     end
     
     [r,~]=size(KeyPoints);
     for i=1:r
         o = KeyPoints(i,3);
         sigma1 = sigma*2^((o+1)/(n+3));
         [direction ,nx] = GetMainDirection2(GuassianPyramid(o).octaves ,KeyPoints(i,1) , KeyPoints(i,2) , sigma1 ,binNum );
         if nx == 0
             continue
         end
         
         for hu=1:nx
             KeyPoints_f =[KeyPoints_f;KeyPoints(i,:),direction(nx)];
         end
     
     end
end


