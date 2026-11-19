Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128530;
	b=hlZRZxVnrcWgektwlFOGVsdi5T08i0H3VyyWXJ4jKRRzkfNZdv2dnQiVN1hykFLurnU+
	 fcpe2IMYkt6RzaIiwSUul/KoNz7M2kkl+Lrmu8XkLuYEG2PCUg6WZxMUEfgPhIERgCiIG
	 qMy5pfwTJ04yC2Hrsc9Kr9LvSx8gxUqOzt8SUbNmknCIJm7FAOvuSt9jf/K/c5/8qw85s
	 XrZA9NrblCW/jIJh62/VKyWwKKJORgsYDyNmIuy/wxGfZwRCidDPhUzS/HDSA6PMwfpq9
	 EeIAsvtT9/wHu2gvOKfLl1YnKGwsUjKbPXKnExm6SxPxT7BiSzKQqr0sVqItGW5xoyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128530;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uxdKeh6JL2oY2XBBPbmZrNwISGDq9uDthjhiqqIBPyo=;
	b=fbSN9YagSgEEKo3kBqy1uirAraUZ88uwwf6GZUF6TVqzW0QuuDhzb6CValei/CBPhamF
	 /olORfs+9ycxLHyt2/HZl3donQOHFgLZvo/1cfWjqYu3wGsIhVRyeJd8X43sKRx0FhqZk
	 CsEampqTltD3NdBUKlB+F7sXtMy7R2BbN/JzDGfcAP6o5Ot/D1QdtDB5E6fwy80Kkws7D
	 p/ZsunrsurJRuH8uCkVad0aySpXZsHiSqB6utqSSejN6y9tebvq01cQZ+xprgmdiRNjEu
	 tYsI7+Y6jtKl0nhVn8ZH7RM29noC9UvG+Lj8Bto2BM1SLJsB6ZznmZFjyGMNqXh1zAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffVgQ9h8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01518606A325;
	Thu, 19 Nov 2026 22:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffVgQ9h8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3EF1F000F4;
	Thu, 19 Nov 2026 22:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128529;
	bh=uxdKeh6JL2oY2XBBPbmZrNwISGDq9uDthjhiqqIBPyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ffVgQ9h8PYbAfvjb/j9aLLRAvUnUGIgrkaCBDw9pyRnvQSv3u+1coTIst4AxVU8XH
	 NRTiObskWMdWIbzoqqAO602nC8w0WbYVdyF67eahSHHBG7N7ftFEPkayEMhaBs/BNY
	 snOOLcTwLVlDglPubRcvab7a0aBNX7i53JhyatGwYHpXrQ8yj9Nzol7/T5D4L8Mdxp
	 PAlZGU2KQAucnzJfUvQvxm+bRH5HMHOX2HTAha3KhBSamDAZNI9cmROT4kUB41N/VM
	 A3KB4VBYm7aJnsZEBW9Brl5KRg48316bR+5e+5wWTjtr2gvkjnI1LSH2wzdScKrGLQ
	 uJmnrLk5bSiMw==
Date: Thu, 19 Nov 2026 14:48:48 -0800
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
Message-ID: <20261119144848.4ddd88cb@kernel.org>
In-Reply-To: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
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

On Sun, 15 Nov 2026 17:58:26 -0700 James Hilliard wrote:
> stmmac_set_features() clears hw->rx_csum when RX checksum offload is
> disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
> hardware checksum engine. The MAC therefore keeps dropping packets with
> invalid IP or transport checksums before they reach the host, even after
> ethtool reports RX checksumming as disabled.

Rx checksumming only controls whether the _good_ packet indication /
offload is communicated up the stack. The device should never drop
packets due to a bad L4 checksum. Checksumming L4 is not much of a DoS
vector. Oleksij was fixing this in other stmmac variants. I _think_ you
should always clear this bit if it leads to packet drops.
(FCS is fine, bad FCS should only be passed up if RX_ALL is set,
but sounds like your device has all checksums controlled by one bit?
in which case we prefer to see all and let driver discard the bad FCS)

If I completely misunderstand things we should at least get a respin
to update the cover letter. The commit message talks about L4 offload,
and rx_csum is L4 AFAIU but the bit is called CRC which deserves a
mention somewhere IMVHO.
-- 
pw-bot: cr
