Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35269200129
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Sep 2024 08:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725350987; cv=none; b=n602y5kBEKwglcr/EEWmMR8flDjB88gBM91OtpsMUDHKtrje7EjrqhZKddTl3p+ZKjupALp9+ABR51vZhtJGMw/i/lFAyfAGleKu8jpZWgWEApHXd1dYvTCnaxOriU35UIfUDo42dbphIt3BqFnWAnGAoRqpSH3Xkrih1rcmUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725350987; c=relaxed/simple;
	bh=pj9p0QWwch4e6isNgPEhFKln/Q7BPp97o6NaLaFyiVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGJ9sPfVnhGcTYMay3Xql19vVgCy60wIzhsLPqmMp6bj+k6Ty6s/Ye5KWTPtxFXEFceqZljak25NlHZznRRfkUVAUMstRFAPhNrDBByf4UZ0LpMHZjCom+sNlngLUvKzfwIceaZOtQ9VFrLlyun4hDIWyq/p9E8CE9ciTMcPvw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VcMHhPhL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VcMHhPhL"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-533461323cdso6305317e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Sep 2024 01:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725350983; x=1725955783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DEGxfQbmvQ7ocJLBpc0e2cOp9yeV28k7sarvQaoPLOE=;
        b=VcMHhPhL/5Bhc/ow86KMBdNlmO3iDXAPvQ8vecOIxEutAHj1xDBduksI0+fZnV+cLr
         C4gBUTsKYT6SgUvR4pmDrUVWpLC/OsK9FDh3rxTg1e+oJiPULXKejGgCWyxOfll38XTg
         MRQboyAZdJhQAQMfvOBfx8f6MIQ/SDEwQ35nrXWdAdQkMjtcRITLS4//Rwnnpf2scHa+
         CgdLJxOMSfTWkhw+CHYFNcRhhzXDTsxvp/8gRjz254Sy5yzFfVPA6mN1tS/Ck7M4D6cf
         JHG8XRLCbKR2pEEsKwQp1M/gPEwSsvQTWDGi8YvqKaawNnuDJBlPZVNysWEoRRl+UJqa
         3V1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725350983; x=1725955783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEGxfQbmvQ7ocJLBpc0e2cOp9yeV28k7sarvQaoPLOE=;
        b=lo93eD5MzCZ/CAyh178AH5dpjDOmYl6BGikMgRqNbFexdFM1i7kKDAMhF6j/dGOFEB
         gFhi8H0rhZjqGhugicihtAsf8KMOQzVQHQAWCBjat/vBk0fKAbIv/nciJFGxWxwmWw/f
         gctpzvdFOFzN2nRN3/Z3QFzlrBZGtGuIWIbqFo8OYpLpdgiU4PBsHD8OVb0c5Qksx2z1
         dhQ/NKQbqexO3GXur2jr5zCau0ziKJGGFFmi5QA2CDjf5jsAE1Mk81cHirk93eX8zaDv
         9wx8b2OPLImmr8ToWMEouhap9KGvo9aL+BSgEvCutyjD1ESdgyKiDYVrlrpw8gjtccjZ
         i6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdIQXH1Bygz+tx0KmbjGtUu8f94UE7Zz81fUTXA7q5++BX5SLD4G+XmbxdSkb7iYgB7LvxNencR2eMIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrMUee5ozUzZS2fE8pEts3HhQLi6arYGCFcsQSkNprrNblJDXL
	ivPz8fRA/D8MISad+WQ8JTn8cBknaZevRu+HGJTCuhCWoTBPuAbliwAqfQd2OEE=
X-Google-Smtp-Source: AGHT+IFYKyym0YuUdTDq7DecK3lEk0OE1VtjFf04ZMXnGn6KhugpgO6dUgJJH2bhiMsBfP+cs+oWvQ==
X-Received: by 2002:a05:6512:3c81:b0:52e:a7a6:ed7f with SMTP id 2adb3069b0e04-53546bbdf6amr6618557e87.60.1725350983003;
        Tue, 03 Sep 2024 01:09:43 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb9f7sm649600166b.42.2024.09.03.01.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 01:09:42 -0700 (PDT)
Date: Tue, 3 Sep 2024 10:09:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: florian.fainelli@broadcom.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org, heiko@sntech.de, 
	yisen.zhuang@huawei.com, salil.mehta@huawei.com, hauke@hauke-m.de, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, 
	wellslutw@gmail.com, radhey.shyam.pandey@amd.com, michal.simek@amd.com, 
	ajay.kathat@microchip.com, claudiu.beznea@tuxon.dev, kvalo@kernel.org, 
	jacky_chou@aspeedtech.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org
Subject: Re: [PATCH net-next 05/12] net: ftgmac100: Convert using
 devm_clk_get_enabled() in ftgmac100_setup_clk()
Message-ID: <nyfm5mxrrvfeu7s25qzjxbatvgnppq7exmca3sccmm6lz7nxan@xxsdgcrueoen>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
 <20240831021334.1907921-6-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pq2mmaq7abqtyo6k"
Content-Disposition: inline
In-Reply-To: <20240831021334.1907921-6-lizetao1@huawei.com>


--pq2mmaq7abqtyo6k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Aug 31, 2024 at 10:13:27AM +0800, Li Zetao wrote:
> Use devm_clk_get_enabled() instead of devm_clk_get() +
> clk_prepare_enable(), which can make the clk consistent with the device
> life cycle and reduce the risk of unreleased clk resources. Since the
> device framework has automatically released the clk resource, there is
> no need to execute clk_disable_unprepare(clk) on the error path, drop
> the cleanup_clk label, and the original error process can return directly.
>=20
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 27 ++++++------------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ether=
net/faraday/ftgmac100.c
> index 4c546c3aef0f..eb57c822c5ac 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1752,13 +1752,10 @@ static int ftgmac100_setup_clk(struct ftgmac100 *=
priv)
>  	struct clk *clk;
>  	int rc;
> =20
> -	clk =3D devm_clk_get(priv->dev, NULL /* MACCLK */);
> +	clk =3D devm_clk_get_enabled(priv->dev, NULL /* MACCLK */);
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
>  	priv->clk =3D clk;
> -	rc =3D clk_prepare_enable(priv->clk);
> -	if (rc)
> -		return rc;
> =20
>  	/* Aspeed specifies a 100MHz clock is required for up to
>  	 * 1000Mbit link speeds. As NCSI is limited to 100Mbit, 25MHz
> @@ -1767,21 +1764,17 @@ static int ftgmac100_setup_clk(struct ftgmac100 *=
priv)
>  	rc =3D clk_set_rate(priv->clk, priv->use_ncsi ? FTGMAC_25MHZ :
>  			  FTGMAC_100MHZ);
>  	if (rc)
> -		goto cleanup_clk;
> +		return rc;
> =20
>  	/* RCLK is for RMII, typically used for NCSI. Optional because it's not
>  	 * necessary if it's the AST2400 MAC, or the MAC is configured for
>  	 * RGMII, or the controller is not an ASPEED-based controller.
>  	 */
> -	priv->rclk =3D devm_clk_get_optional(priv->dev, "RCLK");
> -	rc =3D clk_prepare_enable(priv->rclk);
> -	if (!rc)
> -		return 0;
> +	priv->rclk =3D devm_clk_get_optional_enabled(priv->dev, "RCLK");
> +	if (IS_ERR(priv->rclk))
> +		return PTR_ERR(priv->rclk);
> =20
> -cleanup_clk:
> -	clk_disable_unprepare(priv->clk);
> -
> -	return rc;
> +	return 0;

You're changing semantics here. Before your patch ftgmac100_setup_clk()
was left with priv->clk disabled; now you keep it enabled.

Further note that there is a bug here, because in ftgmac100_probe()
(i.e. the caller of ftgmac100_setup_clk())
clk_disable_unprepare(priv->clk) is called in the error path.
(I only looked quickly, so I might have missed a detail.)

So while your patch is an improvement for clock enable/disable
balancing, it might regress on power consumption.

>  }
> =20
>  static bool ftgmac100_has_child_node(struct device_node *np, const char =
*name)
> @@ -1996,16 +1989,13 @@ static int ftgmac100_probe(struct platform_device=
 *pdev)
>  	err =3D register_netdev(netdev);
>  	if (err) {
>  		dev_err(&pdev->dev, "Failed to register netdev\n");
> -		goto err_register_netdev;
> +		goto err_phy_connect;
>  	}
> =20
>  	netdev_info(netdev, "irq %d, mapped at %p\n", netdev->irq, priv->base);
> =20
>  	return 0;
> =20
> -err_register_netdev:
> -	clk_disable_unprepare(priv->rclk);
> -	clk_disable_unprepare(priv->clk);
>  err_phy_connect:
>  	ftgmac100_phy_disconnect(netdev);
>  err_ncsi_dev:
> @@ -2034,9 +2024,6 @@ static void ftgmac100_remove(struct platform_device=
 *pdev)
>  		ncsi_unregister_dev(priv->ndev);
>  	unregister_netdev(netdev);
> =20
> -	clk_disable_unprepare(priv->rclk);
> -	clk_disable_unprepare(priv->clk);
> -
>  	/* There's a small chance the reset task will have been re-queued,
>  	 * during stop, make sure it's gone before we free the structure.
>  	 */

Best regards
Uwe

--pq2mmaq7abqtyo6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbWxEIACgkQj4D7WH0S
/k6TJAf/W0v6Vj052O0cQyhSYINBBv+sQ3nGD2cYN9LDziAoSbDf3PwBT94aietu
gEoZvEGnvfzGCHrHLRszB/l6AIW7FxiMo0V+zz66sZS/9h/4hmtifwLWFnGieXDf
T4Pj1jlkN0LB30u8Weay3UEPbLD9qsDFiHNisjQ164GhANBLtMuI1HkNtmEz/96z
kd9zkwXSIbpKN64wLAfEctAZq6+UX74/6cdaEc6CtrdC8Ipv6cQqfjsedO7YfVRu
7IgXK4ashAN8mOti5j66/tm48sDXkxsfjNEAE5xp3ei6+HB61uLmcSKb1XMDXLnP
JDkq0K28JtDXWQyiLytwTQvbzx80mw==
=PiiM
-----END PGP SIGNATURE-----

--pq2mmaq7abqtyo6k--
