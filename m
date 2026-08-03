Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8012B430CE4;
	Mon,  3 Aug 2026 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781133; cv=none; b=JmkepoObX5IM9+SP2GbST84zGjfBmKFUh4si72al1fwJI6+KT3JijrIK6vUPzP87VDOIzasJVKHy4asxHzG4Ti6Pk/+0vn//cNN+O0ump7rQe0eLlOHs6oBm31mbENCbNZFJ8FUKWo/SJ1bJBAd5UFpuBYtQ+EJgVDxtIFWGwVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781133; c=relaxed/simple;
	bh=zMrE+EX7f44Sm/zeH5SL8rjdM6C6GVy/hCVzNqsiOjs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X72KQhfYK6DqIZJEhsJsZ8kcer8/U7BzsTLV1VmPsv6xt7KdJGVYBMxuWZGgUvjuaFxVkZ9P1qO8GxFfTR7ji3IyQJ6M3b35DGm5HUeNz3ePuo45SEuZvUjq0RFlwOCkVNuWCHkPs952u5RwGYlcPeA2+9mrZTJXvHuLmbnlmlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+r+GkMo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+r+GkMo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E031F000E9;
	Mon,  3 Aug 2026 18:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785781126;
	bh=ZqLmmjRU0d3XjeENeGjTbEhUIc5XwnaxVlvfaeiX37E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h+r+GkMoRVz/NeSXsoelAbAGwqXuhtqiu0DK28coGjatOfxxYylqIQdWbcf+Y8o1N
	 ZGvs5XPfeKCOfCe3ub/iY+taeoQbNKkUQiGy6wC9vR92jgmKRzUYX1CPZPOIX4spw+
	 6CZQypnnIh8FpNwZ7tgn04s+OkKfkSLcv6SLgIKapoSAfVOPqukqWC6GqJjp0E/c2b
	 1Mc4zwd50j5K+Ex9QLCbrtPLZUvhqrN8PD9J2ZTWDxKid80/xFsJBsw5gcDK7h8QqI
	 pGOTp9Zg1tTmgz5JT0EGFlToSsWTeSf4CYuahYiGE3EgcxKkX5IxXDMGEZscj8PKT+
	 xgIzzm/UpawEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] clk: sunxi-ng: add cycle-masking divider
 (maskdiv) clock type
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SnVhbiBNYW51ZWwgTMOzcGV6IENhcnJpbGxv?= <juanmanuellopezcarrillo@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260803180755.288793-2-juanmanuellopezcarrillo@gmail.com>
References: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
 <20260803180755.288793-2-juanmanuellopezcarrillo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 18:18:45 +0000
Message-Id: <20260803181846.57E031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] `ccu_maskdiv_set_rate` recalculates a different mask factor (`M`) =
than what `ccu_maskdiv_determine_rate` initially chose, silently programmin=
g the hardware to a lower frequency than negotiated.
- [High] `ccu_maskdiv_determine_rate` ignores the `CLK_SET_RATE_NO_REPARENT=
` flag, potentially causing unintended clock reparenting.
--

--- Patch [1]: [PATCH v2 1/3] clk: sunxi-ng: add cycle-masking divider (mas=
kdiv) clock type ---
commit cf0833bab086c6beae6c2b221f361043441cc718
Author: Juan Manuel L=C3=B3pez Carrillo <juanmanuellopezcarrillo@gmail.com>

clk: sunxi-ng: add cycle-masking divider (maskdiv) clock type

This commit adds a cycle-masking divider for the A523/T527 GPU clock.
It masks M pulses out of every 2^width parent cycles instead of using a
linear divider. It also adds custom determine_rate and set_rate functions
to support this behavior.

> diff --git a/drivers/clk/sunxi-ng/ccu_maskdiv.c b/drivers/clk/sunxi-ng/cc=
u_maskdiv.c
> new file mode 100644
> index 0000000000000..4ad49d51405b3
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_maskdiv.c

[ ... ]

> +static int ccu_maskdiv_determine_rate(struct clk_hw *hw,
> +				      struct clk_rate_request *req)
> +{
> +	struct ccu_maskdiv *cmd =3D hw_to_ccu_maskdiv(hw);
> +	unsigned long best_rate =3D 0, best_parent_rate =3D 0;
> +	struct clk_hw *best_parent =3D NULL;
> +	unsigned int best_m =3D UINT_MAX;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < clk_hw_get_num_parents(hw); i++) {
> +		struct clk_hw *parent =3D clk_hw_get_parent_by_index(hw, i);

[Severity: High]
Does this iteration need to respect the CLK_SET_RATE_NO_REPARENT flag?

Unlike other sunxi-ng multiplexers that use ccu_mux_helper_determine_rate(),
this loops unconditionally across all available parents. If a driver specif=
ies
CLK_SET_RATE_NO_REPARENT, would this silently ignore it and potentially cau=
se
unintended clock reparenting?

> +		unsigned long parent_rate, new_rate;
> +		unsigned int m;

[ ... ]

> +static int ccu_maskdiv_set_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long parent_rate)
> +{
> +	struct ccu_maskdiv *cmd =3D hw_to_ccu_maskdiv(hw);
> +	unsigned int m;
> +	unsigned long flags;
> +	u32 reg;
> +
> +	m =3D ccu_maskdiv_find_m(parent_rate, rate, cmd->width);

[Severity: High]
Does ccu_maskdiv_set_rate() end up programming a different mask factor (M)
than what ccu_maskdiv_determine_rate() initially chose?

Because ccu_maskdiv_calc_rate() truncates the remainder (e.g. 1000 * 13 / 16
=3D 812), feeding the result back into ccu_maskdiv_find_m() evaluates this
truncated output again. For example, 812 * 16 / 1000 =3D 12, instead of the
original 13.

Could this inappropriately increase M and silently program the hardware to
a lower frequency than what was negotiated?

> +
> +	spin_lock_irqsave(cmd->common.lock, flags);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803180755.2887=
93-1-juanmanuellopezcarrillo@gmail.com?part=3D1
