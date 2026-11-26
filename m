Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701006;
	b=MopppGV9ZM9hd1sOno4+OU6DWkJJVDt3PTXO10iMJkCBAIk/MCoLwViWIPVz9tf64tJo
	 jHQFaD7Epbl1u3X3GXX6nrv9FVAnxKaVnXuEN4dMw3ZnOzDPRLC15I/JxRczjINDXYaHM
	 Rpq6/I8LZ6v1Lm2lg64RZ/bYADyKuTD9uyBDtcBJbSVR8ldaS/wli3Qn05orL5aDq66wQ
	 I182/UGCiHcN9qr/V8mO3hsanf/t9KTPpUtL2wd+8BQ9gOeyPjKJ79ZXiLQPxBhgDInbO
	 FYyYTgq0tdPWnXhLp4uUJWqcl/iimMHMgoNwhCJ+AUe0N359meObBm+dooiIaj+4VMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=;
	b=NGgKtAXR10w4rMR/zqGijxmv1go6EOePG5J28Gg/paCZU+cT4ntaC/KbxqU934trBaPP
	 kfg6H1IzgvP8t/YlGh9LLOSH4Isd/NRw3TE1vgNEkgJBGrec8pU+jmvq6BruFvfsGIBlz
	 vf+tBUXB/LBj7aU6R8ptK/0T8mVvK1l4HESAZh6AMzeT2ya2v371Vq+wHjx2H4qsvqylJ
	 bZ4GdSXDHEPvgSBCFTo6X5sZZqfkvhIHzoC0862Ej9WUFLS+zTlvwBq+obdlLoIEGV4dc
	 g1jtw4f7mL5xqCX+auZWsWM/ycD31TQDSoDEyPHj0ZerbcMW+kvx4Up8tiFQUEHU1Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=asONIgmL;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE14606A323
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE14606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=asONIgmL
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49465892f7bso5136851f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 05:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795701004; x=1796305804; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=;
        b=asONIgmLWwqJD0yhNKuG8m4D2ZVkJDs5+G5ouGbVr0qFhLuiYmIEmfnUKFGut1kmJP
         buR+n++xvmexEuQKDW6bEE3nuioWTbv+Mkh6ORL9YPrFSYw/6iqGOftIE1IC2a13KrLa
         5Fke+Z2wH9/CfcHwmRsZKZCVNEXEeMWEEiTnw14KFkuio3leMtlctlu/DEcc7ntm5gc3
         gkyOK+e71KL+P9eDfqsIPYdOdsWd301M/6Se0j38+uOjuzb1qNZycCDVRxqJd+Jrex+Z
         +//tIpNLdXl+yrk0S0lNfno0TcVJW/6XcULlt0Q9ZuRjqHNdN5NfFA6kRmX5QV01D9JJ
         iVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701004; x=1796305804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=;
        b=1lTvvSzzHi+dBh61MZsg/TTGBdCfyASKaqxFkLE0cGOBOonV+UYc+V7YbZYzxihB6A
         16mvV5f+O+Eu4SgHMQFGPwoHG9AkxuXjkeBP0EOD48iMXG6h+5ZnZshV102+GNwlpbNE
         4xDik1f7sES2L5HBqlJU0d1R6SQkrsiDfLSU12kS9JphRAJTtEN7kxaEA3sFgg/aaLwa
         AzjvHE8v41seM22v732WzmQRHaZsEk8Uvdrk9lRI59Dt1GGnqiMlwzNiT5Bg0NxcF2rw
         dgKhaNy6k8733MA4tHULXkHea6XPcPJz5qDAJYfnd94zTuPl5g5URE5lZryXrXun9JT3
         fi0g==
X-Forwarded-Encrypted: i=1; AL+hErG9dL+9L4KtxrctZdSogAnRXVi+a1/X5f72YBMlgnRwdxfgyn63heIuf0cGeRofUJCQHRLuX0kowNUvDQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8qHLAHcKYXSTpnAR8+kMBwymo6TQ1zGPwtrYiSCz8TOkNU6Eu9
	REFNx0o9ipb04mZc3VBSG/W2OU+Z19UJlsNg5Y8UES3HKtzzL4o/nHjECzy/ZJealSM=
X-Gm-Gg: AZFdTZeOg4vXI7N7jCG68pars+RbK8WtJz6OnShtzmSpN7s2Vrr1IvkXQRK+G+Rk5xc
	UB4Ttu36Q4qmLawwgFLuCgP7Kiauvt1DvRB4pRocgH+KJviYbxW4WG/1Dkr2xBWedLLp29+4ZWz
	sxlS9IOWAR5Auj3VX/qhihWqV/Da86gpxmjRYeiomUQoukA3PhGMfIp3J4/5dSfiKemW+JYqN6C
	0qy6TFDYhJCtUFi3zdYSiNHMvd7uCKJNAS3TINN4ieGQEB1V+68nT9PGRYKTEb9Xk42rOn38vub
	CmamPs1u26xmWBTBhWH7FCvc3q/WAmuWLjNyFN6M6NwteqNj24LH/yGhjA0tp+7ZPy7gZ8Vbbur
	8pF1049jOd+bTTloIZnoTEZcCeya+5CYfpWE0tfXA4bTEnUFvpKz0DsWdX+HMXcQhxcjO+rHFzz
	apfmx4cN7Oa0yDjt5xgNtQqtgqhxtdc0EIOL5qlabiGRIljbzZ0bxKo4dlay3YWgOdKp47fRYod
	b9udeUWIquiu7ltp53+esjPKfxNYOOfusQ+AFD6IEa7qk2U/6gnZ3yby9d+IWGu0D/3Agwo+Z1E
	0biJ6xYsJ0Gz8NJc9FAf7KXygHXCdzTL/RWwE/PMcySB8FTrRQBklVeNI0mE5s3ojabq2FI5OXk
	jggbt8OfJVnGYAbQaNGOsWcOvSmDWLZxRZTEB
X-Received: by 2002:a05:6000:4b17:b0:48e:f47:273c with SMTP id ffacd0b85a97d-4abaac57a40mr41489070f8f.8.1795701003612;
        Thu, 26 Nov 2026 05:50:03 -0800 (PST)
Received: from localhost (p200300f65f19a904aae808b8a2e91502.dip0.t-ipconnect.de. [2003:f6:5f19:a904:aae8:8b8:a2e9:1502])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm40247966f8f.32.2026.11.26.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:50:02 -0800 (PST)
Date: Thu, 26 Nov 2026 14:50:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Joern Engel <joern@lazybastard.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Michal Simek <michal.simek@amd.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Brian Norris <computersforpeace@gmail.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
Message-ID: <awg4ubbFu0FksThB@monoceros>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros>
 <87v75jyiw2.fsf@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="fjhsfzw7maxs7oq6"
Content-Disposition: inline
In-Reply-To: <87v75jyiw2.fsf@bootlin.com>


--fjhsfzw7maxs7oq6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
MIME-Version: 1.0

Hey Miquel,

On Thu, Nov 26, 2026 at 11:41:33AM +0100, Miquel Raynal wrote:
> >> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> >
> > Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> >
> > with or without addressing the nitpick I had for one of the patches.
>=20
> Let me know what you intend to do.

Your mail was sent To: me, but that was directed to Pawel, right? (FTR:
I intend to do nothing here ;-)

Best regards
Uwe

--fjhsfzw7maxs7oq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsIOQcACgkQj4D7WH0S
/k7VGwf+JohDT6rUS7ETNio1M8Z7P9mW/dw41gur3gOUE8OBNxOfsasQ0n/riOvo
4sT4fsGJWgm+ezHKcYcrXNknVg5Hmfpk4HeA47K1y+P9G6LhwsBLtqRGMM/7dCMd
nWmBVR77ExMyThLv6M2Li7HrkLHKSnuq7/HXqOD93OrqD6YYrrRBvTsBklbEdhWB
wm40UJgQd+3R2Lwq+CSDVUYqVGj8LP+XGj2vNoHXEfGlk93ZED7JguilGU62561G
N5qNDGfQC+CzqYC7tQ2tj0TNnOK6kYXrK6jxThQovh4ubLadqtHT7mVLa3qbS36h
iO7uFgMsn6ww6nNgTXKWH62VZzkJPg==
=6HjX
-----END PGP SIGNATURE-----

--fjhsfzw7maxs7oq6--
