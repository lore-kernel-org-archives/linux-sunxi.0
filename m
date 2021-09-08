Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36BD72
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Sep 2021 07:29:25 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id CEE4E5C00DD;
	Wed,  8 Sep 2021 03:29:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 08 Sep 2021 03:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=O9T3Oz7urvv7q+becA8kKal5djf
	Q1qdQFN3QPX1HCp0=; b=BIN8hZKwL8m1O6xQVtd95IsP9YXF0WJNZX2Qpq1lVjz
	rr72GABN1ve/ucPMZCCZT8k2Bqww2OFt5XXtFMLagXX26oKif8g/zCxsq+9CGew0
	QVn4CVAoA6Z9vvE9WUVR6FtI8Vv3sXxQiG0N6iVoaKLWiPAZbdE89jhXrHjp/5ew
	xtHuLPGdNL2WMB2ItLKVtPadB0EjkKNH+2+icbUQNq1nNLFW1T4Z6VV0NlNOsTn5
	rfenhprzdCSXHJbm4p8+sV6FF9roqL/0c8tHTdmN2Sa6pQh92FQ8Deq7mmFui/4O
	8BU+3WmERp+ZQloIULlZxUkLCFH7queMjfSg9XVj/fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=O9T3Oz
	7urvv7q+becA8kKal5djfQ1qdQFN3QPX1HCp0=; b=Vs4pSR1PFhyEqw2fjPD5w1
	JPQaHdByz4MpitHmWXgBTdKWlCVPLYD7zw2mJrbuYu/mteAWcLNxQTAR46AYZrAj
	XkPLZZhR8MdSvJhgTYgDRFtS35ZyfHI9eBH5IN+Flmj+sS6HzOCdsZas0o6i2jdP
	PAKvwJZX/ej0miknz/wPx4L6OuJLWnGQPrxbJtyowXBR2COoQ4eyDZpe7lcP1xtL
	3MWOzJ1l4YrHcNFfXt1Q7N2283s3uvLgMu0Pkkm7kbyqh27QxxjBr+1kglQ/jK8m
	GwjJKc8IZ6p8QdcgkEfyoU4xDEABLslEp2FcusPd6j/PnZxC8a/28YKAAZS6NMQQ
	==
X-ME-Sender: <xms:VGY4YQ39Tp8I88xJgSYFKzc-uWQAb7cN2YAGfobs3pyktZHHdu-Ndg>
    <xme:VGY4YbGI7aHqgmKWT_lFpZFwlR8hSUHaldkBbwiBJFNpE0zbXN3NEM_6nkDIckJZD
    yJpJVgTTW_pYbO1QgU>
X-ME-Received: <xmr:VGY4YY6RftNO3OsmfhEwJhHlhDkmAE3iCH5oy6RCQ45X425SWKcqrLmWAsZMEHswKhxduDs79jD-0Ju_egEkR2Zwjp2gyV93Jlp3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefiedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VGY4YZ35dFsNwomAQGYuguVu3D2RJqCtEOEBuQcP_vSStYhwnC05ZQ>
    <xmx:VGY4YTEaEYilNYTMsf2l5n2C34X5gBKD8uxbeT-H_A-EgCyyUep55Q>
    <xmx:VGY4YS_J4nBSv-9Ibt04tyMFvxU-FWwmqhSOVjEfk9_l-FKSVDS6Jw>
    <xmx:VGY4YZb5TBzBNlMXONNPkfjYyDVKUiFnHAYPNsNE-0pSgTOGsy75Kg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Sep 2021 03:29:24 -0400 (EDT)
Date: Wed, 8 Sep 2021 09:29:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: sun6i-apb0: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <20210908072923.4eqv6ajmextuvbft@gilmour>
References: <20210907085257.4968-1-caihuoqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v3rvg2w546bpoua2"
Content-Disposition: inline
In-Reply-To: <20210907085257.4968-1-caihuoqing@baidu.com>


--v3rvg2w546bpoua2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 04:52:57PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied, thanks
Maxime

--v3rvg2w546bpoua2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYThmUwAKCRDj7w1vZxhR
xX8DAP90YIhSpAVWNCRKcK89bxK00EJuFmmMwcE8k7tRUDDRfwEA4rFMXVr9r6gv
09Mv8TDLN0C5I+TV3We2Oe/wX/z1bAs=
=lKwy
-----END PGP SIGNATURE-----

--v3rvg2w546bpoua2--
