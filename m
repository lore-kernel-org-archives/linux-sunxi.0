Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290572C82
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 09:11:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 62DCB32003F4;
	Mon, 22 Nov 2021 04:11:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 22 Nov 2021 04:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=asR4TRFTuXg3IwD7+/JmeIpF1SO
	mobhGwTSw1Fq2Lwg=; b=fnwRDw6st9TYG79dTI8udBBtnUoO0u5b4azTMGuFS/b
	NprPDamHUR41IEm8eTJiImHspJn4ql7zNd8AQ8+NUVerU4CAMv6inBUjSbB78GJw
	7t+5QH8ybxAIbDTP1qfrYeCnPy1Fh5tmtryr1aFdmEpmhydh1hctss8L4nggoWC6
	l1yf3tdLlhu1GBOOIpMA+K4Y7Gq68SJlJ6aIbbi9ueOmklAgWY03KVtD5F0V9eCz
	gtCERCr89S/rLNR+WpiEh/KG6RzTrZmIG9mF7Sy6gR/boKeAzuJBnDcFMWyTzZ/I
	JwZzpa7l9hlx7tCh3wTP8Yx5hO7PhBB8S/xmgSTJ3DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=asR4TR
	FTuXg3IwD7+/JmeIpF1SOmobhGwTSw1Fq2Lwg=; b=CWHZ6SEsrYE/r4ktlCoh8F
	gLb4VaZGdQqyem58xBMxgwfnsTuBNPp1n+Rs8wIwODZHT1U2/vPW+1ZuO37eRyi2
	CL9wjcPIxZrRfzzgaRypG9U0LGS4qcgDuLdfrlkfEoaSKsfTNtw3SBQ2iIjW0Q1s
	yyc/QljF/Ww+mbv0e5ofSZEPi6UEtgZvm3fEd4SjgeaziDt/DJWF/zZNN2z9xoqd
	iMulfCLm7y/tCIBAFAB0KmxX5seuoyQWbSF3/5FaPyWjDJc3diOhL9FZ3EaE7mX9
	oQPt+Zb7PwY/knr3efcwvTSZISeo80RDFbMKnsxxk81TjRH8RaVM8evIbMwgQsyg
	==
X-ME-Sender: <xms:xl6bYQMnv8iIgAA1vL7BamU1dXAnp9bRugSwdmJT6E2L2wbrZxS-9w>
    <xme:xl6bYW9qKg9ReFgOTsCtlJ6MECP1SEnO46-nS_vbkUbu1KTpkcsLMFFUHTxPMS4Qi
    n2WGvnY9H6QIsmJXbk>
X-ME-Received: <xmr:xl6bYXRjY-iYYGyzsB8fJX5SJg7ZkpVwFQfYCe_LZ1CF4OHEE9xa46doXKLzlkB3STv98dtsjz5Ex21t7DB7cXsA-QSTcDjEH9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xl6bYYv8fsm6EDL4eEEIM8h4e3j-kfFYmfpFTME1iiWA7ih6Q-VfFA>
    <xmx:xl6bYYctXnh0LoGTFVjZwX6r2BU8L3mpPOeHiaMkHkfd2-7ojOVo9g>
    <xmx:xl6bYc1IW2j4nJSh1bh8kaXapMUZaOx8NhPQmurvsHMnB_PQ-ylyKA>
    <xmx:x16bYQRToO_d-oDNZnDW2tzfRxXz_EMDn1LLMHkYY21mCvyIHqViPA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 04:11:34 -0500 (EST)
Date: Mon, 22 Nov 2021 10:11:32 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] iio: adc: sun4i-gpadc-iio: no temp sensor on R40
Message-ID: <20211122091132.yjudzei3bdqmnxq6@gilmour>
References: <20211119191456.510435-1-boger@wirenboard.com>
 <20211119191456.510435-2-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5m3w6n6uvtg3aopy"
Content-Disposition: inline
In-Reply-To: <20211119191456.510435-2-boger@wirenboard.com>


--5m3w6n6uvtg3aopy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 10:14:54PM +0300, Evgeny Boger wrote:
> R40 SoC has touchscreen controller also serving as general-purpose ADC.
> The hardware is very similar to A31, except that R40 has separate
> calibrated thermal sensor IP (handled by sun8i_thermal).
>=20
> Despite the temperature sensor in the RTP is never mentioned in
> the R40 family user manuals, it appears to be working. However,
> it's not very useful as it lacks calibration data and there is another
> fully functioning temperature sensor anyway.
>=20
> This patch disables the temperature sensor in RTP/GPADC IP on R40.
>=20
> The reason for disabling the temperature sensor is that the IP
> needs to be switched back and forth between RTP and GPADC modes for
> temperature measurements. Not only this introduces delays, but it also
> disturbs external circuitry by injecting current into ADC inputs.
>=20
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--5m3w6n6uvtg3aopy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZtexAAKCRDj7w1vZxhR
xca1AP9islsecrS7jYHo44n4PHe8SZC1VKVznrNJC8o8XLJl2AD+OSC7BWH8+zyj
rchrEj5ttxbcr1NqwCygE4DvvYLqpAg=
=yh2K
-----END PGP SIGNATURE-----

--5m3w6n6uvtg3aopy--
