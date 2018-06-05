function [ path ] = pirm(A , tmp,i)
    A_set = [1,1e9,1e9,1e9,1e9,1e9];
    A_set(1) = 1;
    k=1;
    tic;
    while k < i      
        for t = 1 : k
            n = A_set(t);
            [~,index] = sort((-A(n,:)),'descend');
            vul_tmp(t)= A(n,index(1));
        end
        [~,index] = sort((-vul_tmp),'descend');
        n = A_set(index(1));
        [~,index] = sort((-A(n,:)),'descend');
        tmp( n , index(1)) = 1;
        tmp(index(1),n) = 1;
        A(:,index(1)) = 1e9;
        A(index(1),n) = 1e9;
        k = k+1;
        A_set(k) = index(1);
    end
    toc
    path = tmp ;
end