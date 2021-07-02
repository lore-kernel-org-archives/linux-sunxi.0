Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B37172
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Jul 2021 12:06:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E7CEE5C0094;
	Fri,  2 Jul 2021 08:06:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 02 Jul 2021 08:06:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=07zu3Asd5T/fx12ZWBTh7kfKpEq
	wqoit5Ybhyda3+Uw=; b=UqJ052hz+oGOqd7VrJeqEA4txEDlsll5YYPnULFx2Pd
	4XFVCP0HQfQGE/gRWKDhmUkWrIGK/m4RkqASnrC/hzgYtETzseqbgm31yvvArJo7
	zp6viSH6Cnm2JQppN4yEgbQRFoNTqRf0kq4sAVC8w05uolUHl95Uru5OKO4EQzZn
	HBl2oa5rRUijKCY2KYSOJ9TKm/wjbFfryph+36bGfrG21Wb6vy1jnI/I19gULMfL
	arGiPwsW18ZqwkE7rG/qxm9r4aDffQrYmMlSk3Uv9ejGC/cnpTxbEz6clWCMhWjQ
	76///mwODPhDAkHXJADRJRIUsaCm4Q6durM4yIk3ydQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=07zu3A
	sd5T/fx12ZWBTh7kfKpEqwqoit5Ybhyda3+Uw=; b=lPqS5VE1WY2pEKT4NlAUyY
	Ld2IoH53w/13whUrQoHmBAthNtUyWH0BGOfXN9r4kzmIaVMn8a8Me/zYZ3RzF6qe
	Hp/v13Y0/cdtahuOKyMCxOhq70KCxWkY/JyqzCEuNBDJJwbKOtvQAILW0mDOB5f/
	dUwz8zCK9IbqaOdhNXmjBLqHCV1jYcspQz5nzyz7A21LCA01MiSziVDhI8UPpG+l
	TtPZcTAJJY4RzbQxeuaei9SfOiHRrzg8pHBogO2ddIZ24GR5XvBbg44oe/xDKoUX
	P3aKciwBvo/J0U5KRwMLMO/bS7bmfZ3fLsgcm9+Ee/hQYffvgtS8iasdBenmRkAQ
	==
X-ME-Sender: <xms:KwHfYASESM66zqn3uZVkwL2KxOKJ9mcVYtmfT0JM3I6d78TOzG_rTA>
    <xme:KwHfYNzpIW9H4davIwdPixnsoWx8myR3-gLbqk9Po_p_niIKOclw0Yh0PEN2Zb6xT
    lmF4-gXisO_tIMdzx0>
X-ME-Received: <xmr:KwHfYN2SvB87Jhqf9GTmOrdTJvmo7xdTj5ogv70M3CSZmQUUvza0Wg7aiSvbASmJGddlQUSCOxTMHzCF-wvpdVOQRXw6vnC4bNF4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeikedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KwHfYECC3D1ZfRLfgIvlKVVQ3Y49CNKAGiksqle-NBWF8XNwHwAmRw>
    <xmx:KwHfYJi5LEOsX-sDBrNieiEKAg3R-kEKrK88a80MXIvjccKTZ3EefA>
    <xmx:KwHfYAoy0DGpiKE0UK0olxnj3DqkEDXyfM5v1N2eeQkzLSzMVcCoFw>
    <xmx:LAHfYOsOBRIdUHhw0qr40Vz8TzqK0maXu9J1q2bl7-B31BjlpokGjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Jul 2021 08:06:03 -0400 (EDT)
Date: Fri, 2 Jul 2021 14:06:01 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: qianfan <qianfanguijin@163.com>
Cc: wens@csie.org, Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable
 usb_otg
Message-ID: <20210702120601.22k44u6cdlag57ku@gilmour>
References: <20210701015009.13985-1-qianfanguijin@163.com>
 <20210701015009.13985-3-qianfanguijin@163.com>
 <20210701153720.42c1f512@slackpad.fritz.box>
 <CAGb2v67-BAn=OMid-=MoJ15QUdt0NQ2RVfLTN-bkgUstyXNj2A@mail.gmail.com>
 <55b9f018-95da-fe3f-24a4-c499babb9ef3@163.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vowusmhlft2gqqun"
Content-Disposition: inline
In-Reply-To: <55b9f018-95da-fe3f-24a4-c499babb9ef3@163.com>


--vowusmhlft2gqqun
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2021 at 10:46:20AM +0800, qianfan wrote:
>=20
> =E5=9C=A8 2021/7/1 22:47, Chen-Yu Tsai =E5=86=99=E9=81=93:
> > On Thu, Jul 1, 2021 at 10:37 PM Andre Przywara <andre.przywara@arm.com>=
 wrote:
> > > On Thu,  1 Jul 2021 09:50:09 +0800
> > > qianfanguijin@163.com wrote:
> > >=20
> > > Hi,
> > >=20
> > > > From: qianfan Zhao <qianfanguijin@163.com>
> > > >=20
> > > > Enable it.
> > > >=20
> > > > Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> > > > ---
> > > >   arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 14 ++++++++++=
++++
> > > >   1 file changed, 14 insertions(+)
> > > >=20
> > > > diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/ar=
ch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > > > index a6a1087a0c9b..072535b383b5 100644
> > > > --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > > > +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > > > @@ -43,6 +43,7 @@
> > > >=20
> > > >   /dts-v1/;
> > > >   #include "sun8i-r40.dtsi"
> > > > +#include "sunxi-common-regulators.dtsi"
> > > >=20
> > > >   #include <dt-bindings/gpio/gpio.h>
> > > >=20
> > > > @@ -299,6 +300,11 @@
> > > >        regulator-name =3D "vdd1v2-sata";
> > > >   };
> > > >=20
> > > > +&reg_usb0_vbus {
> > > > +     gpio =3D <&pio 8 13 GPIO_ACTIVE_HIGH>; /* PI13 */
> > > > +     status =3D "okay";
> > > > +};
> > > So there is the same USB0-DRVVBUS signal connected to this GPIO, but
> > > also to the AXP's N_VBUSEN line.
> > >=20
> > > Not sure if that means either of them can control the voltage?
> > It's better to use N_VBUSEN if that is connected. Since the PMIC
> > may have that pin already enabled, it can cause issues with VBUS
> > input not being correctly used.
>
> I had checked some boards in linux such as sun7i-a20-olinuxino-lime2.dts,
> they has the same design
>=20
> that enable VBUS by using a gpio and then connect this gpio to PMIC.
>=20
> there is a example:
>=20
> ./sun7i-a20-olinuxino-lime2.dts:&reg_usb0_vbus {
> ./sun7i-a20-olinuxino-lime2.dts-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 gpio =3D <&pio 2 17 GPIO_ACTIVE_HIGH>;
> ./sun7i-a20-olinuxino-lime2.dts-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 status =3D "okay";
> ./sun7i-a20-olinuxino-lime2.dts-};

IIRC, the AXP209 typically used with these boards doesn't have a
N_VBUSEN line

Maxime

--vowusmhlft2gqqun
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYN8BKQAKCRDj7w1vZxhR
xchxAPkBBwyY9yoDeVyPIQXcF6+3gFJDdmSfGqwM/Miz1Gyr5gEAqNO5hiDmDFQk
J1tBAOLTCa1a0iBvHZizg8eHYrpYfQ0=
=Oz0m
-----END PGP SIGNATURE-----

--vowusmhlft2gqqun--
