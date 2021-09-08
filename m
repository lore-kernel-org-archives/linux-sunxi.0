Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAFD72
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Sep 2021 06:52:02 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mNr9I-0007Wr-61; Wed, 08 Sep 2021 08:33:32 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mNr9G-0002oS-8y; Wed, 08 Sep 2021 08:33:30 +0200
Message-ID: <688d0dc9fd83e98e0a7ed9d8d166e232e75031c6.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] Input: sun4i-lradc-keys: Add optional clock/reset
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Samuel Holland <samuel@sholland.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Rob
 Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 08 Sep 2021 08:33:30 +0200
In-Reply-To: <20210908034016.24119-3-samuel@sholland.org>
References: <20210908034016.24119-1-samuel@sholland.org>
	 <20210908034016.24119-3-samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev

On Tue, 2021-09-07 at 22:40 -0500, Samuel Holland wrote:
> Until the R329, the LRADC hardware was always active. Now it requires
> enabling a clock gate and deasserting a reset line. Do this if the clock
> and reset are provided in the device tree, but keep them optional to
> maintain support for the existing binding.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
