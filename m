Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365101;
	b=QJoLfbPMT6d2Xmw1fUI2CDShM0xv+7GW6KPfVwa6Y3gR0Vh+aSFr0iebBqf0oybDgWuW
	 Z1l9F/xQD1wF5psWacEyGTcGhCPNC9TCpahEIlLhTSWzHXDBlMGIGPxyv4Eeu70ILdbcS
	 AcFmT046ZtcYcmUYXqNTX/V2uJgBKzK6tKODXCTaXOpUqs7KvIwft1MBDky6kV48vyago
	 VuMQXsMVnU/pYF5RjKrr/NCeOoNVAGn7n//46U2J/UsainMP+sWhNkmDlMRa7riVPizcc
	 DJHRXUO1Vl+DiUTbysB/OK5qOKZfKGk487bxRJWNqYJdPP/Wf5LxPrn4Fy4N8NGAUbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365101;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=j/ABN0weoH/winFO8vB9+wkWZtGk1oyDvKSMVSfn8VY=;
	b=0cvL4WENtb3QvUfRE0V2ZNiVdURfagvFlZHK0x3OQdJ5HLuVPEEJQ6epKo9cxSpULARP
	 uDmk4oMxWy29IYKA6aS3Aib6CJPfFRGC5H8Xj+cwaKaNXVEvxm2laznBaClZGrLWelXma
	 mlZ8gDv1wNG/C0WsXlVTA6qGqGPqbXhx0kORvf34w5UZ3ddQrvTBuAETomF4PpISAmZMY
	 5RAbuOenHNl34QUi3fQv/2AbFjua+QAbC7LNcGP3L9vPBYSWIbrVhqAP7uBw0OelBW8Ro
	 mH6ikhgSZRXg5bXqIYLSJNM4KmKV3AWriEZIs/veanbE6x64SpYMsuf6TkgZHIziXhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=TWqFJ7O0;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D58606A320
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 16:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D58606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=TWqFJ7O0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C25FEA03F0;
	Sun, 22 Nov 2026 17:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795365098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j/ABN0weoH/winFO8vB9+wkWZtGk1oyDvKSMVSfn8VY=;
	b=TWqFJ7O0ELEUZetvWU8HRSG7eUK3T++NZpI4PJ0PHfZC7v8QLnMSB1RsKjaqBKIt5HJiUz
	Za8XmjLHFcNEfs1aW050lOjQXCgLxj531sxOnLZH8GT3vc3+WhiX5cip0q6ZrsZSfR3THf
	Ez3jTcPDq5rShz5TlWqHnpmrwCcrBvOl1GFUvqG5cBO7HRbBTJEfY/jQbosYToTM21HMBg
	ZnB0r6lu9RiO0KLihOUK2mskWTl3CyW7cU0uOA7/ZDNKA+L9qEsemtWInuTSkNl7r0Stbn
	cFNJR0NzUntuNiAMJmSfJlFk24TvBn/gPs5bDHCHa0JlriHfo6YNXyAYpUiBhg==
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 17:31:37 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: wens@kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, LABBE Corentin <clabbe.montjoie@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Russell
 King <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: stmmac: dwmac-sun8i: Limit the MTU to
 2018
In-Reply-To: <CAGb2v65_vY86WqvKr1m=g0N1Qr2UhLC1v3OHKPG3x+oURUKp7Q@mail.gmail.com>
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
 <20261122-sun8i-emac-mtu-limit-v2-2-c4081e5b83cf@gmail.com>
 <CAGb2v65_vY86WqvKr1m=g0N1Qr2UhLC1v3OHKPG3x+oURUKp7Q@mail.gmail.com>
Message-ID: <5e09c85c2c33885fecbdf81cd0b9209b@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 22.11.2026 12:39, Chen-Yu Tsai wrote:
> [...]

> FWIW I think this applies to all DWMAC cores.

> [...]

> So for normal descriptors the buffer size is bound to (2KB - bus 
> width).
> Not tested, but I think there is more evidence supporting a 
> cross-platform
> limit.

The sun8i EMAC isn't a Synopsys core, so this needs a test on one.
Maxime, could you try MTU 2019-2021 on your boards?

> [...]

Regards,
Nicolai
