Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB79D7B
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Jun 2022 09:46:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8CD71424;
	Wed,  8 Jun 2022 02:46:42 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 832273F66F;
	Wed,  8 Jun 2022 02:46:41 -0700 (PDT)
Date: Wed, 8 Jun 2022 10:46:38 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, "Milan P .
 =?UTF-8?B?U3RhbmnEhw==?=" <mps@arvanta.net>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: usb: convert PHY GPIO functions to DM
Message-ID: <20220608104638.27ff5c3b@donnerap.cambridge.arm.com>
In-Reply-To: <5737809a-f9e2-f325-5168-d222968a02d8@sholland.org>
References: <20220608000604.3357-1-andre.przywara@arm.com>
	<5737809a-f9e2-f325-5168-d222968a02d8@sholland.org>
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

On Tue, 7 Jun 2022 21:07:59 -0500
Samuel Holland <samuel@sholland.org> wrote:

Hi,

> On 6/7/22 7:06 PM, Andre Przywara wrote:
> > The Allwinner USB PHY driver is still using the legacy GPIO interface,
> > which is now implemented by the DM_GPIO compat functions.
> > Those seem to have some design flaws, as setting the direction, then
> > later setting the value will not work, if the DM_GPIO driver is
> > implementing set_flags.
> >=20
> > Fix this by using the dm_ version of the direct GPIO interface, which
> > uses struct gpio_desc structs to handle requested GPIOs, and actually
> > keeps the flags we set earlier.
> >=20
> > This fixes USB operation on boards which need to toggle the VBUS supply
> > via a GPIO, like the Teres-I laptop or the BananaPi M2 Berry board.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Reported-by: Milan P. Stani=C4=87 <mps@arvanta.net> =20
>=20
> Reviewed-by: Samuel Holland <samuel@sholland.org>

Thanks!

>=20
> It looks like the other users of sunxi_name_to_gpio are unaffected becaus=
e they
> call only gpio_direction_output (sometimes repeatedly), never gpio_set_va=
lue.

Yeah, that's right, I was concerned about SATAPWR and MACPWR too, but they
work, for the very reason you mentioned.
But we should eventually eliminate their usage, together with
CONFIG_USB?_VBUS_PIN, as they are only used in U-Boot proper, where we can
rely on proper DT information now.

Cheers,
Andre

P.S.: I just picked the lowest hanging fruit, and removed
CONFIG_MMC?_CD_PIN, since we can ignore card detect in the same way the
BROM does.
