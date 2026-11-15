Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757401;
	b=UZv0mw+KSVylpmXTZrEwOGG4eAq3Bztw0hQAw2JDEJFPq42S0+2FWp/zS/zHaFeBUami
	 UgINLLZnzull36QfpGC3pXtrQj/BJTjJgJm2a6cmwa+If9NnFokZ8lIvpV0hnUU8fJS3p
	 y+Mxr8nkzPLvhIdlWOJ6DCIOiwlRoC6wZnelKcbd4fwe9b6t7WeDoSoFxmppOQa5jlQTU
	 GN/F9CjbiLeOq72vBqzv9t5ds1M0Kado8lReTD4mlcjkVsp5Ba1gNb0CYoN5iQRdXxekL
	 e3VP5M5sBc6RvjQJPVI+147o4YKEYzIMZ0Fl3TN4EyeI+fyDYFZ7Je7GBzRlkbxNPHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
	b=rVKbjFHgNIvUK/K5EIluS5uXjjpCJzRB+1rZ435WkihwWayFPwCuVkNklxDxPwVtowFC
	 TuXvY0xskiH0hgBaCPlRFrtq/Js80y9S63vh9Eivo1TxcbmnBa6qVy/1bzY5vEa9VXqGX
	 h0f0dABgfml80HBsT0xK/7j4yQtMCEPcs0htIZcQOGIKP+kh/smQlULeAGDxB8ZdyYbkP
	 FJgB6S+bnrxwe5wSmjrKSXw1PTdfHSTtFWRuXbOW33kdV72GL/OBLUZpOcURIk8Awtk7s
	 E6vyFNXz2MwUwpvcOnk4rIHs5dCQ/yQ7ODh4N4M5yiThy6057uf9pfD9ZzRoyZ0CGFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G1YKkGnj;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E818606A885
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 15:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E818606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G1YKkGnj
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so20585705e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 07:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794757399; x=1795362199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=G1YKkGnjCx4/WqBQMdh9EMvlXWucRbfoSb97+voCsUMAq4K6LWkgAQkci27nop6pbr
         I2tH28U0kJ11/pHBdJLk55vrCleVG7HoG46DVqcQsuxfj6EYrMIUA5qSLHqvI9CDhOfN
         lsasrGXWuECkiWwlkDsUBHaJPkVTMUie9T+bctjXHkg4t+gxzTns+mAqtj/hPS+22Sfz
         8kbgI2kxfAyvJCaSsrzxQDfHk7Bds5VP5t6zNP0Cg4dVswcFJO+XzeiiiR/NlvNXIMRZ
         FTVqAwO+jrpx7yv6P8DaYk8L/elq+HvRtphWoqkmyHashDSo+r51Vg2C8PzEq4IK7xsh
         m8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757399; x=1795362199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hziuiiMUYFT/Qu2Fwgb6Sb0cIY/xqbSxPRQl/HG5KA0=;
        b=rFEuogO0qx51LciFRoALZyjBFA6rYMPw1roznJajnF1F6dMckvv9degh+Xjl/TUVT3
         VVa85272/dGEbXesHwJQUxQXz5Bk69hPUpS+r0Bi4MpHzPlpLjp92kuUE8309uLlfRtx
         HmIbA5NH1tge3VtmLGzpPuZ6sTV2b6MxRPuzs4OdJyfO0E7ZeOeTWH7tu17XDKj9BeEA
         uP5fsesukSHz5GmjMyGvUGI2vNxiKUtAwIFDqxa/QMHVJqX2HsUWQbdxLlC7YPXEIWx7
         qi/n8Tfp3Bt5S9dEsA3m+5ST1WssURgNUBJBl23k62JI9mYwFNFTLN5IVsx1xpXzrI/u
         07Cw==
X-Forwarded-Encrypted: i=1; AL+hErG8pS/p4jGgZXBvgyR1M7QNYOFKV0SiCXMVHApf1CAJTiPCzVrC4/JwyeUeTA2rbx7UJXBezkuMV/GYaA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+h9mTdoJ6j4ivcvKBDiuMxtpyhxzaSXU1ZmPwx+5LpoNHXhalz
	7Vz7bChwr4+J79wYMY6INeYqP9+gilONKpmrk33IB6gSQP8zWUNjy4nL+AHkt8q6HiQ=
X-Gm-Gg: AYBFou3BdCVNvpsSW/pSG+jWyon40+EqCiR5GtlURUTN7opp4Fv8+cGt8bH9z/0N20O
	gC8wrS+tsOpRglNf3EdusY1MHNBF8Z8JnVZEQX/G3BCjv5ztw2UWf4q2fWdMuCkxBD+DpTk6U/l
	qaaHcaZjjKjfzIZJTfDguU892tS7GQgRRNdxPLaYRSQhg+zEFMQNHn+3Sg+6CEeRbdmkYtAOBUn
	u1H+bF09XuCsXeO2QrQATDa5P4SgWAUNNipMWLQqPfZEoRL26eqTmn4RB0dNCB/YFoG22KaVSp4
	tEkY/KTFW6WudRjycJtQirybNPY+mTdNWOyyQyS26HG+WYQ2c/j7Lt5sxvRSGrkdoVIO9wECi//
	k2l1VmHYy+/pph4WnZhcjVIrR7nSbM3fO730qN0nF9CPLv/Zal5+h4BGGSTdzm4Ewkr+oYUfVsn
	6ggjrzy3VeTalNYQdGYimN+sdMjGAl5picB2GaSjBagQ4hbLpPLYdGrJ9L8/bBoriPdFp82VyFT
	Ig0bg6t8ybEDQHg8bpy/FJ72+3W5BWuxUziSaqHg2WI2tvozLFUs2kWgM/G4elrZHg7d4l1Vw66
	vy+8xaNNv4wrjHqjTt32eXT37d7gTCgsb6unwTTpUx60vsc1CmmkCyBM
X-Received: by 2002:a05:600c:608c:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb680f0a64mr77590835e9.2.1794757398894;
        Sun, 15 Nov 2026 07:43:18 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb68c00b10sm52646085e9.0.2026.11.15.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:43:17 -0800 (PST)
Date: Sun, 15 Nov 2026 16:43:16 +0100
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
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
Message-ID: <avnSl53KHJWGrBcE@monoceros>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="nd4yu7xpyaelhc7q"
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-15-eb71ec3ee523@iscas.ac.cn>


--nd4yu7xpyaelhc7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 15/19] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
MIME-Version: 1.0

Same feedback as for patch #14: Don't include <linux/mod_devicetable.h>
and please fix the spacing in the of_device_id array.

Best regards
Uwe

--nd4yu7xpyaelhc7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr50xEACgkQj4D7WH0S
/k7FQQf9GMWHvRPfVzE3vnOHAT8nN1+INki1D4kL4uwlHr3JU4yutcwFkaHKLsQU
b4DbnyStL4d7i466zTUN7GaSuTfs5LByLE0hKNibeGI5Wa+bHdhPXZw6poTITVON
f2BwjcuK+Zq5YQKqimrjo/4tbchvvRaJ2tX4FrpWxIYNSEVPVDu3Ku1FTeQTjQiW
q3iSJsE9FH4VZAUg2tViVg4jIzTIj6ncm2+HvaOFr/vv8gwncEBYp0IlMVPyqH3A
a+UAaIoEVNFvPPDDjTGrnHlPAjkkKoP4p3OAxBnC1l6qyEx0qCChV2gqtkPof0ba
XuoM97TKUIIJOGjYertizBLa8GJ32A==
=5u67
-----END PGP SIGNATURE-----

--nd4yu7xpyaelhc7q--
