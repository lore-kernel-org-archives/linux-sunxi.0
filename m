Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091822571DE
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Sep 2025 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637353; cv=none; b=XjlJCaGO76V5KoSDsLvvgMqVk8s7TRSUlO8vC/r6MNdlyKJmZ2hr9EenFzaekjPnkFM6F3REZOAMjfFjnDKN6wRbV/kRfTPuQoqPl3vZ2va7SH2Q8R32dd76KHPph3GWz5eFiN5Z3hk5SMcqFItAt0KUtfn3wdSeSkRG6eNFvuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637353; c=relaxed/simple;
	bh=jxex2Vy8xhpU4HlbEMJEgN+VUIJscyKji7VvhhBioyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fvuUwhSy3aBcF4Y5+tKfb1uQ+Tx/y/0NXW8uQv2wlLKo8GCFJpmPMUAzVEHD86VD1eGiR1gbdvt2YdhIKfcW5/3K5owfp4x+T+t5WPrbF9GSBzWDsWz5+dOKy69dynn3x44xyZTMZwVj6R8+m4VXObcUFtP2K41w7bzd7BC4+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGYI1BOa; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGYI1BOa"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso3405239f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Sep 2025 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758637349; x=1759242149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxex2Vy8xhpU4HlbEMJEgN+VUIJscyKji7VvhhBioyw=;
        b=aGYI1BOaBtnPMaPdldCglUvzrAtMVHKa/7v6CIENbDIdSMu2Pc6/o8IXMst7nCV9V3
         DwyxXvi1JU20QozXDlurwLH/VasQrLvk4RO787RT7Rw4RNZpRg+ifD3lFVpur0QezXdJ
         PH4eijUr/5Way2QZqM51rFWb163jJAX8Aj8K3OqhpeBtnGM/PO9DxYICiRZL9WwfFior
         YahM+ffVq2fYsJfD8ugtFmwJz82dsXtV/L6tGbh/uhzwaZOHRxRBAvak7qhCsbQM/zW0
         o047zNH7PLyO+0+rhhqg/2E8JcE5PTNEDBA3ALOSywFDLvSnWpydWk99ZsP3+ZFtdwxK
         cobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637349; x=1759242149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxex2Vy8xhpU4HlbEMJEgN+VUIJscyKji7VvhhBioyw=;
        b=FuUPwZHyg0e2mEVCvpq1nETpRZgu71alkttifVeAdTFBnEdTpMlKCKKkuyWYfoDt4o
         rxgRoQVtne8Pd/Ni2rp7TsXAq+xBbzbBpRMbgqxtDc9DOt5Koh+/AkcL4sq3YInKLPCx
         DXyf8Jl8TgL/1JauuNsuVUBT1fEtfnzrvGfOz33rNc3seJ2A3qSQTqbMwocM6RWsBglD
         GEuZdvqgemKYRrqWZL0zrVtlU9MutH9ZekssgH6d1K2bu8Hw8Lvobmiu1U3c9Eb8KL5E
         zMqkEfGzP5cnco2Vg8BUi/F6fYD+UrIqUorO7JaCmzvaW8Z3sA60KGllQ1TzVnokOGUO
         U5iA==
X-Forwarded-Encrypted: i=1; AJvYcCU0zePYMP6r/PDjZw9OtAB0lcph7CZSvToYAkP5X3QH1zVE4b/BF9VnoLtOpZWO6nOJWtPw93ewoErOIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAJL9rZzFlAx3gdQBzNhR1DyRWb7ajg2ZpWCcmvcUtCp4CqUNx
	ML62xp8GxVg//hgbC3cSpe/XqawR/d8beR1E7KFmFljxkGrAhOjUWr0c
X-Gm-Gg: ASbGncuBDt3A0AhubsWK0C8DwS06VhWZ1eT15uvKG0pWL4vCodrkD+Vn/2b+ansvZcE
	wWGR5xyqxsZ9lZ+G+RKKTdi6dgEFhhiJWTPdS7qf86AS27UdjNyNl6TjjjZCiHGKueJoToVdgUR
	yM80gYzqdNKRdjOG/6lbNasBajVYfCOJ0pz2qF06m/33CVJuhm87LFS10x0uXUDzoR0E1OKYO3W
	7r1JSRtr7nAyCNyvL0g+q99iahGc/D4Eu6KdtbwYrJqLaKhHA+YSewaSgSnTJlHOVZYnX2no7wr
	YytuvOUWZU2xd4Nm1aEVpOyVNXs2tcM3XBo9eO2fpDeJFhVswAIDNSIN/o71d9Cy4BjMOtVD84a
	3AqncKk/FcTXI1wXMKC5gKlFIzyE6/2BfYIDHzwQa+QZn1O9I32CSMOV7ULTyaPyTp3rK60Jd/+
	gWFLA6
X-Google-Smtp-Source: AGHT+IGjet5wQJA7x9sBQkHVST1A9uu//deoXDFw+WZ7o8/Afi/1TjeFJpy7+SiHbPkDBXjldSD9Ag==
X-Received: by 2002:a05:6000:290a:b0:3e8:f67:894f with SMTP id ffacd0b85a97d-405d299fc65mr2558272f8f.26.1758637349101;
        Tue, 23 Sep 2025 07:22:29 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee074121b2sm24139332f8f.27.2025.09.23.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:22:28 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject:
 Re: [PATCH net-next v7 2/6] net: stmmac: Add support for Allwinner A523
 GMAC200
Date: Tue, 23 Sep 2025 16:22:26 +0200
Message-ID: <2797545.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250923140247.2622602-3-wens@kernel.org>
References:
 <20250923140247.2622602-1-wens@kernel.org>
 <20250923140247.2622602-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 23. september 2025 ob 16:02:42 Srednjeevropski poletni =C4=8Das =
je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The Allwinner A523 SoC family has a second Ethernet controller, called
> the GMAC200 in the BSP and T527 datasheet, and referred to as GMAC1 for
> numbering. This controller, according to BSP sources, is fully
> compatible with a slightly newer version of the Synopsys DWMAC core.
> The glue layer around the controller is the same as found around older
> DWMAC cores on Allwinner SoCs. The only slight difference is that since
> this is the second controller on the SoC, the register for the clock
> delay controls is at a different offset. Last, the integration includes
> a dedicated clock gate for the memory bus and the whole thing is put in
> a separately controllable power domain.
>=20
> Add a new driver for this hardware supporting the integration layer.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


