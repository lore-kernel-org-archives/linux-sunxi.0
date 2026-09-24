Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F67E481FDD
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263660; cv=none; b=Ynrz/514sI/zTGwxnqZeXpALpoOL3FCQjJOSnX+aEajoXyCBdsW817e0YiA90Ee8NtwZBBuiXOuwDerke9Eal1AKeaZeyzoDTWbsKrX8EtKNfdkSZqqEL3F+0CgmPIL/4HZeNK19u/Lma+y3k3/jje6llxK3gYnAN7Ew/eueH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263660; c=relaxed/simple;
	bh=cyaiCXoXZGoECX+KF+a09pG3FdGWCh+dGbVZ3Xuigsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fDCJAPr2exadbZSliyAeENdCcBnd/YFrKwp1fbAQWnoFj9oKXPjC1Oj8xk9G3eqILHV1XZMfKyHP6550cy+1nBpmriL7Ei0eLNsKcc3G9mkbePxVTj6Pl7m2kfTCfvl0VNbBpWg2Oeed9iCgE1GlM0XkSwd41IextYt4E+ZN6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=geenKHmW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="geenKHmW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so1777878f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790263656; x=1790868456; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRG6Vx+KfGB0F8iXypxpZOtK+1xBSwz+daslPav1QJE=;
        b=geenKHmWN/2qsL1S20WB+if/1tJKj6APIkGO5999mcvKtXonU4hpDBk30XN8GYuxVb
         TrGgGJWazPFIHf4OGVuLr5kRGF18wgeRq3w8L1P12okYHGK4uEHuiIesOm7mAsKtQrST
         8jlzF9DuoBOSgUAyZ6WxEEsYRmbaHFeiZG+zGFUwS0RyFWX/ZAcxUliDeyKhn0f/lFmI
         pWSh0Jx9pe6gdJUfT7JjQEWMNyUDX3lxrxC5z9nM5AcwizWUc0xNSt86PVk6sxP1XB2I
         q9r3Q02Dz4yNU+SL8C3cCCewv8mJGAyFHZGPZTTnqlHxGgHTXw02JBG9cL4eT1i4p/Me
         RIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263656; x=1790868456;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRG6Vx+KfGB0F8iXypxpZOtK+1xBSwz+daslPav1QJE=;
        b=Ilf+Q9P2jkI+LUmTyHcVOwRjsNmUgt2dC3TZ42d+MjZEOIifZmMgQtH4uYMLqoj/UA
         ghe0bikaCv8eBs6fbgezQwG0pc4TdVjDE1KMuCVsnav71nnNzormVEBDIUfBeBitpMv6
         6Cfatz5Wm7/MDOcE5DWDFJtxqw4/9qNGY85fAGjFsPzlbO2J8cN1Go8mAw7/vKx5f2Tc
         xzxbTvwiJWFvy/JQ6xKfemK9IwPjgDPC9Dk21USQr2B7fUhu5zrWimN2T0baw1vkTEY9
         wO/JS3iiqtjbDaafUM83fx3bTXTB/gww3imKr2ra2DF7NRVvLa/RI1sp1I+pnBKIkXKb
         4PiA==
X-Forwarded-Encrypted: i=1; AKwUvBxaT2b33QutTtsk+B3pzsr3Evhqvg3JZvB2r42Xg3onLSOM/NjwlCXY3mbr1xK9MZLaA+2aGrYRxZeRBw==@lists.linux.dev
X-Gm-Message-State: AFuF++l9NfjDCzJR3aIJ7ns0EmemzHeqpRalKUhur7b8B+rNCEjBhXn8
	Cu8MSkRG+sVSGukZKFsPypKZ2ualOzQmeAZ/1769E6QtQbggXPgMiHFpg+sXs61Tv24=
X-Gm-Gg: AYBFou3M7Om9KZx+r7VjA0Il14W1idF1HUHlqSq4565kR+0dEX5t1kpg4ayIIajnnr9
	JHkYvpDu1MjBxc3mTKH0NGy6fsgndcElTqKW/NHLPP6RqeBKzLsJtina5g7FJhTdK70qdo2eNbM
	lkaF9AODSFJdL/CbswNmOj9EjH51kBubq1R40SH4w4B/HkusQRCD6KDSx7OLcQTHLjRO7H/OON5
	oVKoXyAI4IJ+D3wtU/3BvlsnEAFvo6N463m3UTWRMZ31Dv2CfQa2poy4lCCuIoil8IIg89TJJZN
	2YbBvpHDs+lr4n4szsYxdF/ZWwmqS0pDwUbgHBhDs4fhIp/G6YVVDLGHeh1GaqSviJB6PRUSB15
	Be4XyJX1pNUNiVL1hFx46z6B2XEhigj8beJ8ibZ/xE4fME0LuVxU1CUPBUOqAoy11A+G8W8NCs2
	Um7v7fJgE/jtkNpzR6rV++0FBAjV0bj9XukhI5ptzja2YiV9iYXBFav+Zr2NiLn0lHkaNGG/taW
	n4RoSHmCstAjkoyMA==
X-Received: by 2002:a05:6000:1886:b0:486:e8fa:f9b7 with SMTP id ffacd0b85a97d-488716c12f0mr5112120f8f.13.1790263656324;
        Thu, 24 Sep 2026 08:27:36 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668dcsm16823010f8f.1.2026.09.24.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:27:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andre Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 0/5] net: stmmac: Add support for Allwinner
 A733 GMAC210
In-Reply-To: <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
 <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
 <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
Date: Thu, 24 Sep 2026 17:27:31 +0200
Message-ID: <1jv77u8yak.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 24 sept. 2026 at 14:54, Andrew Lunn <andrew@lunn.ch> wrote:

>> I've changed the phy-mode to plain rgmii which seems more in line with
>> what the PHY actually does.
>
> No, it is much messier than that.
>
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287
>
> rgmii-id is very likely to be correct, if you were using a sane PHY.

It is not the PCB doing the delays so rgmii-id it is (in DT) - got it.

I dunno what is sane or not, but the allwinner dwmac drivers do set some
delays. sun8i-dwmac and sun55i-dwmac do so, even before this change.

If I understand correctly :

"""
When the MAC implements the delay, it must ensure that the PHY does not
also implement the same delay. So it must modify the phy-mode it passes
to the PHY, removing the delay it has added. Failure to remove the delay
will result in a non-functioning link
"""

IOW when the gmac has *-internal-delay-ps set and honors them, it should
also amend phymode seen by PHY to make sure it does not add its own
delays, should it ever be fixed ?

>
> But this PHY is going to cause you lots of problems.

We don't get to choose I'm afraid :)

>
>     Andrew
>

-- 
Jerome
