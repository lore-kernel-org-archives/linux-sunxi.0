Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E236B15B8
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Jul 2023 16:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45F0C433C8;
	Sat, 15 Jul 2023 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689440012;
	bh=2Q4FCDoenbmD/VhiBVMa5udzbl7nfKdi1+C2wdvn1O0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KGFJejuQEStcUADchTg9oWaT+ZuWLuTpi4HLb3Op7RAslZMX2tJ3LWVkhFtyi0v8C
	 UgVxYMhhAPoJCfCUaYcatC6Yfas9V4+xwGhklnavAdjnk/Rl4Ab+hgZM6TxRfeyUyV
	 ThGax002RCYNwEpzElSo1VimTuqHfL8TTYQk/jSQap0Yn6++SdQ5ny9z0LHwYo3FdC
	 vffxqAxdGlr1Xe5jo7AM2rv4qWFHvquiD3cAd5crQFy+EzbDyTLx+e6S4FFlAKE5pL
	 0+o28xIlcXV6azxJp+qbLkW/17I3yEFetA7VD4arf/orfXfQh+GG5pQ0VUUM5c8awC
	 IoWiUm7qcWqDg==
Date: Sat, 15 Jul 2023 17:53:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>,
 linux-iio@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp
 Zabel <p.zabel@pengutronix.de>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Andre Przywara
 <andre.przywara@arm.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, AngeloGioacchino Del Regno       
  <angelogioacchino.delregno@collabora.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Arnd Bergmann <arnd@arndb.de>, Leonard
 =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, ChiYuan Huang
 <cy_huang@richtek.com>, Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiaEn Wu
 <chiaen_wu@richtek.com>, William Breathitt Gray <william.gray@linaro.org>,
 Haibo Chen <haibo.chen@nxp.com>, Mike Looijmans <mike.looijmans@topic.nl>,
 Quentin Schulz <quentin.schulz@free-electrons.com>, Maxime Ripard
 <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 1/4] iio: adc: Kconfig change description for
 Allwinner GPADC
Message-ID: <20230715175319.1ea7f2c1@jic23-huawei>
In-Reply-To: <b3723443-2a27-0a51-babd-b36eef095913@linaro.org>
References: <20230619154252.3951913-1-bigunclemax@gmail.com>
	<20230619154252.3951913-2-bigunclemax@gmail.com>
	<2148594.irdbgypaU6@jernej-laptop>
	<b3723443-2a27-0a51-babd-b36eef095913@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Jul 2023 07:37:38 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 11/07/2023 20:14, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 19. junij 2023 ob 17:42:24 CEST je Maksim Kiselev napis=
al(a): =20
> >> This patch adds SoCs names to Allwinner GPADC description to
> >> make it more informative. =20
> >=20
> > Please reword to remove "This patch".
> >  =20
> >>
> >> Fixes: d1caa9905538 ("iio: adc: add support for Allwinner SoCs ADC") =
=20
> >=20
> > I'm fine with the patch in general, but does this really warrant fixes =
tag?
> >  =20
>=20
> No, it's some fake fix. There is no bug here.
>=20
> Best regards,
> Krzysztof
>=20

Dropped the tag.

Thanks for pointing this out.

Jonathan
