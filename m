Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028F03ACF00
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445814; cv=none; b=jxmgT/vKIZBhiotEBCJmXal2iN2NtlM9d46IhVI1wRo7EhMHB8S9JbzpsAr7ilHzFUyb9r3WX/g3Bwm/xMfctpwsmdBdc9sJQSHGy92gRhPGWV2cAfHT7/bo4SYPt2WiVENBD01sg7UIR6M7vtvzPrUhPCobpNFBfXAKyyDW5h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445814; c=relaxed/simple;
	bh=qOAxx42w/VQPDZ7xnlqChWGENoRiPyJgnbMDQf311dQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m2e767KvzYEiogma5Fa4Xt7hAl9wbMy/dttSJBKSuY/+MULbIJQhQfwwLFCJY0lT2YhZeJhV+zLIv+S8ZWt1XtGVRVHKk5GUvj/KjFKQoSNW3lrLOac6G6LfAsdSbSTuX6RE4xRoWypZ5JAw5CDyVgKenn3aZsRnmOQeQuLRhd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOUw0dUm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOUw0dUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5FC1F00ADF;
	Fri, 22 May 2026 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445812;
	bh=Li9A73LlpD2vbkxDmIhS14b2txsiXdrnRUvXpmCIzqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UOUw0dUmAwJa4FAr1lXvnT3G4jLvt7kcvGjIt0knHMuzpSEP/KthXyOP1zu+c/aa5
	 RKHiQoBR93ZAYgPCsL1azuFAp4cx1vJx+L7rdbt+0BZFRh1Cue9Iqf6qrnk8cOaPCJ
	 APNZaeKrDtWsSLVWeqmj0gBgXLdnk4016+LFP3r3ZoNKfWNe9o7m3iiw8l6ArX4JVB
	 yA5lHp/4T1E/XHp06OjD3IztOBTBg0+SGTVb1v6oauFM88QG2CY1BI3f1ytuirZPeg
	 K2X4mYmiQ1bTQFRw5LF/ZPXeI+UJgw341rujByaY5WaTB8TqpJmzUpdgfZaa1zK1eN
	 2jIXhgFfV4DBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] ASoC: sunxi: sun4i-spdif: Use guard() for spin
 locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260522095401.72915-2-phucduc.bui@gmail.com>
References: <20260522095401.72915-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 10:30:12 +0000
Message-Id: <20260522103012.BC5FC1F00ADF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] If `regmap_read()` fails in `sun4i_spdif_get_status()`, the lo=
cal variable `reg` is left uninitialized, leading to a kernel stack informa=
tion leak.
--

commit b943afeae6523774115b9e6d838ae64e650c95c5
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: sunxi: sun4i-spdif: Use guard() for spin locks

This commit refactors the sun4i-spdif driver to use the scoped_guard() macro
for managing spin locks. The changes are intended as refactoring only, with
no functional changes to the driver's behavior.

> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index c2ec19437cd7a..89eccc83a1301 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -427,24 +427,21 @@ static int sun4i_spdif_get_status(struct snd_kcontr=
ol *kcontrol,
>  	struct snd_soc_dai *cpu_dai =3D snd_kcontrol_chip(kcontrol);
>  	struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai);
>  	u8 *status =3D ucontrol->value.iec958.status;
> -	unsigned long flags;
>  	unsigned int reg;
> =20
> -	spin_lock_irqsave(&host->lock, flags);
> +	scoped_guard(spinlock_irqsave, &host->lock) {
> +		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);

[Severity: Critical]
This is a pre-existing issue, but does this leak uninitialized kernel stack
memory to userspace?

The regmap_read() function can fail and return an error code without modify=
ing
the reg variable. Since the return value isn't checked, the uninitialized
contents of reg are unpacked into the status array:

		status[0] =3D reg & 0xff;
		status[1] =3D (reg >> 8) & 0xff;
		status[2] =3D (reg >> 16) & 0xff;
		status[3] =3D (reg >> 24) & 0xff;

This array is subsequently copied back to userspace by the ALSA control
subsystem.

Should the return value of regmap_read() be checked, and an error returned
if it fails?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522095401.7291=
5-1-phucduc.bui@gmail.com?part=3D1
