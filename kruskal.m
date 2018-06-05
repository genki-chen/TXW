function [ path ] = kruskal(A , tmp,i)
    tic
    for n = 1 : i
        [~,index] = sort((-A(n,:)),'descend');
        vul_tmp(n) = A(n,index(1));
    end
        [~,index] = sort((-vul_tmp),'descend');
        n =index(1);
        [~,index] = sort((-A(n,:)),'descend');
        tmp( n , index(1)) = 1;
        tmp(index(1),n) = 1;
        A(n,index(1)) = inf;
        A(index(1),n) = inf;
        A_set(1) = n;
        A_set(2) = index(1);
        t = 3;
    while t <=  i
        for n = 1 : i
            [~,index] = sort((-A(n,:)),'descend');
            vul_tmp(n) = A(n,index(1));
        end
        [~,index] = sort((-vul_tmp),'descend');
        n =index(1);
        [~,index] = sort((-A(n,:)),'descend');
        tmp( n , index(1)) = 1;
        tmp(index(1),n) = 1;
        A(n,index(1)) = inf;
        A(index(1),n) = inf;
        A_set(t) = index(1);
        for k = 1 : t
            A(A_set(k),A_set(t)) = inf;	
            A(A_set(t),A_set(k)) = inf;	
        end
        t = t+1;
    end
    toc	
    path = tmp ;
end