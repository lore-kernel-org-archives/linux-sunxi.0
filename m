Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1074D4908D1
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Jul 2026 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784982992; cv=none; b=p9HlpEnJmIdbR7rPaEKcjoFtTLxhhiDmpqfj1gHdSzvK3HjuGQ57COvYMMP2VLAjaXn3/b0ScDnjwLKSYAjE9Yvh2XZBA6+4hhgoXe1pfYw7o60wXdqes3bE3kj0XtcBqyU89bl8PyGZecLBXaQVeOwi4TcNK0RwpfhMUkJ01Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784982992; c=relaxed/simple;
	bh=WRwuJuE6NTOlANJaAY2hmm+l28VFltL6HgcQIWPmMuY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d4az7K6FPDmSR8TfAXAo1ETA/HstAh1aOc2z2CJdqKba5xy39eqbw5+dQqFxbtDo1GAxOl5OSiywlcFzwUS/IjQK2qg2k45HVmG9KxcbUEKvYbeQf1LurQKMGtkMQNyWHW46i9bNZ/eQLluVp4v7flVUU4QPS76voWjS51jxWV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7ahVMZe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7ahVMZe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9542D1F000E9;
	Sat, 25 Jul 2026 12:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784982990;
	bh=DoNe7esny0LVJn3X4ow9Ey7Yz1CXHYQPYRpAcHkvB20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X7ahVMZe7LqruVc7gldPuvLw1U+TglWGlFAHd8vc9ksucBMs+GObwWrUq8GkZdiYH
	 3YFVeodF0cTVdapdEKWWj1RoBywuGxbXiQL5ORIZqU9MFFy650B75s68IuQ73TrgZC
	 cvS2QQKpX1qiRl+3JrxMLn98FRARbBVD8LfOsU9+nph69LTrvHelXyACuUt2M11WFs
	 YmYu1LGVnxemJ2iJy7Pn8jq9i+FSR3iE9on0NFzhc8ogHLjWPRrko52NEUQfVq7tLm
	 aO07GqB9Ni9PPnOziXxpQ2r0f2yLJq6B7/R53CANfRBLCybkXFJsYGO1hJKUsrk+av
	 z1J9UUQ9AFvgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: Change NKMP algorithm for finding
 factors
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T25kxZllaiBKaXJtYW4=?= <megi@xff.cz>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260725122645.2270876-1-megi@xff.cz>
References: <20260725122645.2270876-1-megi@xff.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 12:36:30 +0000
Message-Id: <20260725123630.9542D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Failure to initialize output struct fields in `ccu_nkmp_find_best`=
 leads to writing stack garbage to hardware registers.
- [High] The new algorithm divides by the parent clock rate, leading to a k=
ernel panic if the parent rate is 0.
- [High] Regression in rate clamping: the new algorithm fails to return the=
 closest valid rate when the requested rate is outside the achievable bound=
s.
- [Medium] The new approximate rate search algorithm skips valid and better=
 clock multipliers by only evaluating the truncated `_n`.
--

--- Patch [1]: [PATCH] clk: sunxi-ng: Change NKMP algorithm for finding fac=
tors ---
commit d6ad51cc524475bf9f5a9b1a358305bd319886bf
Author: Ondrej Jirman <megi@xff.cz>

clk: sunxi-ng: Change NKMP algorithm for finding factors

This patch optimizes the NKMP algorithm for finding clock factors by reduci=
ng=20
unnecessary iterations. It introduces an approach that respects physical So=
C=20
restrictions and avoids brute-forcing all possibilities.

> diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_n=
kmp.c
> index 25efb5b376075..c39b198914316 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkmp.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkmp.c

[ ... ]

> @@ -32,40 +32,70 @@ static unsigned long ccu_nkmp_calc_rate(unsigned long=
 parent,
>  static unsigned long ccu_nkmp_find_best(unsigned long parent, unsigned l=
ong rate,
>  					struct _ccu_nkmp *nkmp)
>  {
> +	unsigned long _k, _m, _p;
> +	unsigned long max_p =3D rate >=3D 240000000 ? 1 : nkmp->max_p;
> +	unsigned approx;
>  	unsigned long best_rate =3D 0;

[ ... ]

> +	for (approx =3D 0; approx <=3D 1; approx++) {
> +		for (_p =3D nkmp->min_p; _p <=3D max_p; _p <<=3D 1) {
>  			for (_m =3D nkmp->min_m; _m <=3D nkmp->max_m; _m++) {
> +				u64 nk =3D (u64)rate * _m * _p;
> +				unsigned long nk_rem =3D do_div(nk, parent);

[Severity: High]
Does this code handle the case where parent is 0?

In the Linux clock framework, an orphaned clock or one with an absent parent
will have a parent rate of 0. Performing a division on such a clock will
trigger a division-by-zero hardware exception here.

> +
> +				if (nk_rem !=3D 0 && !approx)
> +					continue;
> +
> +				if (nk < 10 || nk > 88)
> +					continue;
> +
> +				for (_k =3D nkmp->min_k; _k <=3D nkmp->max_k; _k++) {
> +					if (approx) {
> +						u64 _n =3D (u64)rate * _m * _p;
> +						unsigned long tmp_rate;
> +
> +						do_div(_n, parent * _k);

[Severity: High]
Can parent * _k evaluate to 0 if parent is 0, leading to a division-by-zero
exception here as well?

[Severity: Medium]
Will calculating _n via integer division skip valid and better multipliers?

Because the target rate is often already truncated by a previous round rate
operation, calculating _n analytically can yield an _n that is exactly 1 le=
ss
than the optimal value. By failing to check _n + 1, this logic could lock in
a suboptimal configuration.

> +
> +						if (_n < nkmp->min_n || _n > nkmp->max_n)
> +							continue;

[Severity: High]
Is it intended to silently skip configurations that exceed hardware bounds
instead of clamping to nkmp->max_n?

When drivers request an unachievably high clock rate to configure a clock
to its physical maximum, this logic explicitly rejects the out-of-bounds _n.

This results in the function finding zero valid configurations and returning
a rate of 0, which breaks clock initialization for drivers relying on stand=
ard
maximum-rate clamping behavior.

> +
> +						tmp_rate =3D ccu_nkmp_calc_rate(parent,
> +									      _n, _k,

[ ... ]

> -	nkmp->n =3D best_n;
> -	nkmp->k =3D best_k;
> -	nkmp->m =3D best_m;
> -	nkmp->p =3D best_p;
> -
>  	return best_rate;
>  }

[Severity: High]
If a valid combination cannot be found, could this return 0 without
initializing the nkmp fields?

If the clock framework calls ccu_nkmp_set_rate() with a rate that cannot
be satisfied, returning 0 leaves the multiplier and divider fields as
uninitialized stack variables.

These random stack values are then shifted and written directly into the
hardware clock configuration registers:

drivers/clk/sunxi-ng/ccu_nkmp.c:ccu_nkmp_set_rate() {
    ...
    reg |=3D ((_nkmp.n - nkmp->n.offset) << nkmp->n.shift) & n_mask;
    reg |=3D ((_nkmp.k - nkmp->k.offset) << nkmp->k.shift) & k_mask;
    reg |=3D ((_nkmp.m - nkmp->m.offset) << nkmp->m.shift) & m_mask;
    reg |=3D (ilog2(_nkmp.p) << nkmp->p.shift) & p_mask;
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725122645.2270=
876-1-megi@xff.cz?part=3D1
