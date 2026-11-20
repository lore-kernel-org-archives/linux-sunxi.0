Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133513;
	b=anzitFDfk7Q3wWlCM7l1GFCBuIGwcXDqiFXQo3eYdMJtBrQqinVNcq0uZ4V3r9R9M9xR
	 z8H8n87mqnT4fDie1rWfiA8PKXOTs/ZEs7/gfjPcF2hlDbwS58MOhNkDU8k1Fe6t1yzhP
	 Ojyp60bdbNV2DoiP11DzU32r5l5tM+onwt2/neR6an1V7eNx8/qO/LZ2V/u5qifoAqI1X
	 H/B6E5Y3hfxnau1SDqygLo3UGDGaaEJmlPgTUoDLrwoQ5h7X3V5zFu3mh1JFlq9Fl0bO/
	 rvnJd3Vo719SBbEP2sMDZ7iwcgSNLIEUmYI26nKtPFD6TYyHjLPG8au0BlUYFb2X7tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133513;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GCUENms0Eg+zy1gRC4+um4g3Klzq7iMeIXkFPj0+DsI=;
	b=hZ8RCgEA/r43V4tKaA/mbYDcW5brp2FHqN2ZD2btMDDqfcUmr/EGnk6HA1fEwz16D/sa
	 assUlNkMdVpHAqk/P5JbHNS0WAcV2kG7+hJZ0YhWAHc9rij4vhxUvAmEmYiKxZLgjSwj5
	 SIf8oRRAdhkcARLg3NzqoknGdhzQgMSLrxnIfx/0TTa5H+g2dpKHq5YKXQd5FX8fcF+UL
	 hEDhxCsQDrBcNh+n3xrViAi+bhWqacCy+NHJrC9XRAUCZdhMKJjTl9lH7VwspWqUegdkA
	 NhvFyxSuqm5x9mE6LO8L+e0QtJCxXSl32H8Dp+t1xdLXVzFj22qINPP/rGmujdKiiwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kRQ7/C0f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308CB60A2600;
	Fri, 20 Nov 2026 00:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kRQ7/C0f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B5B1F000CA;
	Fri, 20 Nov 2026 00:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133512;
	bh=GCUENms0Eg+zy1gRC4+um4g3Klzq7iMeIXkFPj0+DsI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kRQ7/C0f8r5gpJCV38GIqMKqTE8KoilEbFEHcXcWJZpuQ1ZqdZ9KpLDOS5z4lqMsS
	 +NXr7y8Aw0vXzMBLumsq9BTQMqtS1UGiJBTnjX6IyDaeYr3/4Ad4+a6PgAuNe/d+wx
	 YKpGn0eal0CK1ZteXl3WXH6g5iaJVHalixU//2WW/W2oJDnByEOBle1wdK6mQSWxCJ
	 yYnUFMF4qUuBqwYiHbDxqDoqqWjwKNDzb/AxXKR6hHMg+qjjh7SV683H5xXdwD2OpT
	 HhePPyxwkuYGgD6Jkire9ewfL9QeumC8auK3CTLdjUPGMcEeprdMLE/bHcBWk2fiNf
	 Tlb6L0UkCAlUQ==
Date: Thu, 19 Nov 2026 16:11:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 LABBE Corentin <clabbe.montjoie@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
Message-ID: <20261119161151.5251fc86@kernel.org>
In-Reply-To: <CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
	<20261119144848.4ddd88cb@kernel.org>
	<CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 16:32:58 -0700 James Hilliard wrote:
> Would it make sense to address the `rx on` drops in a separate
> follow-up along the lines of Oleksij's dwmac4 fix [0]? On sun8i that
> would mean enabling error forwarding to DMA and passing packets whose
> only error is an IP or transport checksum up as CHECKSUM_NONE, while
> still discarding frames with a bad FCS or other fatal RX errors.
> 
> If we leave the checker enabled in both modes, `rx off` would only
> control whether the driver reports a checksum as verified. In that
> form the follow-up would replace the conditional bit-27 write rather
> than depend on this patch.

I'm not very clear on the changes needed to get to "bad L4 csum packets
still reach the stack" / correct behavior. Would you be willing to
sketch the full series out already, and then we decide what gets
applied where?

What I would like to avoid is us applying this fix to net (which
seems legitimate on the surface), but then following up with another
fix which unconditionally clears EMAC_RX_DO_CRC since AFAIU we
need to clear it for the correct behavior.
