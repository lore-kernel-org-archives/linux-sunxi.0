Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D245F7A
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Jun 2022 08:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD5BC3411B;
	Thu, 16 Jun 2022 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655368140;
	bh=cuRduGGXj2Y/+lglkT8q2s4iGVAPd9QSM6DFTbaLwsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C6Zm+uGDAZlCfuXL+7jVy9JTNhPGU8P7JdIWUWqYW7m7hpdwHYqzvNZmjgVbik80u
	 fZD0DC6UEe3vLasuc8e1Qp4/m1LR3kgfbJ78L2lF2AUq7WH3gkHuDKt8DNpyNSBy9I
	 JMQavnUGum3CwCIYYn/VNEfeQK71LgHL+ZVwRaHrOR/BzPxNwd2CHAVbdRDAmF3POq
	 Thc8N8tWeCvKlTsZJySVybPKMvrcfbC57lrf7VDlNF+Sk1QqpKcAfWgF1Dy4U0EuHZ
	 /mqMXMK0+WNwr0T5hKeRiAgEPiZDdPlOWHLI5NADG62SULN0hw9WQRJ/XzWYlaxDh9
	 +j7bCSG8X23hg==
Date: Thu, 16 Jun 2022 09:28:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/3] ASoC: sun50i-codec-analog: Add support for internal
 bias
Message-ID: <YqrpxWrnaqqYWaGC@sirena.org.uk>
References: <20220616062554.57266-1-samuel@sholland.org>
 <20220616062554.57266-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sAeK2/sljyNuWwJM"
Content-Disposition: inline
In-Reply-To: <20220616062554.57266-3-samuel@sholland.org>
X-Cookie: Pass with care.


--sAeK2/sljyNuWwJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 16, 2022 at 01:25:53AM -0500, Samuel Holland wrote:

> +static int sun50i_a64_codec_probe(struct snd_soc_component *component)
> +{
> +	struct sun50i_codec_analog *codec = snd_soc_component_get_drvdata(component);
> +
> +	regmap_update_bits(component->regmap, SUN50I_ADDA_JACK_MIC_CTRL,
> +			   BIT(SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN),
> +			   codec->internal_bias_resistor <<
> +				SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN);
> +
> +	return 0;
> +}

It doesn't make much practical difference but is there any reason this
can't be done in the main device probe?

--sAeK2/sljyNuWwJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKq6cUACgkQJNaLcl1U
h9BR4gf/WzTzXWC2DYw4VnEvPsv/DcmGEFWM2OxZieteTb8WSNpVt6LjTYrajpjH
IMvOdqI3VRl3Ews5PI/DJX4NMZxBTwHF78kM8sFN8hTr9ANJUiGfTptv2HQ173tX
lgmmQD6XNlxuoR52CQaln3HRGdqgZT/KPHU3ikI7RDMB97Uvy7hBEP9W4nBc0AC8
8RLfeiru1vpq93VjCEyimUUY0CDij2eGKwgcbej5m45+33GUde2QVbF0SdExthP5
w/7+7C7HpqBg8kNuUKS1Qyh+QGxCKiuhdsMBYGLfsIVuGcvVjiKPwkrTj9s5wPU7
1vdqvkzXaqSBecgRohtLNU+tOOqMtQ==
=1ZsU
-----END PGP SIGNATURE-----

--sAeK2/sljyNuWwJM--
