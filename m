Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11163D47A3
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652571; cv=none; b=BrQZqjOe3XPUSehqqrqT93Xierp++BmNSJDRa8XPssJx8PXfYKRhWYX5W1HNT08lE3PYVuoEYbFK7729odX5zGH6Wx9j3GiywfF5QoFO8kjxp6DBahMnG2RcRF7fIN6hvHs3mLetf0RgrxkTc2H1dijdmig7m/DV3jKKttTyiqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652571; c=relaxed/simple;
	bh=46cyJQi/cjeFUUETTdN2AqDb6g5b1h0Fi8I69ld2UsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kH5ZWpAkjLQ8kCQZ5LNhxPTQA8obdaZxP5+HJTdnfIfGnfjDykPwq6Ipgss9+Blyfiolo0vJWTqxstj2Hy1hMTJKMiZV8CB50XbHLdjNOvTWSVEPhDEMsqdmwlwoj8XHBQIHA31PYWwqm+WawDPyCSCiSkzqkmNdtaJtSoFRSXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SofHWOYD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SofHWOYD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3D51F000E9;
	Tue, 25 Aug 2026 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787652569;
	bh=sQW+LVnQkBn/WgkvK10WAOYqeej8DJ7EoRbAVdKFc90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SofHWOYDNh06WUgpx2m8qD1RgD3fJmGoqHYXF8ESPit46Kw3n+8qzgGxukHVivWP7
	 oEwRWnfnwcdmjZ4A3W0/eIfSqwCFpcpIDypbTQRnlI70tJTXdCMLNV3yxMbx24Cu7n
	 vDUASlfcB/IyDwiVtKMHIt02u3jpSQVTJh57rrIA47pZzTsY5M89ixFFt7nhzav+Az
	 EhFwzbRHuZwDsbaZL7yD8wTHSNpoTLNw2Zj0/1prWf37EypHhjYx7dAmFHUUoff1PD
	 DA0XSaHhWghLSoTK9gXR1Wxu5oUCZfdPkV4jt8EuAJgOdJA3B45r8HAGgMk0k4vXP2
	 yfqsYhUtghUfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: ethernet: sun4i-emac: Fix IRQ error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260824100901.31675-1-phucduc.bui@gmail.com>
References: <20260824100901.31675-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 10:09:28 +0000
Message-Id: <20260825100929.5F3D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional call to `dma_release_channel(db->rx_chan)` in the `e=
mac_probe()` error path can cause a kernel panic if DMA configuration fails.
- [High] The driver unconditionally enables MAC interrupts during system re=
sume, even if the network interface was logically down, which can permanent=
ly break the interface.
--

--- Patch [1]: [PATCH net] net: ethernet: sun4i-emac: Fix IRQ error handlin=
g ---
commit aeff88d2fcbccbc3cb84803b3c45048b12777cd3
Author: bui duc phuc <phucduc.bui@gmail.com>

net: ethernet: sun4i-emac: Fix IRQ error handling

irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails.
The current code checks for -ENXIO and therefore does not detect the
failure.

Check for a zero return value and convert it to -ENXIO.

> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/et=
hernet/allwinner/sun4i-emac.c
> index 42174249ef61d..942454e294882 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -996,9 +996,9 @@ static int emac_probe(struct platform_device *pdev)
>  	/* fill in parameters for net-dev structure */
>  	ndev->base_addr =3D (unsigned long)db->membase;
>  	ndev->irq =3D irq_of_parse_and_map(np, 0);
> -	if (ndev->irq =3D=3D -ENXIO) {
> +	if (!ndev->irq) {
>  		netdev_err(ndev, "No irq resource\n");
> -		ret =3D ndev->irq;
> +		ret =3D -ENXIO;
>  		goto out_iounmap;
>  	}
> =20

[Severity: High]
This isn't a bug introduced by this patch, but is there a pre-existing panic
risk during error handling later in emac_probe()?

If emac_configure_dma() fails, it explicitly sets db->rx_chan to NULL:

drivers/net/ethernet/allwinner/sun4i-emac.c:emac_configure_dma() {
    ...
    db->rx_chan =3D NULL;
    ...
}

If a subsequent initialization step such as devm_clk_get() fails, the probe
error path unconditionally calls dma_release_channel():

drivers/net/ethernet/allwinner/sun4i-emac.c:emac_probe() {
    ...
out_dispose_mapping:
    irq_dispose_mapping(ndev->irq);
    dma_release_channel(db->rx_chan);
    ...
}

Will dma_release_channel() dereference the null channel pointer (via
chan->client_count) without checking for a null value first?

[Severity: High]
This is also a pre-existing issue, but does emac_resume() unconditionally
enable mac interrupts even if the network interface is down?

If the system goes to sleep while the interface is logically down (meaning
emac_open() was never called and no irq handler is registered), the resume
handler still calls emac_init_device():

drivers/net/ethernet/allwinner/sun4i-emac.c:emac_resume() {
    ...
    emac_init_device(ndev);
    ...
}

Which in turn enables hardware interrupts:

drivers/net/ethernet/allwinner/sun4i-emac.c:emac_init_device() {
    ...
    writel(reg_val, db->membase + EMAC_INT_CTL_REG);
    ...
}

If the hardware subsequently asserts an interrupt (for example, from broadc=
ast
packets) but no handler is registered, will this cause an interrupt storm t=
hat
forces the generic irq subsystem to permanently disable the interrupt line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824100901.3167=
5-1-phucduc.bui@gmail.com?part=3D1
