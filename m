Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B7729CA
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 14:25:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CF49D6E;
	Mon, 31 Jan 2022 06:25:11 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B89C3F774;
	Mon, 31 Jan 2022 06:25:10 -0800 (PST)
Date: Mon, 31 Jan 2022 14:25:08 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>, Samuel Holland
 <samuel@sholland.org>, George Hilliard <thirtythreeforty@gmail.com>, Chris
 Morgan <macroalpha82@gmail.com>, U-Boot Mailing List
 <u-boot@lists.denx.de>, linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: Please test U-Boot Allwinner F1C100s support
Message-ID: <20220131142457.6e74cacc@donnerap.cambridge.arm.com>
In-Reply-To: <3a3971a7-daa8-3984-637d-a0e052c34b4a@benettiengineering.com>
References: <20220131125746.4702fac0@donnerap.cambridge.arm.com>
	<813A2F53-7592-4DDF-86B6-993BFB1A6819@benettiengineering.com>
	<20220131135749.4d9f9a14@donnerap.cambridge.arm.com>
	<3a3971a7-daa8-3984-637d-a0e052c34b4a@benettiengineering.com>
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

On Mon, 31 Jan 2022 15:12:23 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Hi Andre,
>=20
> On 31/01/22 14:57, Andre Przywara wrote:
> > On Mon, 31 Jan 2022 14:07:54 +0100
> > Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> >=20
> > Hi Giulio,
> >  =20
> >>> Il giorno 31 gen 2022, alle ore 13:57, Andre Przywara <andre.przywara=
@foss.arm.com> ha scritto:
> >>>
> >>> =EF=BB=BFOn Mon, 31 Jan 2022 13:17:52 +0100
> >>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> >>>     =20
> >>>> Hi All,
> >>>>
> >>>> I've tried several times on both F1C100s and F1C200s, maybe I'm doing
> >>>> something wrong but it doesn't work :-/
> >>>>
> >>>> I burn sd-card with:
> >>>> # sudo dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/sdb bs=3D1k seek=
=3D8
> >>>>
> >>>> I've triple-checked that the file has been written there by dumping =
the
> >>>> sd-card and I see it's written at 0x2000, so 8K offset, like the man=
goPI
> >>>> image for example. But no uart output. =20
> >>>
> >>> I haven't looked in detail what would be needed for the SPL part of t=
he
> >>> MMC driver to really work, I just checked that the base addresses are
> >>> correct, the pinmux looked alright as well.
> >>> The DT nodes are not needed for the SPL, and I don't see other changes
> >>> related to MMC in the original series? =20
> >>
> >> Yes that=E2=80=99s true.
> >> =20
> >>> Do you see UART output from the SPL, or nothing at all? =20
> >>
> >> Unfortunately nothing either with SPL =20
> >=20
> > That is interesting. If there would be a problem with the MMC code, you
> > should at least see the SPL banner, and then see it failing loading U-B=
oot
> > proper.  =20
>=20
> Yes
>=20
> > I take it FEL boot works?  =20
>=20
> Yes, it does work on both F1C100s and 200s boards :-/
>=20
> > Maybe we miss something with the clock
> > setup that the BROM does for us during FEL operation? =20
>=20
> Yes, it sounds like that, it's a classic
>=20
> > Can you try to clear the area between the end of the SPL and the beginn=
ing
> > of the U-Boot proper image (dd if=3D/dev/zero of=3D/dev/sdX bs=3D1k see=
k=3D32
> > count=3D8)? =20
>=20
> I've zeroed the first 32MB of sd-card now, so we're sure nothing can=20
> interfere.
>=20
> # sudo dd if=3D/dev/zero of=3D/dev/sda bs=3D1M count=3D32
> # sync
> # sudo dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/sda bs=3D1k seek=3D8
> # sync
>=20
> (/dev/sda is my sd-card for real since I have m.2 ssd)

Sorry, I meant to clear those bits after writing to the card (or clear that
in the image file). binman now manages the packaging, so places 0xff into
the 8K gap between our 24K SPL and the 32KB offset we place U-Boot proper
at. If the BROM would read beyond the 24KB, the checksum would fail,
but zeros are ignored by the algorithm, so we are a bit more robust. Also
it might be interesting to set the size of 32KB (fixing up the checksum).
What I was after is that no output could also mean that the BROM dismissed
the SPL it found on the SD card. Do you see FEL mode enabled afterwards?

> > Does any other branch work with SD card booting? Can you check the SPL
> > size in there (with hexdump -C u-boot-sunxi-with-spl.bin | head, check =
for
> > the halfword at 0x10)? =20
>=20
> This is the result of the command:
> ```
> 00000000  16 00 00 ea 65 47 4f 4e  2e 42 54 30 64 04 71 7c=20
> |....eGON.BT0d.q||
> 00000010  00 60 00 00 53 50 4c 02  00 00 00 00 00 00 00 00=20
> |.`..SPL.........|
> 00000020  2c 00 00 00 00 00 00 00  00 00 00 00 73 75 6e 69=20
> |,...........suni|
> 00000030  76 2d 66 31 63 31 30 30  73 2d 6c 69 63 68 65 65=20
> |v-f1c100s-lichee|
> 00000040  70 69 2d 6e 61 6e 6f 00  00 00 00 00 00 00 00 00=20
> |pi-nano.........|
> 00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00=20
> |................|
> 00000060  0f 00 00 ea 14 f0 9f e5  14 f0 9f e5 14 f0 9f e5=20
> |................|
> 00000070  14 f0 9f e5 14 f0 9f e5  14 f0 9f e5 14 f0 9f e5=20
> |................|
> 00000080  a0 00 00 00 a0 00 00 00  a0 00 00 00 a0 00 00 00=20
> |................|
> 00000090  a0 00 00 00 a0 00 00 00  a0 00 00 00 ef be ad de=20
> |................|
> ```
>=20
> >>> And you are not using UART0 on the PortF pins, so multiplexed with the
> >>> MMC, I guess? =20
> >>
> >> I use PE0 and PE1 Uart0 according to dts.
> >>
> >> Have you got such board to test it? =20
> >=20
> > That's the problem: I am driving blindfolded, because I don't have
> > hardware :-( =20
>=20
> Yeah, but I've read you've ordered it! :-)

Indeed, but it ships from Hongkong. Even without Chinese New Year that
would probably take another week to arrive.

Cheers,
Andre

> Jesse has it working so maybe he can check how clocks are setup after=20
> BROM using u-boot itself. I've never understood why Allwinner/Rockchip=20
> place jtag on the sd-card pins. I really hate it, it would take so few=20
> with free jtag pins to check this :-/
>=20
> Ciao :-)

