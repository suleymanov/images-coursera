function [I_reduced] = reduce_levels(I, num_levels)
	% I - gray image matrix
	% num_levels - number of intensity levels (power of 2, from 2 to 256)
	
	% input error check
	if (num_levels < 2) || (num_levels > 256)
		disp("Number of intensity levels should be at least 2!");
		return
	end;
	check = num_levels;
	while check >= 2
		if mod(check, 2) != 0
			disp("Number of intensity levels should be a power of 2!");
			return
		end;
		check = check / 2;
	end;
	if check != 1
		disp("Number of intensity levels should be a power of 2!");
		return
	end;
	sz = size(I);
	if (sz(1) < 2) || (sz(2) < 2) || (length(sz) != 2)
		disp("Bad image matrix!")
		return
	end;
	
	# code
	I_reduced = zeros(sz);
	q_step = 256 / num_levels;
	I_reduced = floor(I ./ q_step) .* q_step;
	% for i = 1:sz(1)
		% for j = 1:sz(2)
			% I_reduced(i, j) = floor(I(i, j) / q_step) * q_step;
		% end;
	% end;
end