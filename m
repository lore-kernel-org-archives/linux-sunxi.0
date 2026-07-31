Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771A144C66F
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515106; cv=none; b=GDNId+m13HHmEHTLnro8tVlEHorb8IrqVbqC6qFhsJqfbJG1HHG2ngedilPKEmiqXGgb6aKVh3Sc/Css9d0SPy3v6i0s7m9wpCMIfqtuMIsrFlg83mevCszd9iJ/iQlmhckhKEXA7edlMebQesExosjUUr31wRACiAuVYpY9NoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515106; c=relaxed/simple;
	bh=pz5WBE/M331xGnaJyoAFA3mDaqbDadMQNGT9livtvF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lHBGMDjjiIwjunPA0yfDuXh9snNlrouiVmElMxXG3xHnK5F/2MudV4vworByWA1cWGmgt6B0PmEMDF3tz3b5clDK9OnSgDLx6OATBeJsIyCtINaeXvCGZOOQdgLfEHGleqEMtAPRqO2Af8Gv8WoDuzAm6yWtY4cBgdPWDhO7jxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlsrdw3C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlsrdw3C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E80C1F00ACF;
	Fri, 31 Jul 2026 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785515104;
	bh=HY0qUHYJs188jqIYjNXGEnODpkLRYYjrp0g6yiDDmR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mlsrdw3CyosgAvynSJ1ra3/O2BglihzbBfTe/EPBjBvUOxavbxcBkr9SoimlV7qvC
	 flDDQXiykWuM2g7yfCSdFqY9mVoq2lMxCP9I508OqOXYt4+4koMu+B0EjROGePq93M
	 SIassTlOeHSLasp8a739d04VzjNkA5fZa+kG2xvfbadxBgaFZFEm02RWOCcB7ioODY
	 Jtw/w9rJUc5iwfe1NOp8faa/+G92gPE3/rRq+JxnQotZDoGxgmVlPXhL4icP2Uj5pO
	 D9UfoHlhTWmfbWy9t+s5V5whhV5Mq/0vZ0GXUij189D1VWGfNQDeNERyQ1aSXe97Zm
	 +vurFcPAdlgsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 01/69] video/hdmi: Introduce HDMI version enum
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-1-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
 <20260731-dw-hdmi-qp-scramb-v10-1-294364b2cf15@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:25:03 +0000
Message-Id: <20260731162504.9E80C1F00ACF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `hdmi_version` enum includes `HDMI_VERSION_2_2`, but there is n=
o HDMI 2.2 specification.
--

--- Patch [1]: [PATCH v10 01/69] video/hdmi: Introduce HDMI version enum ---
commit 15fb027a48288332d9771472bd4b270e1f7f2d4b
Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

video/hdmi: Introduce HDMI version enum

This commit introduces an enum to represent various HDMI specification
versions. It is intended to be used by upcoming changes to associate
HDMI connectors and bridges with a maximum supported version.

> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index 8dab78e1f61bd..b80a5ee63bb23 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
[ ... ]
> @@ -27,6 +27,18 @@
>  #include <linux/types.h>
>  #include <linux/device.h>
> =20
> +enum hdmi_version {
> +	HDMI_VERSION_UNKNOWN,
> +	HDMI_VERSION_1_0,
> +	HDMI_VERSION_1_1,
> +	HDMI_VERSION_1_2,
> +	HDMI_VERSION_1_3,
> +	HDMI_VERSION_1_4,
> +	HDMI_VERSION_2_0,
> +	HDMI_VERSION_2_1,
> +	HDMI_VERSION_2_2,

[Severity: Low]
This isn't a bug, but is HDMI_VERSION_2_2 intended to be here?

The latest major specification family released by the HDMI Forum is 2.1, and
there is no HDMI 2.2 specification.

Could this have been conflated with HDCP 2.2, which is frequently used
alongside HDMI 2.0/2.1? Including a non-existent version could lead to
incorrect capability reporting if drivers attempt to set it as a maximum
supported version.

> +};
> +
>  enum hdmi_packet_type {
>  	HDMI_PACKET_TYPE_NULL =3D 0x00,
>  	HDMI_PACKET_TYPE_AUDIO_CLOCK_REGEN =3D 0x01,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-dw-hdmi-qp=
-scramb-v10-0-294364b2cf15@collabora.com?part=3D1
