Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F2E33F5AC
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 23:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774309790; cv=none; b=VidGhkJRB1ChwAGGz7nPOM/9ocDIM5TdA5qZ8stY0KaYXSHxKJKdy2/PnRBK3WALIP9EoBRuqdSNEYDCxiTGFfz2Ep0llCl70dFIJHbPgHsauu8gjR8jarrCrMcvx+clCefMFcxoSUiH9770HmRcn4+EorkAUxwyvhEs2tnsx3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774309790; c=relaxed/simple;
	bh=tGIgG4x0tVmgRfuQsw6tg6zo3VdRQ0TMw0o7dZSruE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pgVh3asb+IxX8Y6IDfbv5Kh3mAf4ym2hFZI8KOUtrbR02ZXBlDO5vzMomIDstqCVdXYVgG/5Yo2nL3iyMH2HBY2nNUDsNAA17nxH5WoKJD2bexYVvlUFOtDLA+ZM9eLxTqP2UqFb8ncHoLcNRNAPIrNG9T85Rle1kDcS4gm9kuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8osRxQa; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8osRxQa"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fd27754bso5452685e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 16:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774309787; x=1774914587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGIgG4x0tVmgRfuQsw6tg6zo3VdRQ0TMw0o7dZSruE8=;
        b=Q8osRxQazzSdDh54QHTW4/3zSGOP3A8jB8GnfXySGYhBmKRWHyC9mOWBLNJp6Iw1Cm
         9+a7mYCovDz0eEPvfCCXjU5/qZ3jekfvEbBNk1Okx8trjPyf2g+sg9Avr7OjVoEgs4d/
         2OJQqr5WwbgYGHaJM6FwXE4E2Hy0AuaIsKUMCaCRp8nylnbHaofD+e8w1CITw+76Ovfa
         GwpysaWkhcYSs9AA6pZ5Hqdst7G4HpIE+r3iNBKyzLwooPkQva1KwOYv61wgppIHAXnT
         qSNi9vdDZNFd3dUp/R+qG/dfWESBemOOMcIQX5IF4YslKZQWYEy54sXTIXJkOlkCmgU4
         CUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774309787; x=1774914587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tGIgG4x0tVmgRfuQsw6tg6zo3VdRQ0TMw0o7dZSruE8=;
        b=CcKal55yCVYx6cQ0huts0Jfe8RQNNyaFlh77z/K8MHI07xNsrIa0tjaWX0jM6DANxC
         2fwrojn41hXS/nEHvOA7Ti3+L9DGiZRVmqTagdkvRaYL/j37v4vKerbd5JTQfqkM8Q5q
         H/AC+MEv3aWHyl2021bHZC3/zUM61fjHqk+TPXzgO7PpAvz3Z+USyOrdEWVH2p1DMAnK
         4KzzcSraxQpBCq3IR2tt+I1iBFO4A4sStvFdFvBIHSEwz+2ItW54VDWTck1d5ebYf7XM
         hQqSaLry5YmQF13MV4NDy6F7vHIYE3EiJOMzlUs5uPzoWCw1LQX8HyRZPfXEBYKBAggk
         28Pg==
X-Gm-Message-State: AOJu0Yw5S1kIDhEGzfi0Y9D8RusW0Mx2/KMw0MfHvIuGsoHaDMYRvq8B
	RMoRcS8X7L5Ce7ib9Mszh9uaCVFPsGKtm8NtgavSp0ehviV8E09zXJk+PxE6IzvpSvw=
X-Gm-Gg: ATEYQzxZDsjecAUkCGNnmCgwiMnPULoxaCdcCD8Kve4msEZnJe117nBYbv6D9QdqGfM
	r8GPpLxY+8pWmwQfA/aFXNPZV+/aZScuJlatWU+28K7taO0g+qcc+a0mPzBkAb78++e7o9U9rzY
	pL5xPBBDMPgPOdv4WLLl0dgucj9031Rz6SJ3x6opBVcledqtSUpA6r/o+hjvWyn+idUhMekq66r
	/1PWItXlE+w5ZciITp6gGb7Cw0G2qtbD8PV7Xq6Rs2JHO66kYTJ1l4jwnLviMnKhRBmzCzLpDhS
	+pXWmga1tzkxirB6xs0NzN/zVRunpeuGztNcVVOaqY/GMSlWZvIWRhkc27B9BzLnGMHim8I9ARU
	RBxtz+g7R27RE1FGa/9qIb1Y15s76368rDyqWVV76WH8iiL63/xnp+OMOM3CYXYmH3ncqBSIW4z
	sIZyTy4m3YBXI85tMVubnEcOrGIHLVSidzmXXpNxJPCw==
X-Received: by 2002:a05:600c:3546:b0:485:3f1c:d887 with SMTP id 5b1f17b1804b1-486fee28918mr192372785e9.26.1774309786702;
        Mon, 23 Mar 2026 16:49:46 -0700 (PDT)
Received: from jernej-laptop.localnet ([167.71.101.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116939b8sm12830385e9.3.2026.03.23.16.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:49:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: sun55i: Fix r-spi DMA
Date: Tue, 24 Mar 2026 00:49:42 +0100
Message-ID: <2822434.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260323171927.1256507-1-wens@kernel.org>
References: <20260323171927.1256507-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 23. marec 2026 ob 18:19:26 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> r-spi has DRQs for both the main and MCU DMA controllers on the A523 SoC
> family, however it seems it that it is mainly routed to the MCU DMA
> controller, with no obvious way to change it.
>=20
> Change the DMA channels of r-spi to the MCU so that it works properly.
>=20
> Fixes: 1bec3bd1f839 ("arm64: dts: allwinner: sun55i: Add SPI controllers")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


