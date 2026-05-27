Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E63B4E8C
	for <linux-sunxi@lists.linux.dev>; Wed, 27 May 2026 07:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779866021; cv=pass; b=RDIMWSYMUh8bkM8dQv64k0WcZo6OKQFFshxNDOLaAiQGbi78yEMtr/LUwz9zOefEvUHYbt1TLH02zOitA9W8y5TuLKfFpS0aRAdmwddjNmgmW3G0aBUn8Jr5gbSs9MOpoYCjLtfPtL5YolIESSJOWyTjGMYObTYoaojPJFSpThM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779866021; c=relaxed/simple;
	bh=TidELZ202z8VEX557DyBLbabOjBpspQL3YcKMb2p7d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQxc+/Gs+VkFzVJ6J6IVZD7V4dsJIbN5Cvf+ErRkOGz+bLoD78lRlSOIqlIMk7i9c5umiyp2KEDhLPdA+iaG8HOiAQhqsOY7ZvZyZECBe5IzgahXXl4j3E9Uhf27NyqUbz79DoreeJ6raY9ghP596H5Go65dz8EglWCn4784bWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCKXjkYB; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCKXjkYB"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8379e010b01so4923359b3a.1
        for <linux-sunxi@lists.linux.dev>; Wed, 27 May 2026 00:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779866019; cv=none;
        d=google.com; s=arc-20240605;
        b=kCzpi6fNSYUNsJQcebbESPlb/Xt2ZxUfgmCTEuNUqV8FqKXYB6lqHpTL7NNDYVozjX
         SvKRFiPOwBmpc7MTLs91vvZIzrH4h25c86QVPvWtcFNHl6tX+L6O4PxQqGtxF17vpfZK
         bIovSE5m1U3jdANsMGPKzYF9I1bu4pH6axd0aT4Or4pXrQEXXjpBp6DUCsU1KgwO5l3v
         /gAFc5gurxmg/VQFzb8vMToxvrXiP+311n/SuusZi7A5LyJ1VQg2f5QsVrDz4UsiPwI/
         3CUxhWptxRImHJtj5sFnTkblNxowI+mUYeaTGJNYT4gzhTC4lSxTHM4i9MD2pK3DhI5Q
         1hEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zaef/OUhxDQlU4bIcdlBeRXSMnGS13rIzxYDC71/Mgk=;
        fh=U+n5Fq69w/PMq99idJxDEXPiSmWO50BI14485+ZhAE0=;
        b=PCjuOkgxNZHHOsaz5ntQuO5c+1s9FyFNyjA42TjjF2ATbWKhcaplp0San4Ks7Fq7OI
         a5KYfit1fowHkCsyCBzq/qZynCSKz4FpOLP1HIQzMh3VFgXt+I8v1YF/jL936k1YuPC0
         a9V0bqPV+qRQ/pFEjhY2ptwnGFcUO8o1sTJy5fBTkjhT+Pd+RoW6JzoLTQFs8byS9dH5
         UwK9rG18wzXvzcbaGy1NTpOG4MEgpTffZpvQ+vxp/auKrNj0yvqeVcGMJu9k+PH+xaHZ
         1s+bUsdALoCJ07StnFb0/hV6Uww7uOucXybdTbNxZt6a8Y/WmJl2fxKWT1PKQP9Ikci8
         vFSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779866019; x=1780470819; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zaef/OUhxDQlU4bIcdlBeRXSMnGS13rIzxYDC71/Mgk=;
        b=GCKXjkYB6xfv9iZLTZPFH4R20U94hzTN6QKq7E6lhlatJSgKNiQVHmn+0lIqG/e3x9
         /COMkEIhapu5ZJ3BTu1bRcjZ2kznESmbnJ2jVmYSLbZrCipdBBjEHg87bJWaDFFppgLR
         bKa6Du3Bb6/8QydGqJftoDxQpvvniJBkYosNBjVXKR9EaWmTZHJjKXHCqH7F3lP44tDj
         D/E5zAm7h1aSA+jrViKKHwby5iOnA9zXaF0784C0iDEw8BJc+YHrSOx0784RW3IstL/x
         KlcxktMDEoe8Znl1b6FQijYlA/M8BCARMMMdtAU3Nb7bJdU76WN94tdK+TZUiSTZ3t0Q
         gTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779866019; x=1780470819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zaef/OUhxDQlU4bIcdlBeRXSMnGS13rIzxYDC71/Mgk=;
        b=kwLAAAxhKHIJJsIXJ5WGwCy4IIF6JsmJr6y1T5xg61y4Ga56W7SOfftaKK+/CGTYpl
         QDOMqyPpo7R1YwrHeKou9OLMPfKvFLHUvirpX4X4VB3MgJ8NEZomXznkJorZRKqOLmar
         zMPcuuw36x+Eqp8F839GQy4E1Wh76uLO7U7tN6Xf/kshBnC12H/7qt6wpYay8qbxap6U
         W06JWbYrAr1Xc79dxsYOljKzE0j+c/dgj664ItnQMRci/7zQg3PnogoxnAMlxFS8gRpu
         B10SHf71iu6eHu3jQCshOfwgDIOQ+ZGWY41xIP/4d4uMpFQ8DnHWnVaSb/6TxzYiuLxo
         wugg==
X-Forwarded-Encrypted: i=1; AFNElJ8K7C4+Z9uuK9jDrul30+n0J9q595ewvjinVMV1162zJI+nMC2rwOxFUThtc10uzvJM3Pedg6Zg9znDtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuHMhcQfKXz3Vv7ngW03AIGbfgQml7oKGAkgNK3JZP7qtH4+6s
	8CHUaR+yF4sOhuMZuUSJazqDq1uQw+SFT6F96smhDnml9hiMr8qkIjxAmO6X00jS1riM+rQLH/S
	PPbY/NuHzSPfhxbKJbPUa0L0jNuQee9s=
X-Gm-Gg: Acq92OEFd7tgOKa2mXOHFYQkqbNVkhXmAmhRRDvEvxMcwuqo0mXO1z0Qt6U8M0Krb/a
	hnbRTWsdITBlQCZes5oBthjZuImW7lCFRwUuEB2k01IJGdJcpjdH5DmYkDVs+0r+9pRZe9Y61eK
	pI3ishWFKeO+J3ldyVOJUOBrtKKyF1RLRT411vmDwkoNaRe4blp/0yEsrgS+Ii2K6Z+F0FWY/7T
	IltcIq5HD32v02L4yac4cDfg0w/vJ1z1+2M7A775u79kYjvgNykYTRvEGWR+tGU/Y11zqBTee2h
	t7mIKVS8aLTY6fXok2CmuwO1XJnNSi+WyvhGag==
X-Received: by 2002:a05:6a00:298f:b0:83f:638d:1e64 with SMTP id
 d2e1a72fcca58-8415f580e40mr19675360b3a.8.1779866018607; Wed, 27 May 2026
 00:13:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
 <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
 <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com>
 <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com> <CAABR9nEsKjgErDB3jnHrx=dOUajvvN6GbP+6XUb5Ay3VYYjNJA@mail.gmail.com>
In-Reply-To: <CAABR9nEsKjgErDB3jnHrx=dOUajvvN6GbP+6XUb5Ay3VYYjNJA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 27 May 2026 14:13:27 +0700
X-Gm-Features: AVHnY4KYe_20mrf-YgFfeTtowuhQHlFA44ow40h-fRG4arohRfrD4-uu8diiShU
Message-ID: <CAABR9nFdvh9nfa03oxFLgD2WUj4LyHP8T77xKno9wjiQZ48h+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi ,

I did some additional investigation into the regmap core functions
currently used by this driver, such as _regmap_update_bits():

https://elixir.bootlin.com/linux/v7.1-rc5/source/drivers/base/regmap/regmap.c#L3249

and _regmap_read():
https://elixir.bootlin.com/linux/v7.1-rc5/source/drivers/base/regmap/regmap.c#L2822

as well as the current sun4i_spdif_regmap_config definition:
https://elixir.bootlin.com/linux/v7.1-rc5/source/sound/soc/sunxi/sun4i-spdif.c#L526

Based on the current regmap core implementation, I think it might be
cleaner to leverage the existing regmap suspend protection mechanism:

if (map->cache_only)
return -EBUSY;

This would inherently prevent direct hardware register access and help
avoid potential crashes during suspend. To support this properly, we would
likely also need to enable a basic cache type (e.g. REGCACHE_FLAT) in
sun4i_spdif_regmap_config, since the driver currently
does not define a .cache_type.

A patch in this direction would look roughly like this:

static int sun4i_spdif_runtime_suspend(struct device *dev)
{
  struct sun4i_spdif_dev *host = dev_get_drvdata(dev);

  clk_disable_unprepare(host->spdif_clk);
+regcache_cache_only(host->regmap, true);
 clk_disable_unprepare(host->apb_clk);

}

static int sun4i_spdif_runtime_resume(struct device *dev)
{
   struct sun4i_spdif_dev *host = dev_get_drvdata(dev);

   clk_prepare_enable(host->apb_clk);
+ regcache_cache_only(host->regmap, false);

   clk_prepare_enable(host->spdif_clk);
}

This approach would not only address the current kcontrol-related issue,
but could also provide a more generic safeguard against other runtime
suspend race conditions that we may not have considered yet.

However, one downside is that this solution depends on the current internal
behavior of the regmap core. In addition, if this driver starts using
.volatile_reg in the future, the current regmap implementation may no
longer provide sufficient protection during suspend.

For example, in the first branch of _regmap_update_bits(),
volatile register accesses bypass the cache_only check entirely and can
still hit the hardware bus directly, which could still lead to system crashes.

Because of that, the explicit pm_runtime resume handling proposed
in the current patch may still be the more robust solution in the long term.

Given our previous discussion about making the pm_runtime handling
more consistent between I2S and SPDIF:

https://lore.kernel.org/all/CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com/

What are your thoughts on this direction?
Or would it be safer and simpler to keep the current patch as-is?

Best Regards,
Phuc
