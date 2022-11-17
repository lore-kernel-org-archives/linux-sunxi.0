Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BD92F30
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Nov 2022 13:43:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5CFE1063;
	Thu, 17 Nov 2022 05:43:28 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D202F3F663;
	Thu, 17 Nov 2022 05:43:20 -0800 (PST)
Date: Thu, 17 Nov 2022 13:43:18 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Icenowy
 Zheng <uwu@icenowy.me>, Thierry Reding <thierry.reding@gmail.com>,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH 2/9] ARM: dts: suniv: f1c100s: add PWM node
Message-ID: <20221117134318.5d40acc1@donnerap.cambridge.arm.com>
In-Reply-To: <20221117120350.kreyg7an5dtuaudr@pengutronix.de>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
	<20221101141658.3631342-3-andre.przywara@arm.com>
	<20221117120350.kreyg7an5dtuaudr@pengutronix.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Nov 2022 13:03:50 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

Hi Uwe,

> On Tue, Nov 01, 2022 at 02:16:51PM +0000, Andre Przywara wrote:
> > The Allwinner F1C100s family of SoCs contain a PWM controller compatible
> > to the one used in the A20 chip.
> > Add the DT node so that any users can simply enable it in their board
> > DT.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> I assume this patch will go via an architecture tree (i.e. not PWM).

Yes, still the same as in the v2 that you already acked ;-)

In fact the patches are in today's -next already.

Cheers,
Andre
