Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A05284B4F
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Sep 2026 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595736; cv=none; b=rT+IiQxJHvE9vUvJdnAdWGl9LFcwEuDthRuS4Xb2SD/xtbuAy/K7iYmsBZSM8BYIWRBvU9/KhYGir4eJPUgSUhtnCxpqn2swVrZARyUnxGEE12hjgmL3p4l88z4IA37o59s1l2KNLWRdO257rlOZnKloXYC8m6qDZzpMp4FzBLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595736; c=relaxed/simple;
	bh=pDiiWOWYOTIB/oTlgpzrp5YvQuBvB2w9EHba/1RxpAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XcT7bq33Ej7iUFSBRu/9IhA/RWaGLj0clvJ1ykaYf3ojAQVqPO8fSuOtb8FYbv6B/umtOEHqdTyoW7Tz5nLnk72AyZ4TUX7UFz7wqg+y1+Zo1KzT2RzwvQWRZidrA5qmdSwDx7tc5QkkF/H6hib6ITZtyI1FN72WP077wkrt2ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieb1ddE/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieb1ddE/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAB41F00A3D;
	Sat,  5 Sep 2026 08:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788595734;
	bh=A6amWHM4AJ7uT8U1gedeZ4quxbWdHq06tTycogUK0TU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ieb1ddE/Q4Jqo7Rxp9YzFiSirqQmJazMarKxuD7rVMSgFfebXebszeoBk2BVqXO9X
	 NbNdguEsQcCL+hcDTMVjy+qAThyc7k9nJ9yCK8Q3Kew4/OPVGwAfy6rZAsk0nNnPfv
	 K3bs8HVlow19m0NhUZTSbuVqUgQoUh/GT9/XjDbR+4kkIQBFve/5TU+G/rsWLn++WU
	 2L13niP7/ty88K8Ge94gSJteLMvEFuRPcbsqHGHGXAIonwmUIq1P30qgoltVuGAv7S
	 OgnuX/24Q0Q/ynQ55OJpE5docq14utrwyWeO31TR5QRjG8wlT2qdrxSMxKFxCMLsLP
	 R3hFKC3z2o0Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] net: sun4i-emac: fix missing of_node_put() for phy_node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Li Youhong" <dayou5941@163.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260904080758.2432748-1-dayou5941@163.com>
References: <20260904080758.2432748-1-dayou5941@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 08:08:53 +0000
Message-Id: <20260905080854.5CAB41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional call to `dma_release_channel()` with a potentially N=
ULL pointer in the `emac_probe()` error path causes a kernel panic.
- [High] Premature release of the DMA channel before `unregister_netdev()` =
in `emac_remove()` creates a use-after-free race condition.
--

commit c4716a5c5ccd2a56d9acba6cfcd5d61c3d288e5f
Author: Li Youhong <liyouhong@kylinos.cn>

net: sun4i-emac: fix missing of_node_put() for phy_node

This commit fixes a reference leak on the PHY node in the sun4i-emac driver.
It adds the missing of_node_put() calls on the probe error path and during
device removal to properly decrement the reference count elevated by
of_parse_phandle().

> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/et=
hernet/allwinner/sun4i-emac.c
> index 942454e294882..0ba67a55705d6 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -1067,6 +1067,7 @@ static int emac_probe(struct platform_device *pdev)
>  	return 0;
> =20
>  out_release_sram:
> +	of_node_put(db->phy_node);
>  	sunxi_sram_release(&pdev->dev);
>  out_clk_disable_unprepare:
>  	clk_disable_unprepare(db->clk);

[Severity: High]
This is a pre-existing issue, but just below these lines in the error
handling path of emac_probe(), the code calls:

out_dispose_mapping:
        irq_dispose_mapping(ndev->irq);
        dma_release_channel(db->rx_chan);

Can this unconditional call to dma_release_channel() cause a kernel panic
due to a NULL pointer dereference? If emac_configure_dma() fails to acquire
a DMA channel earlier in emac_probe(), it sets db->rx_chan to NULL and allo=
ws
fallback to non-DMA mode. If a subsequent step like devm_clk_get() then
fails, execution jumps to out_dispose_mapping and dereferences db->rx_chan
without checking if it is NULL.

> @@ -1094,6 +1095,7 @@ static void emac_remove(struct platform_device *pde=
v)
>  	}
> =20
>  	unregister_netdev(ndev);
> +	of_node_put(db->phy_node);
>  	sunxi_sram_release(&pdev->dev);
>  	clk_disable_unprepare(db->clk);
>  	irq_dispose_mapping(ndev->irq);

[Severity: High]
This is a pre-existing issue, but looking at the context right above this in
emac_remove():

    if (db->rx_chan) {
        dmaengine_terminate_all(db->rx_chan);
        dma_release_channel(db->rx_chan);
    }

    unregister_netdev(ndev);

Does releasing the DMA channel before unregistering the network device crea=
te
a use-after-free race condition?

The network interface is still logically UP when dma_release_channel() is
called, meaning its IRQ handler (emac_interrupt) is active until
unregister_netdev() completes. If an incoming packet triggers a receive
interrupt in this window, the handler calls emac_rx(), which checks
if db->rx_chan is non-NULL. Since db->rx_chan is not cleared after release,
would this submit a new DMA transaction using the freed channel structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904080758.2432=
748-1-dayou5941@163.com?part=3D1
