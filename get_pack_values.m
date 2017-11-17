function [ list_of_pack_values ] = get_pack_values( set , packs )
%Takes a set and a # of packs to simulate, and returns a list of the values
%of those packs. Uses get_price.m and get_pack.m functions

%Column 1 of output is simulated pack values
%Column 2 is pack sim time
%Column 3 is # of new cards in each pack

    %% init a hashmap to handle card prices
    card_price_map = containers.Map;
    
    list_of_pack_values = zeros(packs,3);
    
    for i = 1:packs
        %% Simulate a pack
        tic
        pack = get_pack(set);
        
        prices = zeros(length(pack),2);
        
        new = 0;
        %% Lookup card in hashmap, if it isn't there, grab data online and add to hashmap
        for j = 1:length(pack)
            prices(j,1) = cell2mat(pack(j,1));

            name = cell2mat(pack(j,2));
            set = cell2mat(pack(j,3));
            if isKey(card_price_map,name)
                prices(j,2) = card_price_map(name);
            else
                new = new+1;
                price_card = get_price(name,set);
                prices(j,2) = price_card;
                card_price_map(name) = price_card;
            end
        end
        total_value = 0;
        
        %% multiply price by amount for each card
        for j = 1:length(prices)
            total_value = total_value + (prices(j,1)*prices(j,2));
        end
        %% add pack total to final output list
        time = toc;
        list_of_pack_values(i,1) = total_value;
        list_of_pack_values(i,2) =time;
        list_of_pack_values(i,3) =new;
        new = 0;
        fprintf('Pack %.0f of %.0f packs simulated\n',i,packs)
    end
end

%% could do # of new cards as well