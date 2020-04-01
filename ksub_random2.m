function [ a, seed ] = ksub_random2 ( n, k, seed )

%*****************************************************************************80
%
%% KSUB_RANDOM2 selects a random subset of size K from a set of size N.
%
%  Discussion:
%
%    This algorithm is designated Algorithm RKS2 in the reference.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 December 2003
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herber Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%    A Bebbington,
%    A simple method of drawing a sample without replacement,
%    Journal of Applied Statistics,
%    Volume 24, 1975, page 136.
%
%  Input:
%
%    integer N, the size of the set.
%
%    integer K, the size of the subset, between 0 and N.
%
%    integer SEED, a seed for the random number generator.
%
%  Output:
%
%    integer A(K), the indices of the selected elements.
%
%    integer SEED, the updated seed for the random number generator.
%
  if ( k < 0 || n < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUB_RANDOM2 - Fatal error!\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  K = %d\n', k );
    fprintf ( 1, '  but 0 <= K <= N is required!\n' );
    error ( 'KSUB_RANDOM2 - Fatal error: Illegal K.' );
  end

  if ( k == 0 )
    a = [];
    return;
  end

  need = k;
  have = 0;

  available = n;
  candidate = 0;

  while ( true )

    candidate = candidate + 1;

    [ r, seed ] = r8_uniform_01 ( seed );

    if ( available * r <= need )

      need = need - 1;
      have = have + 1;
      a(have) = candidate;

      if ( need <= 0 )
        break;
      end

    end

    available = available - 1;

  end

  return
end