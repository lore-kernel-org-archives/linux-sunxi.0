Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6657734CDD
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180308; cv=none; b=k7MUfg4NvNYWNYpB/9+RnyF6BLE/cdi5UoVLup8Re876VX1vwdU5PnVqkUH/vnWnTMwVpcLaLvRs7N3qdr/bXePpf6i44ZVnCOQrFVk+l2bYZRhtDDjpHspFh5A93MzvSkR+XE2nC9sdGERBlnOl9Z5MeNbXc/5zn26JapbI410=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180308; c=relaxed/simple;
	bh=5yuQUr1Wk7aV+qJ2fywNBTpKtiXizKPYAo+THc/os4A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qxgfhkE+fIqutUhnMOPjF0daOcKhbsflHef4bB+hpinTILS3drr1nD7Uv8GyIjeJweSkDI18ZUhTO+CjCAXQjObm5TqynKblxpFirGQ21h6zCjzlnE8rjGHyAZLAdG+siiRN91n2lOh7qk3yCfKdCssi/No3h4969wEG3anbOmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbKj3ZgE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbKj3ZgE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52F81F000E9;
	Sat,  8 Aug 2026 09:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786180306;
	bh=vXmv6kK5AbneqyCLIBqvNa2najsgtmJG8qHAj5G/aNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GbKj3ZgE4F0AjulN1+S0dPl7YOOKH2MjRMW8TvuyQ/3s/jMHUNq+G4I2+ZxfQNdLU
	 oIuj/GC/oGBe/qUTIjlo8YgoA79U/gthT5Usa/rU14zk6+2G981soovyosJWqLVbOq
	 NdLXa0CT+g7z/5ktD1EfremdNLtXs+GZQhNZxi3c2LyJ6Lk9wyK8nIdMvTdeGQiSuc
	 4smAyauWM5UyWb3TLPDR71Kt3md3qlXby0luTjrHrd0EzM/dtodEUIl9JsxKjUHlgV
	 8NTPUVAuZIA+vcatP09GKGi+hKJFbFH2CRKqWXt63L9KJm/kHeMaBNjJRaNCQiJmxD
	 S8F7a7g2wjOzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] crypto: sun4i-ss: fix autosuspend cleanup during
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260808085337.2715506-1-lgs201920130244@gmail.com>
References: <20260808085337.2715506-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 09:11:46 +0000
Message-Id: <20260808091146.C52F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced clock cleanup in the runtime PM resume error path
- [High] Memory leak and Use-After-Free of debugfs entries during device re=
moval
- [High] Use-After-Free of device context when unbinding the device via sys=
fs with active TFMs
--

--- Patch [1]: [PATCH] crypto: sun4i-ss: fix autosuspend cleanup during tea=
rdown ---
commit 498a2e7e81cded38e9654e9d63d7f5c6261e2d92
Author: Guangshuo Li <lgs201920130244@gmail.com>

crypto: sun4i-ss: fix autosuspend cleanup during teardown

sun4i_ss_pm_init() calls pm_runtime_use_autosuspend(), but the
autosuspend setting is not undone if pm_runtime_set_suspended() fails
or when runtime PM is later torn down by sun4i_ss_pm_exit().

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Undo the autosuspend setting when pm_runtime_set_suspended() fails and
in sun4i_ss_pm_exit() before disabling runtime PM.

Fixes: 554c42b4efd4 ("crypto: sun4i-ss - enable pm_runtime")
Cc: stable@vger.kernel.org

> diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c b/drivers/=
crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> index 35ef0930e77f1..10c0f05994ed8 100644
> --- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c
> @@ -304,14 +304,17 @@ static int sun4i_ss_pm_init(struct sun4i_ss_ctx *ss)
>  	pm_runtime_set_autosuspend_delay(ss->dev, 2000);
> =20
>  	err =3D pm_runtime_set_suspended(ss->dev);
> -	if (err)
> +	if (err) {
> +		pm_runtime_dont_use_autosuspend(ss->dev);
>  		return err;
> +	}
>  	pm_runtime_enable(ss->dev);
>  	return err;
>  }
> =20
>  static void sun4i_ss_pm_exit(struct sun4i_ss_ctx *ss)
>  {
> +	pm_runtime_dont_use_autosuspend(ss->dev);
>  	pm_runtime_disable(ss->dev);
>  }

[Severity: High]
This is a pre-existing issue, but does the error path in sun4i_ss_pm_resume=
()
corrupt the clock framework's reference counting?

If clk_prepare_enable(ss->busclk) fails, the code jumps to err_enable:

err_enable:
    sun4i_ss_pm_suspend(dev);
    return err;

sun4i_ss_pm_suspend() then unconditionally disables both clocks:

    clk_disable_unprepare(ss->ssclk);
    clk_disable_unprepare(ss->busclk);

Since busclk failed to enable and ssclk wasn't attempted yet, does calling
clk_disable_unprepare() on them drop the prepare_count and enable_count bel=
ow
zero?

[Severity: High]
This isn't a bug introduced by this patch, but does the driver leak debugfs
entries during device removal?

In sun4i_ss_probe(), the debugfs entries are created:

    ss->dbgfs_dir =3D debugfs_create_dir("sun4i-ss", NULL);
    ss->dbgfs_stats =3D debugfs_create_file("stats", 0444, ss->dbgfs_dir, s=
s,
                                          &sun4i_ss_debugfs_fops);

The device removal path in sun4i_ss_remove() lacks a corresponding
debugfs_remove_recursive() call.

Could this leak the debugfs dentries, and potentially lead to a use-after-f=
ree
if a user reads the leaked stats file after devres has freed the ss context?

[Severity: High]
This is a pre-existing issue, but is there a use-after-free risk when unbin=
ding
the device with active TFMs?

In sun4i_ss_remove(), algorithms are unregistered:

    crypto_unregister_skcipher(&ss_algs[i].alg.crypto);

This merely removes the algorithms from the active list without waiting for
active TFMs to close. Since the context is managed by devm_kzalloc, devres
will free it immediately after remove completes.

If an unprivileged user keeps a TFM open, could callbacks like
sun4i_ss_cipher_poll() access freed memory when dereferencing op->ss?

sun4i_ss_cipher_poll()
    struct crypto_skcipher *tfm =3D crypto_skcipher_reqtfm(areq);
    struct sun4i_tfm_ctx *op =3D crypto_skcipher_ctx(tfm);
    // op->ss is accessed here

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808085337.2715=
506-1-lgs201920130244@gmail.com?part=3D1
