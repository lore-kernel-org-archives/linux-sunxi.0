Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518981;
	b=FnAnjomy9wARcgLN2yKnsWEay4rjAG74yOvzS3by/qWghAM+a7ScxKPqlNttJq8txf90
	 yT+nlZvbwBpMpjDmNaZv8rRw9afueG1JcpzJGTJL3738C9HvxiZp5t7vUQHWdrbE3TzYj
	 5Lab5hxApmKlsql7NTkvcXHJ/CRuPzp1CcPi1A8zRiXUdlkx/tbA35tBcysZux4bkIGwA
	 8BgWctXSWoWOkZlBSWXN34WUXzuG1m1QvVhtkz4yFCdUsT9+wChYaxijPGsoo7FXQpm6e
	 n9lACHtQjtG6XgIk16jGF9UQOaQQ/oY3widXqcqa2T9YLK9EQjfZ6a0TptptVnAJrNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518981;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=muxY4t+JASM5puVdEtPnoVoZ9a0aIbs760H+tQNuqfA=;
	b=TY/Rm81QGIkPALMA0luAaNhPIrg047YkyIUB28yElmaG+SObG5D/rYvCz7avrLzIVG+d
	 Gjhd3p2UUCmnzkOVCRu++WjARj1nA7srHRMJTGPT7X4z8HmUQ+kPVVO1GukhAg/1YyhRL
	 8A25Xdi/AZUFhDXiAr+WzVCFtYk3EMGyd3me2ROejb4lQTL/kfml54XUOoD8hkiLoSJqx
	 zcfrWJGKzDAonbXh/9cxPvDoVteGmTyOsb4KpSJL9Tz/E48FEfJl6FcvxB9pDvT5m1uHb
	 O+5ssur2vdLEx5lYqciHuqgy6NGj9lLjNyseHLyc6lzlLrQXIG6LEkfUmnWoNjBiFRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hKos+bSh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591F4606A321;
	Tue, 24 Nov 2026 11:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hKos+bSh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2A71F000CF;
	Tue, 24 Nov 2026 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518980;
	bh=muxY4t+JASM5puVdEtPnoVoZ9a0aIbs760H+tQNuqfA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hKos+bShwfIe7Dgym62Fg+t4JI0I36+nzK/h0qFQk4b7Z6URMMBHY1zt+E13ieAdb
	 o4p7TxQrRW9leNas20xjn5LKANfaw0i9iRzoUDtF7Edi/L1nkm6UvJyMRspiXKB4dc
	 tjw17G9ue+Pj1TCRWQ1iEL2fKWHF+cM1HvxKZkRY0H1EWUyIp6vy7fNpJEBg/49Fsy
	 9+LBSi3aDFraQq/k6cW6MBBbpOmzoin1FaiXo2KDTP+vrkHg5PRGJmzhUeuGZ7MKeN
	 s4nKZE9z+U2ptz5w4hznAmFo59w5k7S8AMA0of6tPxeIYzCDzq+YA8O0NwzLUnhqTK
	 +ADOQQYAfHNLQ==
Subject: Re: [PATCH net-next v4 3/5] net: stmmac: Balance runtime PM when the
 probe fails
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, p.zabel@pengutronix.de,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 11:16:19 +0000
Message-ID: <179551897911.3135.10060956110819643456@kernel.org>
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-3-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-3-57eba8915f25@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 (1) · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In __stmmac_dvr_probe()
  (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c), the patch adds an…
- [Low] The patch fixes a real, user-visible runtime-PM bug in
  __stmmac_dvr_probe() but has no Fixes: tag.

Pre-existing issues:
- [Medium] Before stmmac_hw_init(), __stmmac_dvr_probe() asserts and then
  deasserts priv->plat->stmmac_rst, and deasserts the shared…

--

net: stmmac: Balance runtime PM when the probe fails

This adds pm_runtime_disable() and pm_runtime_put_noidle() at the
error_mdio_register label in __stmmac_dvr_probe(). A failed or deferred
probe then undoes the runtime PM enable and the usage count taken before
stmmac_mdio_register(), the same way stmmac_dvr_remove() does.

> Undo both, as stmmac_dvr_remove() does.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

[Severity: Low]
Should this have a Fixes: tag?

Commit 5ec55823438e ("net: stmmac: add clocks management for gmac
driver") added the pm_runtime_get_noresume(), pm_runtime_set_active()
and pm_runtime_enable() sequence to __stmmac_dvr_probe(). The only
matching pm_runtime_put() is on the success path, and the error labels
were never updated.

Something like:

Fixes: 5ec55823438e ("net: stmmac: add clocks management for gmac driver")

would let stable tell which kernels need this. It would usually be
targeted at the net tree as well.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f256244ce0d11..4ebf4b6253743 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8407,6 +8407,8 @@ static int __stmmac_dvr_probe(struct device *device,
>  error_pcs_setup:
>  	stmmac_mdio_unregister(ndev);
>  error_mdio_register:
> +	pm_runtime_disable(device);
> +	pm_runtime_put_noidle(device);

[Severity: High]
Is this pm_runtime_disable() balanced on PCI based stmmac devices?

The probe path only enables runtime PM when it is not already enabled:

	pm_runtime_get_noresume(device);
	pm_runtime_set_active(device);
	if (!pm_runtime_enabled(device))
		pm_runtime_enable(device);

Commit d90d0c175cf2 ("net: stmmac: Fix "Unbalanced pm_runtime_enable!"
warning") made that check conditional. The PCI core has already enabled
runtime PM before any driver binds:

drivers/pci/bus.c:pci_bus_add_device() {
    ...
	pm_runtime_enable(&dev->dev);
    ...
}

So for the PCI glue drivers (stmmac_pci.c, dwmac-intel.c,
dwmac-loongson.c, dwmac-motorcomm.c), probe skips the enable. This
error path still disables, though. That removes the PCI core's enable
and leaves disable_depth at 1.

Every failure from stmmac_mdio_register() onward ends up here. That
includes -EPROBE_DEFER, and also failures from stmmac_pcs_setup(),
stmmac_phylink_setup(), stmmac_register_devlink() and
register_netdev(). After that:

local_pci_probe()
    pm_runtime_put_sync(dev);      <- no effect, runtime PM disabled
really_probe()
    device_unbind_cleanup()
        pm_runtime_reinit()
            pm_runtime_set_suspended(dev);

pm_runtime_reinit() finds runtime PM disabled and the status
RPM_ACTIVE. The function is still in D0, but it is recorded as
RPM_SUSPENDED, and the parent bridge's child_count is decremented.

When stmmac itself retries a deferred probe, it re-enables runtime PM.
If the failure is permanent, or a different driver binds next (for
example vfio-pci through driver_override), runtime PM stays disabled
and the device still never runtime-suspends. The PCI callers'
error paths, such as intel_eth_pci_probe(), do not restore it.

Isn't that the same symptom the commit message says this fixes?

Could a local bool record whether this probe actually called
pm_runtime_enable(), so pm_runtime_disable() is only called in that
case?

stmmac_dvr_remove(), which the commit message names as the model,
already has the same unconditional pm_runtime_disable(). It looks like
it has the same mismatch on PCI. Later patches in the series do not
appear to change this error path.

>  	stmmac_napi_del(ndev);
>  error_hw_init:
>  	destroy_workqueue(priv->wq);

[Severity: Medium]
This issue is pre-existing and was not introduced by this patch, and it
is separate from the runtime PM problem. Since this error path is being
matched against stmmac_dvr_remove(), should it also put the resets
back?

Before stmmac_hw_init(), __stmmac_dvr_probe() does:

	if (priv->plat->stmmac_rst) {
		ret = reset_control_assert(priv->plat->stmmac_rst);
		reset_control_deassert(priv->plat->stmmac_rst);
		...
	}

	ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);

stmmac_dvr_remove() asserts both again:

	if (priv->plat->stmmac_rst)
		reset_control_assert(priv->plat->stmmac_rst);
	reset_control_assert(priv->plat->stmmac_ahb_rst);

None of the probe error labels do this. After a failed or deferred
probe, the MAC is left out of reset.

stmmac_ahb_rst comes from devm_reset_control_get_optional_shared() in
stmmac_probe_config_dt(), and devres releases the handle without
asserting it. Could that leave the shared deassert_count raised? If
so, another consumer sharing the AHB reset could no longer really
assert it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25%40gmail.com
