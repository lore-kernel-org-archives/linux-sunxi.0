Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757266;
	b=mkXvlumRlt8cgpLb7zdaxkw3POLz+L51yrDeeRTofDbuEOXK7gETgYVmL2jniv/NDQZl
	 elEqxeSJbWGZqe0j9KLZ8+4uDwpEg/PlBgPHCxtQpsKtucsCJu/tZ1dV740PdlOdDjMOQ
	 8jIx9FlmZ+GaALwX4sOg/pATRWNMOR5FBAMPlOFDOdfyLRvgR+cj/ZTbygoMAKEu8DAlq
	 4VTrMId0OVWLRbAuOcsbw5JqcoBprf+uUMHSf+frlRCRs1kVJ9tjcUsbBBKqEuIIPagdm
	 a5z9GDD8Xaq9N2jaCZXyerwfQ2hLAowZFLr4oJ8T26IRaVHYaIHU2Cj4CumJ5pFJRjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
	b=RrJ5U+MmwD4q4n6MkVN3FgpbDPTNHDOpHDzlxpwmqDj2Qk9nUAAqeqK+tuHhCbMKulOp
	 ZRilzLEn+hUBdQpJ5Z3KG327ZTXIvmXOGUtR5O/Jl+XWF6ScGN5PDojf9cDq91H7v51eF
	 ShtPxgZfD2IGUfPniUjEqorPfrzvxSfHmidMwAK6ymmCHbQppRmxo5p7LczHA8ojLaEzi
	 mh9fj1ctO9e8UK5SNvEMNHt3kV8Xd/pG0ciN+6Z/sSFSAvUHxRjLv6HUF3Up1nuMIJIzP
	 ZmjfbpUDVMY0FQmFGo+YEPg2g+XEmj9vJnJsHNdXjlRmO1oZTo6Cbd9KOUFjAlFX/7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gm37i29U;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EB6606A32C
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 15:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06EB6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gm37i29U
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1287121f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 07:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757264; x=1795362064; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
        b=gm37i29Uj2Lg0Qn7PVClw/BGY/4/8IcdXOD6vySuB8oivAyuY2Qet35HP8z5WVeIPL
         dePbovOeE1bcaKXE+Xc3uNpXJDAfwS9ndY5jS4CvsoJc9pUd6aTvT8MqLhrV5yKyyROn
         vhepaUGikQCxrbtqBUXW6aWhunxVoNGF/IQovXHcSMVE3RLkybrZHvoTWKRKltvmjouU
         BGQaAMb7YTSv7qnvuJL46wRJW01cbHENe0gbO/1CJ84Xu7g5ecgQ67wFDiBnd1sgGBno
         l+DlbQJG3+aZRUGhFZ+PWDt5DkJCUpc4aJRWtrnBQsg4LyULa+ZTZ4/ErGujJc9eZj4+
         uKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757264; x=1795362064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVuohZ8xLFR5YiCoEYGFhyPTULZBGZj7Wpwh1r3TICY=;
        b=Lg5T2gss7FBIYS/TJLuZp8UJ4zSzusN9ca1imI2JQ6VWxXlYdZZqTGualZDnIOFQal
         LuVJr3Z2iOEMKbk1sR9rUPi8AsEFQiImAZiItssw1GfRnKgLGjPe7BYk5+1eeoYFDjzx
         wI9NDtZrUbIYffgN+NCNsVb1J6KlKr2KLqIH4xazCu9IF/3jRGZeZF4fuVDXgFQG4y5s
         5XvK3YcftwvU43JYwhug8UNNQEVBmCNwZN+CVBXdJh1u1rmLxDharNjwkZGDtlBvsObp
         JCx9MJ41db9FeyDX7/+y6HzPFCR/bICWUwT44e/1vKq4YLKLxVGrnpuZvnBGUO3PvFyH
         bEzw==
X-Forwarded-Encrypted: i=1; AL+hErEB4lFtJv1TsLJB0tJyAbcw0bRwtacE2n3IUliPoczSMLp/JPgmnR3YVEZn9u1Agp0bt6/YwIe4J7NFYA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+w03y5jJJJaUXMoYN25gQVPh+OvrdeVELT3ugvOnZai+vDiiaN
	1hxAikNXWZtPcf+wDHyEuOWb0MDPfesAiT1hR18eL/KwaJgBs6PilzbknDuMzVggoE0=
X-Gm-Gg: AYBFou1a36LFnwJu428FinIzCXVlmvrpOmoeSw5bGLk48BxqXxO0JiNM4Qh2svhYFiP
	HVUqjLNTTaCmLv2PqThBx4sChkC2QsrxPZ7udlSTKRGNYfo5BYC4xe/XDlSfqrpGX1PeaOjyuoZ
	D8LQ2y2BUG7bGACBH5tijcJc/gT6fsgOMShaJ0I51cKVVt+JUdMEZBrvh60+W4NPdPbsp8NopX2
	Hfz0SF5xwXGvCugdj9/edsbllP8Z13D2bkdMTH67Hdc06LFCQ9y3FjdpYQbyh/c9TUYOA17Ki4h
	RRIAFCygntNs3YeuOkwfZNaVaZ6QLUIqF8VSPhDDSQV0h05htxLyFA0Elc8gDzIVU4oa3N3cU6F
	PhrSsiXTL4Hb5/78POvi6Sh6H1q97nWyLtBXafVMx8+QaviuPW2aSQa4cQPRCaqAt2WPReV8zap
	ZRbJhNjT3EUbh/yQod40mqRJDoVsfIyoVHOfDTfOEgCKubCeoLxlGmJI7MbUyPW/i3ovmvkHnY0
	684kYl/PE2W4NVRZvaOxuYUIT6OWXvIrQZ0nhss7xRop96yrtMjwy4hbIb8GYQQ9fyVimSDRyhB
	vk5E4llC1nmrdCtoGbRtozoNsb43RMe/Cms=
X-Received: by 2002:a05:6000:2c04:b0:48e:d36:77 with SMTP id ffacd0b85a97d-49c6fc9db5bmr19465481f8f.4.1794757264141;
        Sun, 15 Nov 2026 07:41:04 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c888b90d4sm16462060f8f.9.2026.11.15.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:41:03 -0800 (PST)
Date: Sun, 15 Nov 2026 16:41:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 14/19] pinctrl: sunxi: add support for the Allwinner V861
 PIO
Message-ID: <avnR67LnZo4Mo0Tf@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-14-eb71ec3ee523@iscas.ac.cn>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fgskattfdxvvv7hb"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-14-eb71ec3ee523@iscas.ac.cn>


--fgskattfdxvvv7hb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 14/19] pinctrl: sunxi: add support for the Allwinner V861
 PIO
MIME-Version: 1.0

Hello,

On Sat, Nov 14, 2026 at 06:33:40AM +0800, Han Gao via B4 Relay wrote:
> new file mode 100644
> index 000000000000..742465076d86
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun252i-v861.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Allwinner V861 SoC pinctrl driver.
> + *
> + * Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn>
> + */
> +
> +#include <linux/mod_devicetable.h>

Don't include <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id with less dependencies, so please just
drop including <linux/mod_devicetable.h>.

> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> [...]
> +static const struct of_device_id v861_pinctrl_match[] = {
> +	{ .compatible = "allwinner,sun252i-v861-pinctrl", },
> +	{}
> +};

Please drop the comma before the closing } and add a space in the list
terminator.

Best regards
Uwe

--fgskattfdxvvv7hb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50okACgkQj4D7WH0S
/k78BwgAggANSfiR3lIax5U5QxcHapAeEwjkuu5kUUd7ThVymu6geBziPkTKM9LN
kV1vp14gkKuMuThllE6yPhDE+jBai3H2dmZPRAVxRmkHkRXaCGvN2Qy6QvjG7hn+
pKrIhNm9FD3gtJcf3syW5npYiRAxG/6TkK+Gz1PXPgmg9Yj7puOzJ5ZZsZ+kBOcS
xiSHHn5ujqEIP4jnBc7Dv7UpeDH4NxdbQ6ssuWEYpdmNKvGpbP4Xi4tlxo4RAMXF
XWXJcAtussx3dylMOghSQ5VBKABwOqksAb/tX5/oaY13ScR8Lg/M3WzfjwXPwvtR
yRXJHXEAk7lxYPB9WoXGrz3bVWm0dg==
=Eo1Y
-----END PGP SIGNATURE-----

--fgskattfdxvvv7hb--
