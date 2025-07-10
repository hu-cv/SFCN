function  VV = normVector(V)

n = size(V,2);
VV =zeros(size(V));
for i = 1 : n
    if norm(V(:,i))~=0
        k = norm(V(:,i));
        VV(:,i) = V(:,i)/k;
        VV(:,i) = VV(:,i)-mean(VV(:,i));
    else
        VV(:,i) = V(:,i)-mean(V(:,i));
    end
end