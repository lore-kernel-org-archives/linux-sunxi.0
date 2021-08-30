Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1CE3FC1
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Aug 2021 21:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=TpHs1BAEvLrAgbJFRKgtK+86muZwthG7/YPxSjMo0eE=; b=Wc
	em+DfrnqdQCFj+volp7VYLu7aADN2QWnDBGK/Ck++RwnweRAeO8t205WjuhzuWmSWv5R72LNhdaoQ
	rd6iMSCd7cuSWHZbeHY2u8GjnvUj+XUMaYBo+0uOI5AUoR1exQvrUKKJhSLYLqYKscdIcHRrSLzWy
	jS/ysEBdIIKJ+sM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1mKpAw-004d94-Vc; Mon, 30 Aug 2021 23:50:42 +0200
Date: Mon, 30 Aug 2021 23:50:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	=?utf-8?B?Q2zDqW1lbnQgQsWTc2No?= <u@pkh.me>,
	Willy Liu <willy.liu@realtek.com>, Rob Herring <robh+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sun50i: h5: NanoPI Neo 2: phy-mode rgmii-id
Message-ID: <YS1SsqDgGFOvyIT0@lunn.ch>
References: <20210830151645.18018-1-u@pkh.me>
 <116454729.UZi3dMzWh7@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <116454729.UZi3dMzWh7@jernej-laptop>

On Mon, Aug 30, 2021 at 10:49:37PM +0200, Jernej Škrabec wrote:
> Hi!
> 
> Dne ponedeljek, 30. avgust 2021 ob 17:16:45 CEST je Clément Bœsch napisal(a):
> > Since commit bbc4d71d6354 ("net: phy: realtek: fix rtl8211e rx/tx delay
> > config") network is broken on the NanoPi Neo 2.
> > 
> > This patch changes the phy-mode to use internal delays both for RX and
> > TX as has been done for other boards affected by the same commit.
> > 
> > Fixes: bbc4d71d6354 ("net: phy: realtek: fix rtl8211e rx/tx delay config")
> 
> This commit fixes DT issue, so "fixes" tag should be:
> Fixes: 44a94c7ef989 ("arm64: dts: allwinner: H5: Restore EMAC changes")
> 
> Here, a node with wrong phy-mode property was added to NanoPi Neo 2 board DT.  

Hi Jernej

I would say, it is debatable. The board broke when the driver started
acting on the value, which is commit bbc4d71d6354. It could be argued
it was always technically broken, since it has the wrong value, but
practically, it was not broken. One of the rules for stable is:

 - It must fix a real bug that bothers people (not a, "This could be a
   problem..." type thing).

So i would argue, anything before bbc4d71d6354 does not fulfil stable
requirements, since it does not bother anybody.

      Andrew
