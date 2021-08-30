Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D13FC1
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Aug 2021 21:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=LQm/99fYy7tEEihcpqLleK4oaykLQ5hbrCKmuLvP2ys=; b=gO
	Y+j4GOAp3ph5f2GsxlhYJbTShUlrL/XErXWrrFFoMDLEID00uo5UPUX6POucfqgQCvi89fMH8NFho
	qe5PE5nJQZ5Vh/9gjs/DqMqnPLlYQ08PkWdQ5TfEBf7O6Bmcs7J6CQbWIh3ILfCUCQgNIx/4REvTM
	FCWbXReX7X4uJE8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1mKpCH-004dAl-Nv; Mon, 30 Aug 2021 23:52:05 +0200
Date: Mon, 30 Aug 2021 23:52:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?Q2zDqW1lbnQgQsWTc2No?= <u@pkh.me>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Willy Liu <willy.liu@realtek.com>, Rob Herring <robh+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sun50i: h5: NanoPI Neo 2: phy-mode rgmii-id
Message-ID: <YS1TBT8WW1MFemyf@lunn.ch>
References: <20210830151645.18018-1-u@pkh.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210830151645.18018-1-u@pkh.me>

On Mon, Aug 30, 2021 at 05:16:45PM +0200, Clément Bœsch wrote:
> Since commit bbc4d71d6354 ("net: phy: realtek: fix rtl8211e rx/tx delay
> config") network is broken on the NanoPi Neo 2.
> 
> This patch changes the phy-mode to use internal delays both for RX and
> TX as has been done for other boards affected by the same commit.
> 
> Fixes: bbc4d71d6354 ("net: phy: realtek: fix rtl8211e rx/tx delay config")
> Signed-off-by: Clément Bœsch <u@pkh.me>

Cc: stable@vger.kernel.org
Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
