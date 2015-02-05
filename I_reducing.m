function [I_reduced] = I_reducing(I, block_sz)
	% I - gray image matrix
	% block_sz - averaging block size (integer > 2)
	
	% input error check
	sz = size(I);
	if (sz(1) < 2) || (sz(2) < 2) || (length(sz) != 2)
		disp("Bad image matrix!")
		return
	end;
	if (block_sz < 3) || (block_sz > min(sz))
		disp("Bad block size!")
		return
	end;
	
	# code
	block_half = floor(block_sz / 2);
	I_reduced = zeros(sz);
	# for i = 1:sz(1)
		# for j = 1:sz(2)
	for i = (1 + block_half):block_sz:sz(1)
		for j = (1 + block_half):block_sz:sz(2)
			i_lo = max(1, i - block_half);
			i_hi = min(sz(1), i + block_half);
			j_lo = max(1, j - block_half);
			j_hi = min(sz(2), j + block_half);
			I_reduced(i_lo:i_hi, j_lo:j_hi) = ...
					floor(mean(mean(I(i_lo:i_hi, j_lo:j_hi))));
		end;
	end;
	
	I_reduced = uint8(I_reduced);
end