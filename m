Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D5F7C
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Jun 2022 13:37:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB4AB1424;
	Wed,  8 Jun 2022 06:37:12 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB8163F66F;
	Wed,  8 Jun 2022 06:37:11 -0700 (PDT)
Date: Wed, 8 Jun 2022 14:37:09 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, "Milan P .
 =?UTF-8?B?U3RhbmnEhw==?=" <mps@arvanta.net>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: usb: convert PHY GPIO functions to DM
Message-ID: <20220608143709.317ee976@donnerap.cambridge.arm.com>
In-Reply-To: <9ef704d0-fec8-d07f-76e0-c10037aa6953@sholland.org>
References: <20220608000604.3357-1-andre.przywara@arm.com>
	<5737809a-f9e2-f325-5168-d222968a02d8@sholland.org>
	<20220608104638.27ff5c3b@donnerap.cambridge.arm.com>
	<9ef704d0-fec8-d07f-76e0-c10037aa6953@sholland.org>
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

On Wed, 8 Jun 2022 08:14:27 -0500
Samuel Holland <samuel@sholland.org> wrote:

Hi,

> On 6/8/22 4:46 AM, Andre Przywara wrote:
> > On Tue, 7 Jun 2022 21:07:59 -0500
> > Samuel Holland <samuel@sholland.org> wrote:
> >=20
> > Hi,
> >  =20
> >> On 6/7/22 7:06 PM, Andre Przywara wrote: =20
> >>> The Allwinner USB PHY driver is still using the legacy GPIO interface,
> >>> which is now implemented by the DM_GPIO compat functions.
> >>> Those seem to have some design flaws, as setting the direction, then
> >>> later setting the value will not work, if the DM_GPIO driver is
> >>> implementing set_flags.
> >>>
> >>> Fix this by using the dm_ version of the direct GPIO interface, which
> >>> uses struct gpio_desc structs to handle requested GPIOs, and actually
> >>> keeps the flags we set earlier.
> >>>
> >>> This fixes USB operation on boards which need to toggle the VBUS supp=
ly
> >>> via a GPIO, like the Teres-I laptop or the BananaPi M2 Berry board.
> >>>
> >>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >>> Reported-by: Milan P. Stani=C4=87 <mps@arvanta.net>   =20
> >>
> >> Reviewed-by: Samuel Holland <samuel@sholland.org> =20
> >=20
> > Thanks!
> >  =20
> >>
> >> It looks like the other users of sunxi_name_to_gpio are unaffected bec=
ause they
> >> call only gpio_direction_output (sometimes repeatedly), never gpio_set=
_value. =20
> >=20
> > Yeah, that's right, I was concerned about SATAPWR and MACPWR too, but t=
hey
> > work, for the very reason you mentioned.
> > But we should eventually eliminate their usage, together with
> > CONFIG_USB?_VBUS_PIN, as they are only used in U-Boot proper, where we =
can
> > rely on proper DT information now. =20
>=20
> I have a series for converting the USB PHY driver to devicetree already, =
but it

So I remembered correctly ...

> has been blocked on the devicetree update renaming "usb0_*_det-gpio" to
> "usb0_*_det-gpios". In fact it is still blocked on that, because the sun4i
> devicetree patch was only partially applied.

Yeah, I saw that, sorry for the mixup. That patch didn't make it to
patchwork, so I applied it manually on one tree, but fixed it up wrongly on
the other machine. It is in my (mental) fixes queue, together with that
H616 FEL issue (once I find the actual culprit), and that NAND environment
fix.
Once that's in, I will try to update the -next branch with stuff for the
next merge window (in July), so you can then work on that branch.

> I will rebase the series on top of your patch and send it soon.

Cool, many thanks. And no rush, I just wanted to check to avoid double
work.
I think I figured nice and easy solutions for SATAPWR and MACPWR, will
test them later tonight.

Cheers,
Andre
