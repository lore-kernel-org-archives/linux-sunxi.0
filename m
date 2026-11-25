Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627557;
	b=ftPm4m8pPPrv/SrKem3ssmpIoUrfV9W17EMDfabV1wWwSIKT3aQta97CMc9Tb6K9TXQs
	 FPQzNmmjsLouKZHUrkk+f7kAWE1NmD3/WYHEJ7MgG5c5nhLeicqQ7GKEQ97bLFo+GOINc
	 GvRZGsfveHypJzVeBdGInYNzL8wtRE52wQbkgzUxOwh/ECs1qfXOIEKdkBX+nWtoYzr41
	 m0ol2F2zaSdzPWtJf1F6HIRquV9HgFOmX2lMse1Fx1LSo+YFjg+sJDYIWimo6a3NtuRLh
	 pufPtovfk+IzvEC23YtDZko/Gwxy7pE4p/BL1+tQqKIfIJ6smt6afK7cTzj1HDPMK1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627557;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=o5fEgMyUcbJhefgMkp+YlONGELhHmA+IN7SXWstqRLA=;
	b=q1WmjiHy8Ug7pdNUJb51SEsOjOnAOpmv/qLFsp5ldweQLeSRjNugTLZhNfH2g+Bnt113
	 jW6WwJYRJr7Pra0LrFILOVN1CE1xmQiDJuKcmuqhAW59jmbxaQAgYVmB3joHGn854lBet
	 NCrcRMDADRGd11fjUwn3cGhCTfPuW0VYfWFkhd7+FzSUjy9UyRkkvpEAWAJTymJjE5haV
	 yS+aG+w/3YBtC6DF9wrmbvsJ9dpEDPcvp008z0GQHM7ok4Fmey2wxHxqACTd+Gklu3x5C
	 DGcVBUlPth/YaQH8b8YlreGmOldoy7OCcwbsIrKjUG5xAe/Q0vuCGAXIVVKgzoWodjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="bRtY/lgv";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17464606A321;
	Wed, 25 Nov 2026 17:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17464606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=bRtY/lgv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=o5fEgMyUcbJhefgMkp+YlONGELhHmA+IN7SXWstqRLA=; b=bRtY/lgvvWuCp1Tp+0rsYkgmcY
	6jojzGwuhLnmwmZJDrYUBCwb/xGcMnZ6Dv3OmswFyoTG0kntkVt4rT3MyCCDGer9cHkCjyvNznIf7
	VinuswpTOpsv/hLfjVLKYBATFzPA/hCl1OyH7/fc2MBYXaFQL3jccp2cBa6XM5Gs1alo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWGkj-001NbL-2y; Wed, 25 Nov 2026 18:25:53 +0100
Date: Wed, 25 Nov 2026 18:25:53 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 3/5] net: stmmac: dwmac-sun55i: Add Allwinner A733
 GMAC210 support
Message-ID: <952f70aa-0c1e-4ef2-a154-bbae0841a291@lunn.ch>
References: <20261125130613.4191841-1-alastair@d-silva.org>
 <20261125130613.4191841-4-alastair@d-silva.org>
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
In-Reply-To: <20261125130613.4191841-4-alastair@d-silva.org>

> @@ -117,10 +154,10 @@ static int sun55i_gmac200_parse_config(struct device *dev,
>  		/* default */
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:

nitpick: No need to change the order.

Andrew
