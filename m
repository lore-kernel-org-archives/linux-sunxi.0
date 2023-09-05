Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715CBD30A
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Sep 2023 14:13:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91547143D;
	Tue,  5 Sep 2023 07:13:43 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E63A23F67D;
	Tue,  5 Sep 2023 07:13:03 -0700 (PDT)
Date: Tue, 5 Sep 2023 15:13:01 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] phy: sun4i-usb: Fix a W=1 compilation failure
Message-ID: <20230905151301.591fa238@donnerap.manchester.arm.com>
In-Reply-To: <e1a5eea0-33a0-4a58-912a-9548d249ea5d@kadam.mountain>
References: <0bc81612171baaa6d5dff58c8e009debc03e1ba8.1693735840.git.christophe.jaillet@wanadoo.fr>
	<20230904005855.658819b3@slackpad.lan>
	<e1a5eea0-33a0-4a58-912a-9548d249ea5d@kadam.mountain>
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

On Tue, 5 Sep 2023 13:32:08 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

Hi,

> On Mon, Sep 04, 2023 at 12:58:55AM +0100, Andre Przywara wrote:
> > On Sun,  3 Sep 2023 12:11:06 +0200
> > Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> >  =20
> > > With gcc 12.3.0, when this file is built, we get errors such as:
> > >=20
> > > drivers/phy/allwinner/phy-sun4i-usb.c: In function =E2=80=98sun4i_usb=
_phy_probe=E2=80=99:
> > > drivers/phy/allwinner/phy-sun4i-usb.c:790:52: error: =E2=80=98_vbus=
=E2=80=99 directive output may be truncated writing 5 bytes into a region o=
f size between 2 and 12 [-Werror=3Dformat-truncation=3D]
> > >   790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
> > >       |                                                    ^~~~~
> > > drivers/phy/allwinner/phy-sun4i-usb.c:790:17: note: =E2=80=98snprintf=
=E2=80=99 output between 10 and 20 bytes into a destination of size 16
> > >   790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
> > >       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >=20
> > > Because of the possible value of 'i', this can't be an issue in real =
world =20
> >=20
> > Would using "u8 i;" help? After all currently there are only 4 PHYs
> > max, and in general this isn't expected to be more than a "handful", so
> > 8 bits should be plenty. An unsigned is better anyway. =20
>=20
> Generally unsigned types are trickier and cause bugs.  I've blogged
> about this before.  The title is a probably more negative than it should
> have been.
>=20
> https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/
>=20
> My blog mentions u8 i.  I would say avoid that unless forced by an API.

Fair enough, the reason I suggested u8 was to allow us using "%u" in the
snprintf, so any static checker would not try to account for a potential
'-' character. Because not doing so would spoil that approach for the
"usb%d_hsic_12M" string further down.

> > It leaves a bit of a bitter taste, though, as we shouldn't do this kind
> > type tweaking, especially not to work around the compiler trying to be
> > clever, but then not seeing the whole picture (that "i" is bounded by
> > compile time constants not exceeding "4"). =20
>=20
> Yeah.  There is always the option of just ignoring the static checker
> when it tells you to write bad code.

Agreed on that, though I find those diagnostics useful, and just ignoring
or masking them might come back and haunt us later.

So I still think we should fix this, one way or the other.

But I feel this goes quite far into bikeshedding territory, so we should
probably just go with name[32].

Cheers,
Andre.

> You don't have to even look at the *whole* picture to know that GCC is
> wrong.  The BIT(i) would overflow if i is more than 31.
>=20
> regards,
> dan carpenter
>=20

