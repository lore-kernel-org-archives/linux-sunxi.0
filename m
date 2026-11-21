Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257961;
	b=iSjJnlYgQ7F6TDXgpYY7wgWYwxFDD9SG4ymWKgKovaU4kfFJAMCjP/dfrqS5PUrqPaqy
	 2fBFNXY/RE6PwUYJSRUFrWJZ1h6QooWdWLQ8KDKaoNDtuIPwsU97z/XYadtpPD0DL6Twz
	 N1hwjmbviDnEYOTiwJtR8j1IAjeoprPU2UhKgnGevT/wp092tv20U3Zvw9WiHKMn5Xc3U
	 o3CE8uD+EDrbZMUyyEeE/PYmIskQKCrV1rGtzmXDCg1VPCiKrk8xKy8lwwN6fgX5zQeDe
	 zqWyAHD+t7yb0sLyByJlQxYg7p7VAhnoyvxrOaG9Pv9e2kL0xR4xFBHnvBPDcjJcXbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257961;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZKHHmRqXZ2OxGU+lulL4rHFVgrdgdQkwGBrbAMuSqWg=;
	b=Q+JlabhO1ZWb3CQjud34shYaHL681gMqNaEPkH1REgPxTF0WanUZkeGE9Op2GxCsmW7k
	 tp4l/P23HlyCwh5S5NcJdTIUNzr3p9PJ5+4lQ8HMTYehczBMqkBINTcPpUvZg+4Tnpso0
	 /hd8HLSNJMskKAmC+ENHfQVV8aT61ZPknRqn+8cqEWRdpqQUuYvxjTvXbdU0Rd662XAro
	 ZHZkYT8MpiWvstfhUJrMbebb8gRv2SqYNqZJyJ0usAbTVDGcMhSM4O6YkKUAIp7AAYk/p
	 r4deCGV4FLQVrlFfwOILTR6Iog3UZ2La4Rmm61Zq20ipQIxeOB0IPh6WqjRkBQYsTEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hi1Hwauw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB28D606A320
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 10:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hi1Hwauw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E6D1F000CA;
	Sat, 21 Nov 2026 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795257961;
	bh=ZKHHmRqXZ2OxGU+lulL4rHFVgrdgdQkwGBrbAMuSqWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hi1Hwauw/dmS6HskDYYszeiZAYR7Qw90+kwqnwBzX/9zgqTEPAXHO351SoZmZ/RZM
	 OekuYH5abQPLA4p0R1SPpUSK/XtvpwQG2RVfHGB2n1DLLdlYPDdN3CjeD0QSXV6i0Z
	 LThlFS+rRWWXePkcdX7leWZCjJkMmNpxZ6Ptops8bD69MhA+mhsWkRKJir4KGnVCCk
	 4B0dfbXfk4141QuiIKNXgtCCa3lZzhKlJftpjHlIKjpNoSUir3M1zDOC6SeSWTOJjt
	 TcLSfEgchf3Na+vGtICdxpfOf0XREgs4xTvniQjXeIU3Pq+WCCsSp+/KPYGFndIxR+
	 5cx5zSRTKFDlQ==
Message-ID: <sashiko-outbox-226953@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 3/5] net: stmmac: Balance runtime PM when
 the probe fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-3-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
 <20261120-sun8i-emac-mux-uaf-v4-3-57eba8915f25@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 10:46:00 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] net: stmmac: unbalanced pm_runtime_disable() in
  __stmmac_dvr_probe()
- [Low] net: stmmac: missing Fixes trailer for probe runtime PM leak
--

commit 150d8ab7f1c2f574c3442bec9dafca1bba988cdd
Author: Arun Iyengar <aiyengar1990@gmail.com>

> net: stmmac: Balance runtime PM when the probe fails
>
> __stmmac_dvr_probe() enables runtime PM and takes a usage count before
> it registers the MDIO bus, but its error path undoes neither. After a
> failed or deferred probe the device never runtime-suspends.
>
> Undo both, as stmmac_dvr_remove() does.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

[Severity: Low]
Should this bug fix include a Fixes tag for the commit that added runtime
PM handling to probe without cleaning it up on the error path?

  Fixes: 5ec55823438e ("net: stmmac: add clocks management for gmac driver")

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index f256244ce0d11..4ebf4b6253743 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8407,6 +8407,8 @@ static int __stmmac_dvr_probe(struct device *device,
>  error_pcs_setup:
>  	stmmac_mdio_unregister(ndev);
>  error_mdio_register:
> +	pm_runtime_disable(device);
> +	pm_runtime_put_noidle(device);
>  	stmmac_napi_del(ndev);
>  error_hw_init:
>  	destroy_workqueue(priv->wq);

[Severity: Medium]
Can calling pm_runtime_disable(device) unconditionally here leave runtime
PM unbalanced on buses that enable runtime PM before probing?

Earlier in __stmmac_dvr_probe(), pm_runtime_enable() is only called when
runtime PM is not already enabled:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:__stmmac_dvr_probe() {
    ...
	pm_runtime_get_noresume(device);
	pm_runtime_set_active(device);
	if (!pm_runtime_enabled(device))
		pm_runtime_enable(device);
    ...
}

For PCI stmmac devices, pci_bus_add_device() enables runtime PM before the
driver probes, so __stmmac_dvr_probe() skips pm_runtime_enable().  If
stmmac_mdio_register() or a later step fails or defers, this error path
still calls pm_runtime_disable(device), incrementing disable_depth from 0
to 1.  When probe unwind runs pm_runtime_reinit(), it sees runtime PM
disabled and forces the device to RPM_SUSPENDED while still in D0,
decrementing the parent bridge's active child count and causing a
subsequent re-probe's pm_runtime_get_sync() in local_pci_probe() to fail
with -EACCES.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-sun8i-emac=
-mux-uaf-v4-0-57eba8915f25@gmail.com?part=3D3
