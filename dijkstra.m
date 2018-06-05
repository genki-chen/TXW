function [ path , way_len ] = dijkstra(B , tmp,i_B)
    tic
    way_len(1) = 0;
    for n = 2 : i_B
        way_len(n) = inf;
    end
    B_set = zeros(1,i_B);
    B_set(1) = 1;
    for t = 1 : i_B
        for n = 1 : i_B
            if way_len(n) > way_len(B_set(t)) + B(B_set(t),n)
                way_len(n) = way_len(B_set(t)) + B(B_set(t),n);
                tmp( : , n ) = 0;
                tmp(B_set(t),n) = 1;
            end
        end
        [~,index] = sort((-way_len),'descend');
        B_set(t+1) = index(t);
    end
    toc
    path = tmp;
end