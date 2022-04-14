
    [~,octaves,~] = size(DoG);
    [~,stacks,~] = size(DoG(1).octaves);
    T=0.04;
    num=0;
     for o=1:octaves
        for s = 2 : stacks-1
            
            threshold = 0.5*T/(n*1); % ãÐÖµ
            
            img_prev = DoG(o).octaves(s-1).stacks;
            img = DoG(o).octaves(s).stacks;
            img_next = DoG(o).octaves(s+1).stacks;
            [r,c,~]=size(img);
           % eight=zeros(3,3,3);
            for i = 2:r-1
                for j = 2:c-1
                    val = img(i,j);
                    
                     eight_neiborhood_prev = img_prev(max(1, i - 1):min(i + 1, r ), max(1, j - 1):min(j + 1,c ));
                    eight_neiborhood = img(max(1, i - 1):min(i + 1, r ), max(1, j - 1):min(j + 1, c ));
                    eight_neiborhood_next = img_next(max(1, i - 1):min(i + 1, r), max(1, j - 1):min(j + 1, c ));
                    
%                     eight(:,:,1) = img_prev(max(1, i - 1):min(i + 1, r ), max(1, j - 1):min(j + 1,c ));
%                     eight(:,:,2) = img(max(1, i - 1):min(i + 1, r ), max(1, j - 1):min(j + 1, c ));
%                     eight(:,:,3) = img_next(max(1, i - 1):min(i + 1, r), max(1, j - 1):min(j + 1, c ));

                    time_user(val,eight_neiborhood_prev,eight_neiborhood,eight_neiborhood_next);
%                          ((val > 0 && val >= max(max(eight_neiborhood_prev)) &&...
%                          val >= max(max(eight_neiborhood)) && val >= max(max(eight_neiborhood_next)))...
%                          || (val < 0 && val <= min(min(eight_neiborhood_prev)) &&...
%                          val <= min(min(eight_neiborhood)) && val <= min(min(eight_neiborhood_next))))
                     
%                         ((val > 0 && sum(sum(val >= eight_neiborhood_prev))==9 &&...
%                         sum(sum(val >= eight_neiborhood))==9 && sum(sum(val >= eight_neiborhood_next))==9)...
%                          || (val < 0 && sum(sum(val <= eight_neiborhood_prev))==9 &&...
%                          sum(sum(val <= eight_neiborhood))==9 && sum(sum(val <= eight_neiborhood_next))==9))


%                             abs(val) > threshold ;
%                             (val > 0 && sum(sum(val >= eight_neiborhood_prev))==0 ;
%                             sum(sum(val >= eight_neiborhood))==0 ;
%                             sum(sum(val >= eight_neiborhood_next))==0) ;
%                             (val < 0 && sum(sum(val <= eight_neiborhood_prev))==0 ; 
%                             sum(sum(val <= eight_neiborhood))==0 ;
%                             sum(sum(val <= eight_neiborhood_next))==0) ;
                     
                  
                end
            end
        end
     end
 






