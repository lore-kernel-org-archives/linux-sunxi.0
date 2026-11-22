Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372919;
	b=SJs0rQkHrmblAozvA5ACeda+7zzxsf85h30m+309SE7+lh0iJX9FTmf9AmJ7K2bpYoD4
	 95yOJngbHlh1KZiF1vkFgMY4cIkslRUYsxibCZm2Mi+iMLjs7h9O5B0Q1NLY9qizNrYni
	 Jde0KaJbok9hN75yohibfOb99Ku8ajHhBESim8/Q/4LRieMN1dScpIyISCOH/YauVNSfM
	 OhF7Hy6x7n7m8fF/K7zfBb11C1WWhoJXPIsVHqcDGekBeA5FHEg1oMSl1cCVa8QjlNSoC
	 g/Pf09FA9jigbwYDabmyhHJoikGqYaAtSxRhrXG8US4eR5eUGLRDkbCATI8mgEq7oJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372919;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=wOG1V2yDt1QLtUADlJQbWxxkeZPsVgHF+G5UiIC3fWY=;
	b=Sa6raeGTbulZV9ip0Y6jDnjLTPS47ofFVC9izqceaL70v8oTsUxlbAweJ62jz+Y7b0zm
	 FXiqDrlL7tM5A89gZCqU82YuVLRK8/E0LCr+2eWHsRuGY8WI4WJd57nqR+uTu7kbE+Ov1
	 y5MNHrt9UwsVk1D0ci8Xux6k5aBfZ/mkJZrMjJuTH/+pgcTZ/8wkC6SJPxijAbOW2HBzc
	 eBsJkazbiXM+5knT5QdgV4j1tWdNSPdIP9tOPVFiQTGhpGfh6Wgeugu+DKVY+/8gslncj
	 6KDhc35GKhI3riU5nhE443tk07S5P8lmCir14FTSdusUkVl9MyMUTubRJ+E+oUQ3QBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=30hoMqbC;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908A606A33F;
	Sun, 22 Nov 2026 18:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9908A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=30hoMqbC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wOG1V2yDt1QLtUADlJQbWxxkeZPsVgHF+G5UiIC3fWY=; b=30hoMqbCfyqhmqe4/oLaxa9r3W
	07Y4LO/iMb3CIseP1NMI3/zz0MKpKKsUeK5a152LCdgTy8A4E2oFf3wIzerT5BD1dsaE6mwz70xIz
	HrgzAlBweYo0V0T6pI5Je0g+jkTBJxuopmDCp+Sxp8AWO2spt1s2hZZX71fer0saY+FE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVCVh-000bS1-Em; Sun, 22 Nov 2026 19:41:57 +0100
Date: Sun, 22 Nov 2026 19:41:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
Message-ID: <fb3f6cc0-a4ef-4721-af86-6d993ed2aace@lunn.ch>
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
 <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>

> @@ -198,6 +195,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
>  
>  /* Used in RX_CTL1*/
>  #define EMAC_RX_MD              BIT(1)
> +#define EMAC_RX_RUNT_FRM	BIT(2)

This patch highlighted that EMAC_RX_MD is using spaces, not
tabs. Please could you add one more patch to the series fixing it.

      Thanks
	Andrew
