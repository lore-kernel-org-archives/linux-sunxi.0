Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE2A29CA
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 13:57:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D8D4D6E;
	Mon, 31 Jan 2022 05:57:53 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 600553F774;
	Mon, 31 Jan 2022 05:57:52 -0800 (PST)
Date: Mon, 31 Jan 2022 13:57:49 +0000
From: Andre Przywara <andre.przywara@foss.arm.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>, Samuel Holland
 <samuel@sholland.org>, George Hilliard <thirtythreeforty@gmail.com>, Chris
 Morgan <macroalpha82@gmail.com>, U-Boot Mailing List
 <u-boot@lists.denx.de>, linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: Please test U-Boot Allwinner F1C100s support
Message-ID: <20220131135749.4d9f9a14@donnerap.cambridge.arm.com>
In-Reply-To: <813A2F53-7592-4DDF-86B6-993BFB1A6819@benettiengineering.com>
References: <20220131125746.4702fac0@donnerap.cambridge.arm.com>
	<813A2F53-7592-4DDF-86B6-993BFB1A6819@benettiengineering.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Jan 2022 14:07:54 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

Hi Giulio,

> > Il giorno 31 gen 2022, alle ore 13:57, Andre Przywara <andre.przywara@f=
oss.arm.com> ha scritto:
> >=20
> > =EF=BB=BFOn Mon, 31 Jan 2022 13:17:52 +0100
> > Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> >  =20
> >> Hi All,
> >>=20
> >> I've tried several times on both F1C100s and F1C200s, maybe I'm doing=
=20
> >> something wrong but it doesn't work :-/
> >>=20
> >> I burn sd-card with:
> >> # sudo dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/sdb bs=3D1k seek=3D8
> >>=20
> >> I've triple-checked that the file has been written there by dumping th=
e=20
> >> sd-card and I see it's written at 0x2000, so 8K offset, like the mango=
PI=20
> >> image for example. But no uart output. =20
> >=20
> > I haven't looked in detail what would be needed for the SPL part of the
> > MMC driver to really work, I just checked that the base addresses are
> > correct, the pinmux looked alright as well.
> > The DT nodes are not needed for the SPL, and I don't see other changes
> > related to MMC in the original series? =20
>=20
> Yes that=E2=80=99s true.
>=20
> > Do you see UART output from the SPL, or nothing at all? =20
>=20
> Unfortunately nothing either with SPL

That is interesting. If there would be a problem with the MMC code, you
should at least see the SPL banner, and then see it failing loading U-Boot
proper. I take it FEL boot works? Maybe we miss something with the clock
setup that the BROM does for us during FEL operation?

Can you try to clear the area between the end of the SPL and the beginning
of the U-Boot proper image (dd if=3D/dev/zero of=3D/dev/sdX bs=3D1k seek=3D=
32
count=3D8)?
Does any other branch work with SD card booting? Can you check the SPL
size in there (with hexdump -C u-boot-sunxi-with-spl.bin | head, check for
the halfword at 0x10)?

> > And you are not using UART0 on the PortF pins, so multiplexed with the
> > MMC, I guess? =20
>=20
> I use PE0 and PE1 Uart0 according to dts.
>=20
> Have you got such board to test it?

That's the problem: I am driving blindfolded, because I don't have
hardware :-(

Cheers,
Andre

> Or we can wait for Jesse or George.
>=20
> I=E2=80=99ve used the git you=E2=80=99ve pointed.
>=20
> Anyway I think we=E2=80=99re very close to have it working.
>=20
> At least my work =E2=80=9Cbehind the scenes=E2=80=9D will be worth, right=
 Jesse :-)?
>=20
> Best regards
> =E2=80=94-
> Giulio Benetti
> Benetti Engineering sas
>=20
> >=20
> > Cheers,
> > Andre
> >=20
> >=20
> >  =20
> >>=20
> >> Am I doing something wrong?
> >>=20
> >> Best regards =20
> >  =20
>=20
>=20

