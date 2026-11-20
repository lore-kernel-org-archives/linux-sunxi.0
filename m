Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191014;
	b=Ts+dzUvuxS+iQgKBWiE/lVJInHtLhxomkGG5nG4Dwhjkj2yYzZcFmPoOgzLrWux1YoGo
	 XHnXu7lXBQhONPNL6D6hD/FHWYCvf/tnjbNyRSR7nXgfRAmATOVNOaV4ADBqkJpXjbMhV
	 OEy917Ug5Lq9JfIvB4PlOOanTUjdOkHu2BEvKg3K/Mv3AFuBKuXpFYJG+wrOndV0eT450
	 UZG89m2IJyBbzdOIWUwHLhqHEBDQqNy7+7Zjbz04NrU8e7A0ZmcKlgBc8KcpTLemKnMBx
	 vaqVnL9Xnbq7vYlMgv82Y3iKJmi6cffFj/ojcdLOQGq17UUsR36MFR9EBp8ZAiKgIXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191014;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wjedrqTGiWbFU0bPpU3W15jofq1/MLeEa9sB086aAFw=;
	b=sTCykGLFP58kkI1DKH9h8XkPhwwC7BGC37B7Z1sxAi2R3qXNh+3DLhxnk1BADL1vl0lw
	 aSxNG1DQV7C9Pi4ryptXnAq7fUflKIyjFEto7krVjrOSEKGxi88wFIaSSIfOUVU8+Il0m
	 uncLhNEnNB357Tip1X6bRYSUPGuTUxeDT6LgN0UiQCoVlE3gTLSveWM7dpwC1qiHZPUwW
	 TXpliTp/CTWfMOxX9ff/Fgs35atZ1FPi44SQYdCo+/77t8GLPZ6LmFhl2ARjqb2FfbQbI
	 BMb1q6TKThGIfMzVsR5SpmGNjPesvY3widYf2alT7yaGSdeL1YLidGSS8o/KsPjfg+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ozbY3alG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F0606A32A
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ozbY3alG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DEE1F01563;
	Fri, 20 Nov 2026 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191014;
	bh=wjedrqTGiWbFU0bPpU3W15jofq1/MLeEa9sB086aAFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ozbY3alGN8CwJ8cj93sVl7YubCF4JiKGXDxRA1VKsyd8vj+527oJ/sEB1AyG+mW2E
	 AlBiJ20tgciqIbbP6R3HrOFgkdzZ7piuRCVB5GqkC0+4EyqEKafLTF8fd7SP497Yn4
	 CirFX6UmfnGzApHD/DSciPUjsbvNHv6hyHVKyxkLhZ8cgoft1+p7q0vXjstrret3JT
	 anyPf3wV/UblCdzYjzo4NXGGpE8C8SQag0EQqz+IzX0+M0Bp+uDEkWi81SbypsXq4K
	 ql24ZxH6gIiSmgpjIrNF6bN3I4zKPeIO7UZIP9qkdAHKfLczbukujiob/3Ll8kby74
	 E/ybEvOiNJQIw==
Message-ID: <sashiko-outbox-225539@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] spi: sun6i: Release TX DMA channel when RX is
 unavailable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Gu" <ustc.gu@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261121-sun6i-v1-1-ce211aace0e8@gmail.com>
References: <20261121-sun6i-v1-1-ce211aace0e8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:10:13 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] spi: sun6i: missing Fixes trailer for commit 345980a3a5e5
--

commit a53da7aef94b96fc56cacd8a1daf4ca007f993f9
Author: Felix Gu <ustc.gu@gmail.com>

> spi: sun6i: Release TX DMA channel when RX is unavailable
>
> If requesting the RX DMA channel fails, the controller falls back to PIO
> because DMA is enabled only when both channels are available.
>
> Release the TX channel acquired earlier so it is not held unused until
> driver removal
>
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

[Severity: Low]
This fixes the PIO fallback path in sun6i_spi_probe().  Should this
include:

  Fixes: 345980a3a5e5 ("spi: spi-sun6i: implement DMA-based transfer mode")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-sun6i-v1-1=
-ce211aace0e8@gmail.com?part=3D1
