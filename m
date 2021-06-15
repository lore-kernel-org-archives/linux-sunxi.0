Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57E96D00
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jun 2021 13:18:40 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1lt8xD-0007qa-D2; Tue, 15 Jun 2021 15:18:07 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1lt8xB-0000Sh-75; Tue, 15 Jun 2021 15:18:05 +0200
Message-ID: <2e369015776577c6c32ec2f7d05e35f796edf713.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ban Tao <fengzheng923@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org,  perex@perex.cz, tiwai@suse.com, mripard@kernel.org,
 wens@csie.org,  jernej.skrabec@gmail.com, samuel@sholland.org,
 krzk@kernel.org
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Date: Tue, 15 Jun 2021 15:18:05 +0200
In-Reply-To: <20210615130326.2044-1-fengzheng923@gmail.com>
References: <20210615130326.2044-1-fengzheng923@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

Hi Ban,

On Tue, 2021-06-15 at 21:03 +0800, Ban Tao wrote:
> The Allwinner H6 and later SoCs have an DMIC block
> which is capable of capture.
>=20
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
[...]
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.=
c
> new file mode 100644
> index 000000000000..78d512d93974
> --- /dev/null
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -0,0 +1,408 @@
[...]
> +	host->rst =3D devm_reset_control_get_optional_exclusive(&pdev->dev, NUL=
L);
> +	if (IS_ERR(host->rst) && PTR_ERR(host->rst) =3D=3D -EPROBE_DEFER) {
> +		ret =3D -EPROBE_DEFER;
> +		dev_err(&pdev->dev, "Failed to get reset: %d\n", ret);
> +		return ret;
> +	}

Please don't ignore errors. For example:

	if (IS_ERR(host->rst))
		return dev_err_probe(&pdev->dev, PTR_ERR(host->rst),
				     "Failed to  get reset\n");

devm_reset_control_get_optional_exclusive() will return NULL if no reset
is specified in the device tree.

> +	if (!IS_ERR(host->rst))
> +		reset_control_deassert(host->rst);

Then this is not necessary. Just use:

	reset_control_deassert(host->rst);

regards
Philipp
