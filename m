Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8922F56
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 13:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE61C341C7;
	Tue,  5 Jul 2022 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657026282;
	bh=X2byGQzH9xU1QuC680v/fmEWN9fBoq1dBxQH8XoDPIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kg1/TYBTib55w6uEoH1YZUkBkvUI5GCCOrEoxZ3NOkrSvnbQDgPdTIYis/G2YPTAA
	 Y6fdQ1aF7fOA7gwZXzC1xhGc+o1QhB8HEOjHsef9eh4QmP1YP4pKlg3/loexuhaRym
	 QuKGVGRORn0xpJh1C412G1XXTEKX4lnzWlClKL1NbXZJXKLl1lz17zG6XPS4jUiW4E
	 zwOXV62QhW0v+84CbO7UTsu4rKJur660fz302YwStHUopedlaU0MTMZHHEhI9MJT3V
	 zo/hOoQrDWXqKmGd3oKqtRvpk7o8Lz/n9gzVAEPL7jGAFDcF5TKbTT4/6BmPlQaum4
	 rqT4XxsIseVRQ==
Date: Tue, 5 Jul 2022 18:34:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dmaengine: sun4i: Set the maximum segment size
Message-ID: <YsQ25dZ1t4bt7Stg@matsya>
References: <20220621031350.36187-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621031350.36187-1-samuel@sholland.org>

On 20-06-22, 22:13, Samuel Holland wrote:
> The sun4i DMA engine supports transfer sizes up to 128k for normal DMA
> and 16M for dedicated DMA, as documented in the A10 and A20 manuals.
> 
> Since this is larger than the default segment size limit (64k), exposing
> the real limit reduces the number of transfers needed for a transaction.
> However, because the device can only report one segment size limit, we
> have to expose the smaller limit from normal DMA.
> 
> One complication is that the driver combines pairs of periodic transfers
> to reduce programming overhead. This only works when the period size is
> at most half of the maximum transfer size. With the default 64k segment
> size limit, this was always the case, but for normal DMA it is no longer
> guaranteed. Skip the optimization if the period is too long; even
> without it, the overhead is less than before.

Applied, thanks

-- 
~Vinod
