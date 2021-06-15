Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCE072
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jun 2021 11:25:57 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1lt7CU-0003gA-A2; Tue, 15 Jun 2021 13:25:46 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1lt7CQ-0004AZ-TV; Tue, 15 Jun 2021 13:25:42 +0200
Message-ID: <869864f6f85c1f1d3427bf6be32d703758bdad71.camel@pengutronix.de>
Subject: Re: [PATCH v7 13/19] phy: sun4i-usb: Allow reset line to be shared
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andre Przywara <andre.przywara@arm.com>, Maxime Ripard
 <mripard@kernel.org>,  Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Samuel
 Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@googlegroups.com,  linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>, Kishon
 Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Date: Tue, 15 Jun 2021 13:25:42 +0200
In-Reply-To: <20210615110636.23403-14-andre.przywara@arm.com>
References: <20210615110636.23403-1-andre.przywara@arm.com>
	 <20210615110636.23403-14-andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

On Tue, 2021-06-15 at 12:06 +0100, Andre Przywara wrote:
> The USB HCIs (and PHYs?) in Allwinner's newer generation SoCs (H616)
> rely on the reset line of USB PHY 2 to be de-asserted, even when only
> one of the other PHYs is actually in use.
>=20
> To make those ports work, we include this reset line in the HCIs' resets
> property, which requires this line to be shareable.
>=20
> Change the call to allocate the reset line to mark it as shared, to
> enable the other ports on those SoCs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
