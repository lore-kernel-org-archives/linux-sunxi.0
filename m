Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BB9381EA6
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774823; cv=none; b=grh1HhWhMPH4+sUkEX3G24XAXL9mhhWUnmTtLekHjc4u9pneWhu+KFYMBpoJzv2ldRMdXN8Jod459kpRMm2rRd45Gu4yw63rAg7WsAsntmBQ4fNuxo2Cck2+AQSnBrfUx1aNkE9x/k4jptj5RLnWwDHlERgw4j7WWnzkJ5daVM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774823; c=relaxed/simple;
	bh=umruMMe96Z3MO/xB8l0Kz/bJ6R/9ma3dxfptrBnDKRI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AOOhGZjWyIPGXfvJB//CxsvPZKAiNrGOp5bv21TkzMXmaR1H9dLz8FshxiXYOf9MY+qkIyQWsSaYxGD3wC4IZw+BHnshTh4jAVG6mQhncjeAvCfTVNXTu1P+GNMehcm4kHLWfTruHTa9EjE/gd3thtUUyfuZZ2qgqk1M1KXLVJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVvtRmN3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVvtRmN3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEAC41F000E9;
	Mon,  3 Aug 2026 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785774821;
	bh=S4XWqEvwIJW8yYn3VBhpGSI/Zryxk7Egi2STk3Nq/n0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nVvtRmN3yjLgDSVmyikiSAxxOVMjBIXsLjmi7XvE8XrrjH06/AIFsjM/OJJMT14e6
	 kag7+zXnbDFBF4qcKQ41/Pd1sCZS7pp8hJRZxPBnTjTZAj3FMYKTAO5RRjlPGXljXo
	 WXlxho3flSxTsnJIeVCbAKbpONB9f0Qn202FrfCxLU3lkQULgYeho1c9gIXcM1GRln
	 GflqcHIGK8FOSZLjWf9vjnyDbq6aRTTE7Ha+eGcbBFEN8b4+KWZpFlA7daBC7pN/Y1
	 Vb/g54qTFSuQ7umrPB5NX1jQScaOmpeSb/443jgBUwVWPA4HKblklMs8q0aKdIgR8/
	 NyQdEPymQQB6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/13] drm/sun4i: hdmi: Don't leak sync polarity bits
 into packet control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <51ba0918ce016a4b45313d5df1b6ce31b8c8731e.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
 <51ba0918ce016a4b45313d5df1b6ce31b8c8731e.1785772659.git.jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 16:33:41 +0000
Message-Id: <20260803163341.AEAC41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Encoder atomic enable callback calls functions that can sleep.
--

--- Patch [7]: [PATCH 07/13] drm/sun4i: hdmi: Don't leak sync polarity bits=
 into packet control ---
commit 65d502c65ade8ff425b6b395888cc0a59bbbb7c3
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

drm/sun4i: hdmi: Don't leak sync polarity bits into packet control

This commit fixes an issue where stale sync polarity bits were ORed into the
packet control register. It replaces the OR assignment with a direct
assignment to prevent selecting incorrect packet types.

> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index e99f52ebb26f0..97253d631b2bd 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -160,7 +160,7 @@ static void sun4i_hdmi_enable(struct drm_encoder *enc=
oder,
> =20
>  	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);

[Severity: High]
This isn't a bug introduced by this patch, but does this code sleep in an
atomic context?

The sun4i_hdmi_enable() function is registered as an encoder atomic enable
callback, which executes in an atomic context during non-blocking commits.
However, it calls drm_atomic_helper_connector_hdmi_update_infoframes() here,
which explicitly acquires a mutex. It also calls clk_prepare_enable() just
above this snippet, which can sleep.

Could calling these sleeping functions during atomic commit paths cause
kernel warnings or potential deadlocks?

> -	val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
> +	val =3D SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
>  	val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(1, SUN4I_HDMI_PKT_END);
>  	writel(val, hdmi->base + SUN4I_HDMI_PKT_CTRL_REG(0));
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785772659.gi=
t.jernej.skrabec@gmail.com?part=3D7
