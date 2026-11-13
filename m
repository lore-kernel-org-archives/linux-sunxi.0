Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794555964;
	b=jXU6f1pkx09koKSrPtYTsgGYqHyzEi0XP5TY7fulOKNjCvnxvq2FI3lB4yYKkIIUuSCP
	 9dks+qIU65LnL8uZb+/zOUGpcGBe7sFnnyLz9q9S5fjkF6O/dAN61WFP46RAWDyHh7JMZ
	 ap3HOJaAENjx2id/HiFI7g7T5W9Y/Vr/+H0eRDLP4NF1jxMxTFQMKZfmDqL6VzhucLakk
	 GAvcG1KlBp6M6Bz4yYwbyld7dYtEbjH/c4ThPIhG9EdBsNxLPU3XXUOvVRvZYcU/c7oQW
	 fK3XhzDdBJtdgkRebNzoQWDYdQARJILAwCdZgoBwwzvY9hWQ4by8oE8/4KV1bKJCFqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=;
	b=ei4Ju1zLV0FPxvDASSmFlz3qSuMfRv3qeqM7NtPLnaFkQ9VeOpUQBtyYaC9YpBm5fh2m
	 PFT85cFfgj/bwN5kt9dJTxkmPGVYQEn4NaaIopuiLcE/01P1O1EODZ5X9MW8ejOAQWsCA
	 Np9pBBTrjtNxP+Cgo8Q5DK01coUJE+jgSROlhREJKcgnLr1Z15XmkW45ktFQABH50DBWk
	 G4x7BTM4D0GarLJBA6b4bQ8PakwcTaI8aUAeYm0Tf/QkdYWBdkNS09zcEO5qE4KNdWh1y
	 2Rtew/9Dns0lVUEM6D4Lm29AcipV/Ac4Iaw3O6J2+8TtmGyjxIA45PZtJbVVJ89IUjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XzGz+B12;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E24606A32E
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Nov 2026 07:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64E24606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XzGz+B12
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c05727a58aso54173e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 23:46:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794555962; cv=none;
        d=google.com; s=arc-20260327;
        b=B8ZJfmgJTo3xoxL0vNz7mPQZlqOGaeyu72VbgAzx1Y4ngV7bh5wm+Bbiy+fBA7ZpE8
         w4m2IjmRccKq8OVsuKYSUjrlwzlB+4LSp6DXPlDxEZtC2mKTW/IALgKmJb0w9BvLaG4e
         68mNf+3HNPx132JBjTHlwFtsBcfI0sIA9OUQjV5TzbDImYEl085/HcmtrAuPGrSvIN6f
         Y9/Tc0M+RKbREb9H8sMhjWxM0k0omUwiiWbNdZfKqbEQBqVGC0XZUQ0g2JNxU5TTTV7Q
         /Q5JKOHmXhEI42/wV0KAWrzMnVmFsYtnKlNJ1kAG88DwMBFtjFGmUFUX1Evb5bdYAx8r
         ZJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=;
        fh=loVGEya56OmY2qBa68V3fRDhAhp9Kj3xGIIV6LlUWAk=;
        b=WroUymubZ3BQ52E/k5QsV5PLezs81qaeLWaL9kwnof6YAIu4gNCZhMmRhBQxXUJ0qE
         wxhFVnC4fnf7ZdBoF2dET/7c/xoEkwwmJEeahO66tBpExnhXnKR2L2XbY2tlwh8Lsoqi
         Cqme7RpYSb6IjMi4EVbpN4D24LAxiZfrGf3F+0pkpEfDiTGt6mSIJwN3oaGPsOmvzE4U
         fQ3DCHJh2bRbcC5xTZe1P60zxJl1DNHTw+IdUBCvzmW5WzxUV1vUEB0PxRfl/MK3tVEw
         y6YKBwc7RVhOTxtRalPHk8IE3r8hTEgKbWUdghx2iZKJ6j8r1dir86bSfMdzXVhqsLio
         ejog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555962; x=1795160762; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=;
        b=XzGz+B12m/6YAU63sTQHe0UVG6WWgUmxEY1FU3qShvk5NKwS6mBtuhHGR5SzPvvB/U
         WmRJ6/8vcHkZty7j9+dhOwcibvxXhjc2UhAdfloiF5Vw7pFXAKGqfYctcgI3CtJRRHAM
         nLX36KV1ber7j2ekv0UAkzj1frQkd5ke8hamqBspvzQVBTAq2p7V76dcm7LgztCDK/AQ
         I22AT5ciOpJq+fT70ztU+5MiBE7WodI1FJ4uOrRXlKMAvyohozOZdM1TRwefOEyRfUKg
         AtmOxIZhUz1uDcRbmiAlWU/zFR1VChMz39j7ifSzlTZW5AmBmV70pq7CChs6wKsNNGwZ
         RsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555962; x=1795160762;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tvPQQMwBZ/Lg3SekknzYW0QsE4BK2jGjRwomhq4ONEc=;
        b=Bs0FmUdsSppDYr7hAdDpyFQx3UnJHSJ5FGTOcuUvBwVWatiCupFNJXMv2ttNUQJq6O
         jPI7ZAny5PmnuD0AslSUQHsTgnfPBVoGIZWo3Rsbpfuhmq+oGoTgoy3GKPqqoTRikTbV
         EKWAqInD0/jmPRSoDn6tQMLiENcGRzTpndQygJ6pjp8RRaecl8mWGXHSbO9ZNbPp8Tj0
         gjcSPAUMZiy4dz58Pzyl6uvZeTrm+/dKw37RGiK2p07BfWTdJL02mHJm25qicsSAUJZ7
         M7uYvZcuSy7CRkgkPdmzfogyPuLuiudTuIzqKU/h7SLQG4yxpRhXF2VMHWYty4Y1CjVG
         uqOw==
X-Forwarded-Encrypted: i=1; AL+hErHEIoqnm/a4+/C2Xxjfhc0YtX6iEEiL1fyUbB6FJkCVVnnWaGn7XT9JgtmmrzDnGRqjXx1NLcnlgp0tUw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9e8CUknYv3IrQ0pAQFdFSwIULkDpOf6p2ImoYBSH+l8av2JhX3
	ypdzA/Uy6WRVb06yhG2P5Fr96LLrDUygh+qKPTfx+435F0UjsoV5osZZNIN016ZP5aI7veY0P+/
	VxoOG4DkERacHXNbMKi4FnHL1U24tAMk=
X-Gm-Gg: AYBFou1+QSEQAocdhZKVZteHQ1nu6zhqMcjLEsyCmjjCmtVYYEgx+1TGmI/6FBRKbAm
	iLx/Osmb7VXLw93jK+ylTaSd0V0IRSCPZt8lJzVYkOfPGQIDTJcfzcCsM1R96JTskyZSlYN8BJX
	07/8VvOboLK4DL85JPiT2ux/hMlVSt0RHudkGGsGqF0bLI/rKD7dIniPgR0ixLHFWjK8Jb7jde5
	MAeMVFpBeKdNathA+35hut+ZWDHRDYsAEp70iso1emSWooCx9yBtDHqoGowU/0KDYvSRrbZD8VO
	6muTeYRW1RSHzqDJ/aJkDfGVkEFI8Hiqx04DBGyM/8BzzCMzm0ftDgbGxOTGcuoESe7XFdUVUgr
	TmU20hQ6f7YwTaPScSwOPfpj7r8jGTO6HV52265D3B1YBm9j+0Noc7YgktNsP3Ws63WFMarE=
X-Received: by 2002:a05:6512:61a4:b0:5c0:465:3fc6 with SMTP id
 2adb3069b0e04-5c1709ce71dmr805206e87.4.1794555962280; Thu, 12 Nov 2026
 23:46:02 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com> <e526541c-f91a-484b-a677-4c55e4a96a7b@lunn.ch>
In-Reply-To: <e526541c-f91a-484b-a677-4c55e4a96a7b@lunn.ch>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:45:50 -0800
X-Gm-Features: AclHuK-IYiE1aDGEHibGFo-Q3L4DjiCYZIfUZ-5mDw69KYbW_QlhkXjxqGYSAjo
Message-ID: <CAEy9hNX_E0riGS-TdDogDWMv3-fpAVFLAjx8F0cvq4Q_rH3REA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Fix use-after-free in the
 MDIO mux error path
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Does this bother anybody? Seems more like this should be for net-next.

No user report. Sashiko found it while reviewing another patch of
mine to this driver, and I have no board with the internal PHY to hit
the error path. I'll resend it for net-next without the stable Cc.

Arun
