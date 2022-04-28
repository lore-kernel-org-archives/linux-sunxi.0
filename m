Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3975BEA6
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Apr 2022 07:44:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1njyol-0002pJ-Gl; Thu, 28 Apr 2022 09:44:03 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1njyoj-005iCw-PE; Thu, 28 Apr 2022 09:44:00 +0200
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1njyoh-0002VQ-OH; Thu, 28 Apr 2022 09:43:59 +0200
Message-ID: <23757fe6843e56b91a87d60eb0782ec6b64c10fd.camel@pengutronix.de>
Subject: Re: [PATCH 2/5] iommu/sun50i: Support variants without an external
 reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Date: Thu, 28 Apr 2022 09:43:59 +0200
In-Reply-To: <20220428010401.11323-3-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
	 <20220428010401.11323-3-samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

Hi Samuel,

On Mi, 2022-04-27 at 20:03 -0500, Samuel Holland wrote:
> The IOMMU in the Allwinner D1 SoC does not have an external reset line.
>=20
> Only attempt to get the reset on hardware variants which should have one
> according to the binding. And switch from the deprecated function to the
> explicit "exclusive" variant.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
