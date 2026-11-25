Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627508;
	b=a2Cpo16LGHCfM1XaKtl6PsKFn38xBGcL5snp2M0+5YisExDIWWmXgQXEEo6DkydOd02r
	 /SFv/VZhyvYML0LjNDSIJ+twLX9ji3wl+jBA8rR5U8OCEo8m8rDKUGmK28VgBDN3mEfXu
	 zsouD0jkogLbwQbdtr/nIAUo3rcukZdPRdBIrTBTLU6BSkRivr2Nl+xeqC96j6GHJWZcb
	 UJA2NWix8sdZpQTM7iYB/bnpx2cu547Q4jVFSQteejrHCxQxs17m7lLyodPVqrzMH5cmU
	 53J+t21DnMczW69kLRui4yaqbfIiowyNKRc+1jQ2n7bWFsThMCzIeobQhzPb/Hg5Spw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/2ZiDJ9tq36ZHWmXeHMEUP2iypybL2OmKVpnewLrfEs=;
	b=t9HZp9edHtPASmVeI8mhuBZFV91Ek66sgG3a5b2Wb0U42boLo6paNVa4UpVT95+c2NRR
	 v/fV63bR2ZWRK/lQY7/5UAOn6Pz1MHeWXfeM1Qp/g61tUVjoT6vGLC4b76sAQ0XaXdVJM
	 ljeQ1R4P8voY5Z3nUq9ESeOU0SeXo9LlHzkvYJ8Yxk4KzBDd+0gZ1YpcLMVn/kagXSrqp
	 12ROYGVTnoxbo9XBN4+K4K52I8vAGHW1Wkuu1FWNb37s2vcX1/uIbwuDv+6eQT8oM3L3P
	 hQwizROnJR9Gw9pUTEWgOXejpBopqhENBswFl+QmNqDG/DIIT6axXIP4xFGeN3I4ScA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lq3TfLa8;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7EC606A326
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 17:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A7EC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lq3TfLa8
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so5367270f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 09:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795627506; x=1796232306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/2ZiDJ9tq36ZHWmXeHMEUP2iypybL2OmKVpnewLrfEs=;
        b=lq3TfLa8ky6RX5EeePhz423I5+7tjvETz+5biZyPInH05EXol6accGXunAR9LlTbhi
         xdoX+34dUnYSiAyK2hDHFh3bzP4hUP2sz15dVF/vPmLYK/bQXTLl03e763LtgxyznsvT
         OigrzadkHrrQwM8my3dGpd2zUp8qBCJFo47A4lrK+FqbcANthSlHCUJSU1kf0iaM3F2O
         Ezlf1dpL2Tjdqdb+4qRznn3fsfz8R1Wt7FgORglpsJIEPtjcxUskN/bYaGKh81P5rBm9
         nwVWP7KGRPS92XmMDcZq6lccpuXNZnTIqfJ8yBPfGETlZWOeXTjfMRuOIZ+bcN/q3+6D
         RM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627506; x=1796232306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2ZiDJ9tq36ZHWmXeHMEUP2iypybL2OmKVpnewLrfEs=;
        b=HPIBZ3f0VCPZir2J29iqY8YDsXeS7BVspwk4fS41j6rbykAjg+7fQM6g7BEHYMbrQ9
         yfo//2mWD1huGQwzM51jI3sV9tXqXDRS3Uic5rKG4NgdJcvY3VjQy/jj3dU4+JWMLN9J
         5A5rVYsKuBUYnUCJkb1/97S8cLTHSCDKCoN3BkPpBB8UaSsasMpFrns8O6H32ELXylJ0
         RsvGVH0bThFL4wsn/0BkAEdnUer+blrx3twQjCp1mmZ8fsaAC68yh/AgsQ3CO1QHEaJD
         ysF0nTdcpJwluLDex2NZRM29XzQV9sbLCiuz/rfhDynMubQaFRdyoPEvZ0j9x2qXLoBr
         jqxA==
X-Forwarded-Encrypted: i=1; AL+hErEYdNaW3SD8bAICMbXt8PlTgRb722U0LCe0y0GU2rHS9sCFenRbACNkJWEf6c5yegxXYL3HRg1mT5ij4A==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ir0DUa3FilL8txrBeYXqPG4dpqd4b6WsUYMBgecKeRAFOayWD
	o+vUQ7y3EG5nhvFLA7i37tsqz1SK9k+SErMJIhwOPSLs2kWX7hQEZ/1uNxHVNhh01TE=
X-Gm-Gg: AZFdTZf1h4gYEh2gNKkuZxy74sW/MYCooBLKeL+kxOaqPU+gPvnIly9Ie1Dajtqmiq2
	3mGYK15bg12yaV0obv1h6CfOW1fH84yxCNTvZe1WYyEaJBY5MXXGQetCl4+mtWeVJYdpzitXIts
	eRPgOfNVy41MZMLDVFT3j9Xm6FdZUKVLsm27wxDX4G8mqcAMoLFD0lTOhXjeGlppOYSfP5+408b
	APCG+vQIb92Okcti99+Trv9q93dWFLGIcTI2ZG3gAPI+WC2UVsP0yxbbI7cJS65bgeSFNF6l+Wd
	ty6StnqmgKxvvHkC/+zcBcmHPm93XBNxZlhT4Uhl2UD5/QaqcEM6H55UVcaHNBb1eboynmnv5GN
	+oj/UTYHt2eLem7UbU/5MM3kp5MMT4AkU0f6Cau/CWuHFGxbPTXBog741qPq5xjJC4AyrODOwRy
	EERj0iuYfFzl5byIFAnmYForXq86HhrtFjxOaWXyOCugkKxZ+GLROilLOpx6vgcvAuQYAEjmLJZ
	nO5+Ltc/fHsCay3/36bseJbspED1ONu6bbsWYTdqzAuteIcDqyeY2FhP9SdTCsFnN3B3qSgCy4x
	NnvZ8wUBmzSpAQctne502q0zkqjALxqdGHraSvAvnsxE9DL9b6PxjxnbgyhEv6oO6ybz714Crhn
	103fohq4aQIPUizH1hQ==
X-Received: by 2002:a05:6000:178f:b0:4bb:c85e:d565 with SMTP id ffacd0b85a97d-4bbc86e17b5mr436127f8f.55.1795627506305;
        Wed, 25 Nov 2026 09:25:06 -0800 (PST)
Received: from localhost (p200300f65f19a904452474b9d670397a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4524:74b9:d670:397a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab658e2d1bsm37047838f8f.8.2026.11.25.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:25:05 -0800 (PST)
Date: Wed, 25 Nov 2026 18:25:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
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
Message-ID: <awcZcuSbse5g3FWK@monoceros>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
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
	protocol="application/pgp-signature"; boundary="nbybrdipqtjlxyaa"
Content-Disposition: inline
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>


--nbybrdipqtjlxyaa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 04:28:26PM +0000, Pawel Zalewski wrote:
> This series is converting lists that contain the *_device_id structs,
> to make use of named initializers (which they do not use currently).
> This work is part of the on going effort in the kernel associated with
> device-ids [1]
>=20
> The plan is to convert *_device_id::driver_data to have an anonymous
> union, like it was introduced for PCI and I2C device ID tables.

Not sure I understand that. PCI and I2C wasn't converted yet. ieee1394
and zorro were.

> The goal is to increase type-safety (most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
>=20
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
>=20
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces for that field.
> This effort is split per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers
>   (which is this series)
> - actual implementations that make some of the modules use the new
>   driver_data_ptr member (which is not needed in the mtd subsystem)
>=20
> That way the task can be fragmented into manageable and independent chunks
> of work and makes this effort easier to review.
>=20
> Patches 1-3 implement the named initializer change.
> Patched 4-10 are just churn to unify the list termination and can be drop=
ped.
>=20
> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@bayl=
ibre.com
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

with or without addressing the nitpick I had for one of the patches.

Thanks for going through this
Uwe

--nbybrdipqtjlxyaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHGe4ACgkQj4D7WH0S
/k7Hxgf+JDQD3nuNyQeHxxoBDQbZLCdeqai2FGzqlA/wVP4ILYtl0Hj2B4Uvb51m
TWG5nlrssz3YpBalM5hoN7zT4/kYrvYV+kEZwlQ0rRaST1L1WSsaI+hIrd+sFqjI
E8CbBh9BDS8e2lqRUB02P2qNgrLW8OGoqjf65o8A416iktJ3LaEisuhLP8aVKb9O
G9s0nSWXydrbhPM3eKUGdumEvZViZRDTbdQOOZ3Ont4s0nic7RCuY5HxIJAv5u7h
n+QP/LXiSy/47VdwvRwqyJDfGxZnUzMHMxb0X6NQg1g1C/xCJFt3XHlD/eUHbI7K
axkOeY5ogCnXHhh12ds+XESv7iHqCw==
=xvDo
-----END PGP SIGNATURE-----

--nbybrdipqtjlxyaa--
