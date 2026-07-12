Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE835374E74;
	Sun, 12 Jul 2026 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783844026; cv=none; b=mq/Vvr3lbq2GL3+GBUq8/u7eUYLs9GQD/KPbo7g42LXhE7vpAYYSPLreYi/Ga0zTsOsd7D2LbcsiRxP2H0ag+9F969GhEo/+MBwiqu2vYrMKFHjObK953qY4fp7lBmA1yucaJrsImCqOuFJY+urkuNmTH2p34KB4DH5mP5g5QnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783844026; c=relaxed/simple;
	bh=5DU46VdZLpGnjfeYvbn0hDNYHhkgzgsf/Dehu/HAXW0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r8QLxXXFpYjrJkizHQNIg90Dl4FHROVAhvKU/Gmk7OcmO/+Kc1XwNuqHo0xn/Jtc6jEngdt6js/Qxtf6Qj4/62tyrsUKs8b29SRloZKHyA0vlTJ+A5EKdNHqA1if9t1A+Flk6sp1NcWz9siwvXNOUOGVHr0yisNrbwTE4ZLWku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8+zjsSC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8+zjsSC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7533A1F00A3A;
	Sun, 12 Jul 2026 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783844024;
	bh=TnJaVAAMP7e6GtzzDzJCm35DMXPxdXgOG3RpeUfryv4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e8+zjsSC2XHSELDPwjv4lNHpOEp/oYOLIKIP8obAvxzE04D7+jC2HNHjUMrjyhEY/
	 uCA3haWCe9MJX/JDh60kyP8TspTxdK8l5/THSZZ0zYLF2Ivd90QfWEkuJcWThOL8x+
	 2QJOQtr2ty4QPNZfD5nSdwyVjqt/98BIsvOe0Z5/YeFS5hKU6cuaoEzROpkffxVTXu
	 HQtBuO2JMAraYqeODkvesNSfDoEvuV84QoxwTBY9U0RfwcAQtIL7ql8Gw2FMUnKkAH
	 h+MLwyI+0uA7LshAgIDN543RL0OfkdqoA1bssLizaZyVu0gATT1/sGug/d0N91ry0+
	 qi4P0jPVKiD2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] clk: sunxi-ng: a733: Add reset lines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260711-a733-clk-v2-8-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
 <20260711-a733-clk-v2-8-974d188cbe0c@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 08:13:44 +0000
Message-Id: <20260712081344.7533A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `sun60i_a733_ccu_resets` array is missing the `const` qualifier.
--

--- Patch [8]: [PATCH v2 8/8] clk: sunxi-ng: a733: Add reset lines ---
commit 4ea86ec36599a9ad729bf576a38c2f6cad725b56
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: sunxi-ng: a733: Add reset lines

This patch adds the reset lines for the Allwinner A733 SoC. The reset contr=
ol
bits are integrated into the main CCU driver using the sunxi-ng ccu_reset
framework, enabling the CCU to function as a reset controller.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 48d7c0395ae83..ff64c35206d2d 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[ ... ]

> @@ -2156,11 +2157,136 @@ static struct clk_hw_onecell_data sun60i_a733_hw=
_clks =3D {
>  	.num	=3D CLK_FANOUT3 + 1,
>  };
> =20
> +static struct ccu_reset_map sun60i_a733_ccu_resets[] =3D {

[Severity: Low]
Is it possible to add the const qualifier to the sun60i_a733_ccu_resets arr=
ay?

Without the const qualifier, this reset map array is placed in the mutable
.data section instead of the read-only .rodata section. Because it is later
assigned to the .resets member of sunxi_ccu_desc which expects a const poin=
ter,
adding const here would save mutable memory and slightly improve security
hardening.

> +	[RST_BUS_ITS_PCIE0]		=3D { 0x574, BIT(16) },
> +	[RST_BUS_IOMMU0_SYS]		=3D { 0x58c, BIT(16) },

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711-a733-clk-v=
2-0-974d188cbe0c@pigmoral.tech?part=3D8
