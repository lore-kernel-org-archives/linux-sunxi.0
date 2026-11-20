Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199459;
	b=0Pa58lpkbE7LlYfe8TJ2kN/7reGfN1NcV1hBt1G5ZiFbKpfvb/oZgNgkK8chakmbbI/8
	 72PCcSIiAgvZQSA6wYK19vUmnMDxVK8+ZaE3QPcaaMVEMzY0dwOPwIgt5NmaqZlg1yLqP
	 xdztMBxWq8OaOwUBOFIGC/k7wFJb1vl8f1178hOOWAirX0jrL2cCGuanhoGUYoJQR4FJa
	 fup/uUjbkFJ92Biu/I2rKHFaAMm42TgvAkO8fVSWOzqsx5S5yJPUtKvW4IqWRxJrmYB2T
	 n/+ZX1gfjUmbz2c9a6A91Qcv4zGMCqu5ep0UUZDh35GycBo6w5WZWCaiQLy076PGEPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199459;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=sAbuJKLmKtX7zPRK5+klIxJMc8Ksx7mRqYtHwGJgnFE=;
	b=VtI3iK+fdO9mriOCl4xlmE/UnNyDlzQCwTaSCHXlOUxuciSa+AhubnvlTAhu/fPkN8Pn
	 ZVquagHsCAp9b42IleK23zKQ6YryXk3rRfgGWFFcW/IfM/lWiZBwvP1U2KSPkCJDib6b9
	 ya2tzrxhhXLcZ7LfaIrM9RrX75uWxbOsNn9bR7sETSzOdPQ4EHLqlwNRGfLlzuT+sA0FY
	 VTF1yRvZkSPU1Cme9ZkmERUPW/nfhkhXSerD4q2cndeB/z/Oxl+3ZH9Q+rmyDI+Xp+dFT
	 5mkXUxmn+Kjo9mtSARNf+WBXWzgSJkVBSCoJhoMmc7PpM0xc+iqBhApaqKEK8AlfsAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0SwakPSZ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FB0606A33A
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 18:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45FB0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0SwakPSZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D28CE1A16FF;
	Fri, 20 Nov 2026 18:30:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97ACB601B9;
	Fri, 20 Nov 2026 18:30:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F167A11BC0B11;
	Fri, 20 Nov 2026 19:30:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795199452; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sAbuJKLmKtX7zPRK5+klIxJMc8Ksx7mRqYtHwGJgnFE=;
	b=0SwakPSZBT7Srp6ifOCuTk901V1MDOLJ95w6eUyIPnxnDN1rqr8c9wxBUD+Els4Do/uYyJ
	YWqN28XO8H5bz2M4jELqVmCFNiOXut0WRGfQksK28DOOR7Zo3WPuoHE3PrNCrCfzN/LLOA
	AX5kXIjAy8v8Xymhqi9sGgw4A94ofJiravElwHRPJzrbF4U3OGi3y05ED5Nh9VOgf5AHXe
	JbZH0usF3xSRnjV90zJIkCq+tCQZu1t/PZmLsupsFJIhL9uVwsKefi+jrAQiLMxqaVMw/i
	QT+V0EPlH9nZr8sgL2H7yec2LOADcjOlVjrTsHWHu2GSEQ5fxX/UzLXDQ9tzsg==
Message-ID: <a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com>
Date: Fri, 20 Nov 2026 19:30:01 +0100
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
To: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
 <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/20/26 16:32, James Hilliard wrote:
> Packet captures on sun8i cannot currently inspect frames the driver
> discards for Ethernet errors. Add opt-in rx-all support for complete
> frames with a reported wire error and for runts the MAC can forward.
> 
> Set the runt-forwarding bit at hardware initialization and when rx-all
> changes. Serialize live updates with the DMA controls in the same
> register. Deliver these frames without claiming a verified checksum or
> including them in the good-packet and good-byte totals. Keep counting
> the wire errors even when the frames are delivered.

This deserves a series on its own. it's not only about sun8i, it add the
whole plumbing to stmmac itself. Is it something you've used and needed ?

This feels a bit strange as you answer to the series info bot that this
comes from Jakub's comment on the previous series, but I don't really
see the connection except that Jakub mentions RX_ALL.

If you want and need this feature, you can submit that separately.

Maxime

