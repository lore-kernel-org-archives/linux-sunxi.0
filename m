Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5F3495515
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380125; cv=none; b=FhRuR9IClaPonM+ME0g/mB4ddyxcCHTH33nxmZ8CDvQHmPnaCyE+h/fxfnMPDzMhHYFg9Cvla5+PTkY6endAcga/4Z7ue2YwMqL3ShBTdMrF6h9qG54zW5CeJqIGadF2F3/kk9tymUUs/lgNHCcIz+oXJPrvbzLCrNGLoA2c4hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380125; c=relaxed/simple;
	bh=JkQwABjY6REGlMoRORCZYd+uEOjDQvUMSgQZZJAz3Jk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ebfhFOiTYN6QtZYUP3D3eJKWl2VRek12O0tV8MmrpuA4uCvuQJTm5kY0McKPyXY0TNYmNkpuc0K9clqxfLcJle8WnemwySgp1S7tA0mbG5DyhOgfehp7gDhoaNT8TOD1T2JoZT4OXwAPxiSNG7rl4gUmcDpZPrxolKWkxwwKZVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvxeZ3+o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvxeZ3+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871CA1F000E9;
	Wed,  2 Sep 2026 20:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788380118;
	bh=PRDqvu5buohiQx5VRUnN3JexJKY16y7Z1+ha3kQNmCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SvxeZ3+ocps6rKUxPRtGv+VeNRsc0DKlbIvV6y8lSJcxNJQP8Cnl3VQTSallMKeck
	 /Y3ULBN+OMpQJ/gsv+hUtgN3J3qHw2JtaJ6p/yqN87cH5hqIpmHs+a95G/LYeZf9aW
	 LZDb7+Tnom02HQtg18EEu94KnLOHFsljsor78WrAhEFoVWEBVksj4+oNkE+r5pXumy
	 Ichc/pZXoxqpEX9hkwt6qQdjyP5SFVPU83E7lq8kg+Olnyv0idkyA9CkFJzWrVM4n1
	 ZP4HB1U/N+0yGwwoOSTAOLY9lgxSaYNtvL0uil7YaGZS8+0wYvdy1zt/+QunODjypb
	 RTUOTEb7Kgxsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] media: synopsys: hdmirx: Use
 devm_of_reserved_mem_device_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260902200703.2016410-2-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
 <20260902200703.2016410-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 20:15:18 +0000
Message-Id: <20260902201518.871CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe deferral breakage due to overriding devm_clk_bulk_get_all() =
error code.
--

commit 9b061d6dbcd6ec9063d57f4982dfa6c2f6ec7b98
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()

This commit replaces the hand-rolled devres action for releasing reserved
memory with devm_of_reserved_mem_device_init(), which handles the cleanup
automatically.

> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 25f8ca0d6d946..7c6acc6d7e882 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -2265,11 +2265,6 @@ static const struct hdmirx_cec_ops hdmirx_cec_ops =
=3D {
>  	.read =3D hdmirx_readl,
>  };
> =20
> -static void devm_hdmirx_of_reserved_mem_device_release(void *dev)
> -{
> -	of_reserved_mem_device_release(dev);
> -}
> -
>  static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
>  {
>  	struct device *dev =3D hdmirx_dev->dev;

[Severity: High]
This isn't a bug introduced by this patch, but does this code break probe
deferral?

Looking at hdmirx_parse_dt() in snps_hdmirx.c, when devm_clk_bulk_get_all()
fails, the negative error code is discarded:

	hdmirx_dev->num_clks =3D devm_clk_bulk_get_all(dev, &hdmirx_dev->clks);
	if (hdmirx_dev->num_clks < 1)
		return -ENODEV;

If devm_clk_bulk_get_all() returns -EPROBE_DEFER because the clock providers
are not yet ready, returning -ENODEV masks the deferral request. This
converts a transient dependency delay into a permanent initialization failu=
re.

Should this code be updated to propagate the negative error code instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902200703.2016=
410-1-mukesh.ojha@oss.qualcomm.com?part=3D1
