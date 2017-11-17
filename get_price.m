function [ price ] = get_price(name,set)
% Takes the name of a card and the 3 letter set designation to return the
% price of that card, retrived from tcgplayer.com.  

    %% convert 3 letter set designation to set name needed in url
    if set ==     'KLD'
        setname = 'kaladesh';
    elseif set == 'EMN'
        setname = 'eldritch-moon';
    elseif set == 'SOI'
        setname = 'shadows-over-innistrad';
    end
    
    %% Convert name to url form
    if strcmp(name,'Nibilis of Dusk')
        name = 'Niblis of Dusk';
    end
    if strcmp(name,'Furtive Homonculus')
        name = 'Furtive Homunculus';
    end
    if strcmp(name,'Creeping Dead')
        name = 'Creeping Dread';
    end
    namel = lower(name);
    
    namen = strrep(namel, ' ', '-');
    
    %% Access html data based on created url
    url = ['http://shop.tcgplayer.com/magic/' setname '/' namen];
    
    html = urlread(url);

    %% Extract price from html
    before = strfind(html, '<td class="priceGuidePricePointData');
    before = before(1)+37;

    firsthalf = html(before:end);

    dollarsign = strfind(firsthalf, '$');
    dollarsign = dollarsign(1)+1;

    afterdollar = firsthalf(dollarsign:end);

    pricestr = strfind(afterdollar, '</td>');
    pricestr = pricestr(1)-1;

    prices = afterdollar(1:pricestr);

    price = str2num(prices);
end

