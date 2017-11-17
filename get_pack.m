function [ list ] = get_pack(set)
% Takes the name of a card and the 3 letter set designation to return the
% price of that card, retrived from tcgplayer.com.  

    %% convert 3 letter set designation to set name needed in url
    if set ==     'KLD'
        url = 'http://www.magicdrafting.com/kaladesh-sealed?format=single';
    elseif set == 'EMN'
        url = 'http://www.magicdrafting.com/eldritch-moon-sealed?format=single';
    elseif set == 'SOI'
        url = 'http://www.magicdrafting.com/shadows-over-innistrad-sealed?format=single';
    end
    str = urlread(url);
    pat = '<[^>]*>';
    m = regexprep(str, pat, '');

    o = strfind(m, 'Download .DEK');
    o1 = o+15;

    n = strfind(m, '(function(i,s,o,g,r,a,m)');
    n1 = n - 7;

    cards = m(o1 : n1);

    size = length(cards);

    for i = 1:size
       if ~(isstrprop(cards(i), 'digit') || isletter(cards(i)) || isspace(cards(i)) || strcmp(cards(i), '\n') || cards(i) == '-' || cards(i) == ',') 
        cards(i) = '''';
       end
    end
    
    cards = strsplit(cards,'\n');
    
    list = cell(length(cards),3);
    
    for i = 1:length(cards)
        card = cards{i};
        cardsplit = strsplit(card);
        num = cardsplit{1};
        list{i,1} = str2num(num);
        name = strtrim(card(length(num)+1:end));
        list{i,2} = name;
        list{i,3} = set;
    end
end

