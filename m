Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362860;
	b=NZR/1ixVac5/6bil5Lw0qMQ5vtr+uujwlEOyQDp2+hWo/3d8dx2WGu7UCpHqhwMiUPRL
	 CbVQCujTrfHBtJ1H1ZDp6BxtSs1i6ciJzn6StOuePMKKY93JYNoPjX/rZrPmPZs4/7VpN
	 2zaxSlHqZPFGb1fUWo6mTZl+vs781tja9ikwcjRppstysK384FNXPNZt2d70vpXhyC2LV
	 sa/2tbQ2hnCo95I2qynSBZ7Zwmoe5S+WpXhB07IfmfwHD83rwgeBuNg5Ydz1Ss1sSkLQb
	 +qrEzuRI4yBe2Ng3a07VzaHqp8TKQjd8hjyeyULKn0FOp+lajgyYPkS2Ef8ETBZhw4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362860;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=3HWPvavJivhpcu05VFMyQQiSuD7eHMUcO0u3LphRL4s=;
	b=EJAntnmIYR/UgVo1NqKHz/s9W+1si0ELgrPN10iotIMojjcS6odCllrO8e5qBQcefOoh
	 83ck2rzgMZz1SHco1UZm4HyyG5UPPZzBI+gAmFV0/1gXwGBj+lVJvjdtC9B+423FefRLB
	 MR6ATkXZay+FprpiuPGs9XqBCFmZXoHXU12EnCUBftsIlO3oMdBoOaej9dHTHsRHusb/D
	 4aw5nq6lClyVtSnl+hwX0GiKrY2kWwSmyMKKRd4bXhVCCPytZL2pS24Nqa3Bsly3TJ9yG
	 jolvs2CWea89HLDQNsx0oHtlCl4E3Pq8p69UPcNFSmulQve6IiZPzFH5RI/BSR1WdFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=gCdfTl7c;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838EF606A333
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 15:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838EF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=gCdfTl7c
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DDF9A08FC;
	Sun, 22 Nov 2026 16:54:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795362856; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3HWPvavJivhpcu05VFMyQQiSuD7eHMUcO0u3LphRL4s=;
	b=gCdfTl7cUy1VKDtD63ZLOWuU8hiyzwAud81wX2JQd4abyImdJMsPewatFcbfA+HSSgO9L3
	Yti57w6IQSeQC2AH4hJI2jCWt+T3xxADIahYvrPV7TJik0ihuGgNW24Iqimk+pQkuTjgLN
	Tb+vHescEwHYiireR6ZjBI/uahfdS2HcDnJ4ZjvtF6kdufqC//YVjKmwSn0cex1W58EQHS
	exodIstia7aHcIo6xjDvGMwzIixOPfDH2BGCzfEuTezc5GO7C44TofGqDVQiQrS1kFevAq
	y5JgeJhQlQQPXAdRJ4M1XudJEdrJdz2oS9r3y85Piw/JvbPCNbjH9cocMX6mtQ==
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 16:54:10 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Willem de Bruijn
 <willemb@google.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next 1/3] net: stmmac: dwmac-sun8i: allow controlling
 TX and RX flow control separately
In-Reply-To: <20261122144926.284857-2-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
 <20261122144926.284857-2-maxime.chevallier@bootlin.com>
Message-ID: <ff98a99f0f603c56fa552e6987b1b2d5@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime

On 22.11.2026 15:49, Maxime Chevallier wrote:
> Currently, the sun8i flow control setup only looks at FLOW_AUTO (which
> is FLOW_RX | FLOW_TX), and enables RX/TX based on that.
> 
> Allow enabling RX/TX flow control directions separately.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nbb@tipi-net.de>

Thanks,
Nicolai
