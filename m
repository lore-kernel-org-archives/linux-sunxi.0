Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB913D6A
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Sep 2023 00:00:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF8CE165C;
	Sun,  3 Sep 2023 17:00:43 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 072F13F766;
	Sun,  3 Sep 2023 17:00:03 -0700 (PDT)
Date: Mon, 4 Sep 2023 00:58:55 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] phy: sun4i-usb: Fix a W=1 compilation failure
Message-ID: <20230904005855.658819b3@slackpad.lan>
In-Reply-To: <0bc81612171baaa6d5dff58c8e009debc03e1ba8.1693735840.git.christophe.jaillet@wanadoo.fr>
References: <0bc81612171baaa6d5dff58c8e009debc03e1ba8.1693735840.git.christophe.jaillet@wanadoo.fr>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun,  3 Sep 2023 12:11:06 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> With gcc 12.3.0, when this file is built, we get errors such as:
>=20
> drivers/phy/allwinner/phy-sun4i-usb.c: In function =E2=80=98sun4i_usb_phy=
_probe=E2=80=99:
> drivers/phy/allwinner/phy-sun4i-usb.c:790:52: error: =E2=80=98_vbus=E2=80=
=99 directive output may be truncated writing 5 bytes into a region of size=
 between 2 and 12 [-Werror=3Dformat-truncation=3D]
>   790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
>       |                                                    ^~~~~
> drivers/phy/allwinner/phy-sun4i-usb.c:790:17: note: =E2=80=98snprintf=E2=
=80=99 output between 10 and 20 bytes into a destination of size 16
>   790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Because of the possible value of 'i', this can't be an issue in real world

Would using "u8 i;" help? After all currently there are only 4 PHYs
max, and in general this isn't expected to be more than a "handful", so
8 bits should be plenty. An unsigned is better anyway.
It leaves a bit of a bitter taste, though, as we shouldn't do this kind
type tweaking, especially not to work around the compiler trying to be
clever, but then not seeing the whole picture (that "i" is bounded by
compile time constants not exceeding "4").

Cheers,
Andre

> application, but in order to have "make W=3D1" work correctly, give more
> space for 'name'.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index ec551464dd4f..e53a9a9317bc 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -782,7 +782,7 @@ static int sun4i_usb_phy_probe(struct platform_device=
 *pdev)
> =20
>  	for (i =3D 0; i < data->cfg->num_phys; i++) {
>  		struct sun4i_usb_phy *phy =3D data->phys + i;
> -		char name[16];
> +		char name[32];
> =20
>  		if (data->cfg->missing_phys & BIT(i))
>  			continue;

