Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ADE35C183
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 04:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778733195; cv=none; b=Cq5V4k8MS1Y2c55TvneYJOvKk8gSO6PV0H9HY4SYOKQJYI2u5OOSuRrAMkXa33IiuYS712YkFU+AmUopYzA8e7TL8vmfz8ZsLeC+NhC7H2y82LWqZegWQUu4wcQPZ+poQqda2xXQGPHmYPY8wUNvQYfVJ8YZfxAhlS496Bg/ClA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778733195; c=relaxed/simple;
	bh=E+bxaxDj6dgShZLZ6Mc29OQVKsPceQp14DcYcwHWjoc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PQuV5rMMO90mlzzMvfLbjyAk37AzOBpQrbs97Y9IPTt5DU4iwKyYz1s7LXnTYXcHzM9IGbpgjaEZfcFEtP+OWrPsxsGhLzFXMwQWs+bzlRaG2jIAdCr67nx7HJT6oojAs77M2jR5IT8+nxXVWhsxV0LfjqlrP9rN5nWSXpxZLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2t0So0K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2t0So0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62222C2BCB7;
	Thu, 14 May 2026 04:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778733194;
	bh=E+bxaxDj6dgShZLZ6Mc29OQVKsPceQp14DcYcwHWjoc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=X2t0So0KXzc3/gGzosdGa04ATaheejYFndWBDWQzRyG2DdHLHBMt9qBnol40PwJPQ
	 KErGFJmwRqg3gn+yExNXNjs7uVjoohkB4Mba+W9F914vxA9v2EqcpTfOMvLfT/wCq4
	 pXISsXwzU/khR7pmG9VyJXEHWiUX8zXVKFPYRKvD5UEO48ZSSxqItfY305kBa7cb9W
	 HEpmUQh7ZwaNC506gCyv3P2q98dnMn7JvdtoqsGvU+I+6lbsPwyp9trStLH5Q5Nks8
	 oCJuyeQz6tNMUF87q2XkVTAWvgxKTSOtO3GJwRNxJZEFui5lneytCxPUTER+v6sDID
	 57vlZvdecEt3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260513105003.81880-1-phucduc.bui@gmail.com>
References: <20260513105003.81880-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 04:33:13 +0000
Message-Id: <20260514043314.62222C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware State / PM Violation leading to bus hang
--

commit 0686001584788d984a0f16403183bcad78fe4176
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: sun4i-spdif: Use guard() for spin locks

This commit refactors the locking in the sun4i-spdif driver to use the
guard() macro for spinlocks. It replaces manual spin_lock_irqsave() and
spin_unlock_irqrestore() calls with scope-based cleanup.

> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -427,10 +427,9 @@ static int sun4i_spdif_get_status(struct snd_kcontro=
l *kcontrol,
>  	struct snd_soc_dai *cpu_dai =3D snd_kcontrol_chip(kcontrol);
>  	struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai);
>  	u8 *status =3D ucontrol->value.iec958.status;
> -	unsigned long flags;
>  	unsigned int reg;
> =20
> -	spin_lock_irqsave(&host->lock, flags);
> +	guard(spinlock_irqsave)(&host->lock);
> =20
>  	regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);

While this issue isn't new to this patch, does this code risk a bus hang if
the device is runtime-suspended?

The regmap configuration lacks a cache, and these ALSA kcontrols can be
accessed by userspace at any time. If the audio stream is idle, the device
will be runtime-suspended and its APB bus clock (apb_clk) will be disabled.

Accessing the physical registers with the clock disabled will trigger an
asynchronous external abort.

Would it make sense to ensure the device is runtime-resumed (perhaps via
pm_runtime_get_sync() outside the spinlock guard) before touching the
hardware?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513105003.8188=
0-1-phucduc.bui@gmail.com?part=3D1
