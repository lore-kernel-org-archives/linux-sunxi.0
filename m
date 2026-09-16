Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802574A7CBE
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 18:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583441; cv=none; b=PLkDWIQWPqgywyB5Rj1cjeGrUWJ8w2PsPhSVkjW+P6gcJjG62bJgW2Va0QtwxG5ycubrq5wwH4swoF10V9HLRba3nMHec0tzdVXSJ6hG8EHpvVCO1S0H31s7R2Xbgs4DnRYNnhDyB9eyYwenvOw6HzV+bh+w+UuitItnUGdYBuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583441; c=relaxed/simple;
	bh=7MHqAwNgGsrzGPY1ULnWe89/lbPKMbNYvrhyvOLFdZ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jLCRNRPtiEnK+T16rhUoSyyA38gQ2wnp3p1NU7Huog46jeke/2HYxqhU8y3NUaqls8xMpyT+Z1sSUFuQMuat5u0YRgDM9z6ZuQB5cQjMF4XEvCtXPQ/Hu3jXv6gEyfQDT35eTRNQs7Uv0xFVt3vA2vGW9E6THVh6FxIfrTgXx8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aO7B7iAL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aO7B7iAL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C6D1F000FF;
	Wed, 16 Sep 2026 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789583428;
	bh=IzUBuV8qbT4IwZrzSCAtHle0yj8X5xuvuOIcO3lUi9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aO7B7iALBcbvUcAuxFs00Z1aXfagU0kUPPp0AYhxrdWH4tM/zQOSRDkZwpGusP3v3
	 ITWu1BH270boKZKiZOQ82aN848pRmtoMaUwiV8lCJpnW8Z6qZVXXLmZwHkdO/ES1dK
	 3pX/c0wZpBALRairlryFSbggE7jCars9DzBu8sDVIljzPGtc2x31+cnapcgxIVUELs
	 AIxFhO+zsm95cedhWJzKR24Iz+87pVASeYmMRPjITLPlI3cTPjjd1eeJTvTqhe172S
	 P7fdTvRMGiI0BSH/wpD0abvtdVBOVnuh8LICeFc+2gvLbWTV+aF0npZf69K+1/pwnU
	 RFhlSevq58OrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/sun4i: Fix pdev reference leak in
 sun8i_r40_tcon_tv_set_mux()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260916182412.2091681-1-vulab@iscas.ac.cn>
References: <20260916182412.2091681-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 18:30:27 +0000
Message-Id: <20260916183028.17C6D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/sun4i: misapplied patch causes build failure
--

commit 576ab0ea69ae3e401d6153bcb00f1e660850ae75
Author: Wentao Liang <vulab@iscas.ac.cn>

drm/sun4i: Fix pdev reference leak in sun8i_r40_tcon_tv_set_mux()

This commit attempts to fix a claimed reference leak in the success path of
sun8i_r40_tcon_tv_set_mux(). However, the patch modifies the wrong function
and introduces a build failure.

Fixes: 0305189afb32 ("drm/sun4i: tcon: Add support for R40 TCON")
Cc: stable@vger.kernel.org

> drm/sun4i: Fix pdev reference leak in sun8i_r40_tcon_tv_set_mux()
>=20
> of_find_device_by_node() takes a reference to the TCON TOP device
> which the error paths release, but the success path returns without
> doing so.  Drop the reference before returning success.

The commit message states it fixes a leak in sun8i_r40_tcon_tv_set_mux(),
but the patch actually modifies sun4i_tcon_init_clocks().

Looking at sun8i_r40_tcon_tv_set_mux() in the baseline, the success path
appears to fall through to the out_put_device label, which already correctly
drops the reference:

out_put_device:
        put_device(&pdev->dev);

        return ret;

Could the commit message be referencing an issue that does not exist in
this tree, or was the patch misapplied?

> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index bf405a2aa3249..b5a85738876ee 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -808,6 +808,8 @@ static int sun4i_tcon_init_clocks(struct device *dev,
>  		}
>  	}
> =20
> +	put_device(&pdev->dev);

[Severity: Low]
Does this code compile? The variable pdev is undeclared in the scope of
sun4i_tcon_init_clocks(), which causes a build failure.

> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916182412.2091=
681-1-vulab@iscas.ac.cn?part=3D1
