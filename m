Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757E56FA3
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Jul 2023 08:19:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qHgg8-0000hE-1u; Fri, 07 Jul 2023 10:19:00 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qHgg5-00Cgor-M5; Fri, 07 Jul 2023 10:18:57 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qHgg5-0002o2-13;
	Fri, 07 Jul 2023 10:18:57 +0200
Message-ID: <38ffed42bb021ea75bc662edd943a8e4ca92172b.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Aleksandr Shubin <privatesub2@gmail.com>, linux-kernel@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,  linux-riscv@lists.infradead.org
Date: Fri, 07 Jul 2023 10:18:57 +0200
In-Reply-To: <20230627082334.1253020-3-privatesub2@gmail.com>
References: <20230627082334.1253020-1-privatesub2@gmail.com>
	 <20230627082334.1253020-3-privatesub2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

On Di, 2023-06-27 at 11:23 +0300, Aleksandr Shubin wrote:
[...]
> +static int sun20i_pwm_probe(struct platform_device *pdev)
> +{
[...]
> +	sun20i_chip->rst =3D devm_reset_control_get(&pdev->dev, NULL);

Please use devm_reset_control_get_exclusive() directly.

regards
Philipp
