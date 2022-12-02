Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA5F1C26
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Dec 2022 23:39:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0958523A;
	Fri,  2 Dec 2022 15:39:29 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36A143F73B;
	Fri,  2 Dec 2022 15:39:21 -0800 (PST)
Date: Fri, 2 Dec 2022 23:37:38 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] pwm: sun4i: Propagate errors in .get_state() to the
 caller
Message-ID: <20221202233738.281329b1@slackpad.lan>
In-Reply-To: <20221201154822.mx7jafj3tyxes5ab@pengutronix.de>
References: <20221201152223.3133-1-andre.przywara@arm.com>
	<20221201154822.mx7jafj3tyxes5ab@pengutronix.de>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Dec 2022 16:48:22 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> On Thu, Dec 01, 2022 at 03:22:23PM +0000, Andre Przywara wrote:
> > .get_state() can return an error indication now. Make use of it to
> > propagate an impossible prescaler encoding, should that have sneaked in
> > somehow.
> > Also check the return value of clk_get_rate(). That's unlikely to fail,
> > but we use that in two divide operations down in the code, so let's
> > avoid a divide-by-zero condition on the way.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > Hi,
> >=20
> > this goes on top of Uwe's series to introduce and observe .get_state
> > failures: https://lore.kernel.org/linux-pwm/20221130152148.2769768-12-u=
.kleine-koenig@pengutronix.de/T/#m9af39aa03bbd9bb7b31b3600f110c65ee0e8e70b
> > Actually it only relies on patch 01/11 from that. =20
>=20
> I recommend to put this info in machine-readable form into your patch.
> If you applied my patch #1 on v6.1-rc1 and this on top, you'd do
>=20
> 	git format-patch -1 --base v6.1-rc1
>=20
> This results in two additional lines that the build bots can evaluate,
> to find the right setup to test your patch.

Ah, nice one, didn't know about that. And just went I wanted to
complain that this relies on public branches and committed patches, I
learned that it doesn't.

So I got:
base-commit: eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
prerequisite-patch-id: 3022328f2919301d79d852ef148c3f9dc4d723d6

Do you want me to resend the patch with this information?

> Apart from that:
>=20
> Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks for that!

Cheers,
Andre

>=20
> and thanks to pick up on this topic,
> Uwe
>=20

