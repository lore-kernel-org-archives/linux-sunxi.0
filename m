Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDF46138
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Sep 2023 09:46:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 160B211FB;
	Tue,  5 Sep 2023 02:46:50 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8FD53F793;
	Tue,  5 Sep 2023 02:46:10 -0700 (PDT)
Date: Tue, 5 Sep 2023 10:46:08 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] phy: sun4i-usb: Fix a W=1 compilation failure
Message-ID: <20230905104608.74490e60@donnerap.manchester.arm.com>
In-Reply-To: <858ca657-3845-f65e-b9d8-9d7700e4a069@wanadoo.fr>
References: <0bc81612171baaa6d5dff58c8e009debc03e1ba8.1693735840.git.christophe.jaillet@wanadoo.fr>
	<20230904005855.658819b3@slackpad.lan>
	<858ca657-3845-f65e-b9d8-9d7700e4a069@wanadoo.fr>
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

On Mon, 4 Sep 2023 19:57:33 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

Hi,

> Le 04/09/2023 =C3=A0 01:58, Andre Przywara a =C3=A9crit=C2=A0:
> > On Sun,  3 Sep 2023 12:11:06 +0200
> > Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> >  =20
> >> With gcc 12.3.0, when this file is built, we get errors such as:
> >>
> >> drivers/phy/allwinner/phy-sun4i-usb.c: In function =E2=80=98sun4i_usb_=
phy_probe=E2=80=99:
> >> drivers/phy/allwinner/phy-sun4i-usb.c:790:52: error: =E2=80=98_vbus=E2=
=80=99 directive output may be truncated writing 5 bytes into a region of s=
ize between 2 and 12 [-Werror=3Dformat-truncation=3D]
> >>    790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
> >>        |                                                    ^~~~~
> >> drivers/phy/allwinner/phy-sun4i-usb.c:790:17: note: =E2=80=98snprintf=
=E2=80=99 output between 10 and 20 bytes into a destination of size 16
> >>    790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
> >>        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>
> >> Because of the possible value of 'i', this can't be an issue in real w=
orld =20
> >=20
> > Would using "u8 i;" help? After all currently there are only 4 PHYs
> > max, and in general this isn't expected to be more than a "handful", so
> > 8 bits should be plenty. An unsigned is better anyway.
> > It leaves a bit of a bitter taste, though, as we shouldn't do this kind
> > type tweaking, especially not to work around the compiler trying to be
> > clever, but then not seeing the whole picture (that "i" is bounded by
> > compile time constants not exceeding "4"). =20
>=20
> data->cfg->num_phys is also an int, and having 'i' as an char is really=20
> unusual.

So 'i' is just used as the phy index is this loop, nothing else in the
function uses that. So we could just rename it to "idx" or even "phy_idx",
then the u8 might look less odd?

> So, if changing the size of name (only to waste some stack in order to=20
> silence a compiler warning) is not acceptable, I think that the best is=20
> to leave things as-is.

But that's not really an option, is it? Since we normally don't tolerate
warnings?

And I am not against increasing the size, that's probably indeed the
simplest solution, and given that it's indeed on the stack shouldn't
affect much else. I just wanted to suggest an alternative, since the
increased buffer size is not necessary.

Cheers,
Andre

> >=20
> > Cheers,
> > Andre
> >  =20
> >> application, but in order to have "make W=3D1" work correctly, give mo=
re
> >> space for 'name'.
> >>
> >> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >> ---
> >>   drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwi=
nner/phy-sun4i-usb.c
> >> index ec551464dd4f..e53a9a9317bc 100644
> >> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> >> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> >> @@ -782,7 +782,7 @@ static int sun4i_usb_phy_probe(struct platform_dev=
ice *pdev)
> >>  =20
> >>   	for (i =3D 0; i < data->cfg->num_phys; i++) {
> >>   		struct sun4i_usb_phy *phy =3D data->phys + i;
> >> -		char name[16];
> >> +		char name[32];
> >>  =20
> >>   		if (data->cfg->missing_phys & BIT(i))
> >>   			continue; =20
> >=20
> >  =20
>=20

