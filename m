Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BD229CA
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Jan 2022 13:07:57 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
	by Aruba Outgoing Smtp  with ESMTPA
	id EWPTnx4eJ4NL9EWPTnIIEF; Mon, 31 Jan 2022 14:07:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1643634476; bh=Nexknscqd/Gj/PQjsff1uukCjCg098MG/VRDDu6Yn8s=;
	h=Content-Type:From:Mime-Version:Subject:Date:To;
	b=PYQmehU1M1rxtVrcgab4wP8gU+Uln4YqIMzukopZf4LN+GzXcF2UP51K9cyhx47v/
	 S5lgvKXBa0bi4HbGQCI6CcfRmWP33TIaw8bB8CH4xMwZYxB6zgzKbYhI5x4m7POUpQ
	 rpUAKFuSniR5h5HOv4uvBFSNWEsaLheBChDIJo3HrjHxX9QkwL6YO/hzKx/0uJGoxX
	 Oio95vXzDkKLhB/zSUv/FgyxPNdZGaOS//CX0hsqiDpqUxFyViNGcX3G0mGFs1vihx
	 uoNSHZXziPi6HOxrUKIu1M7W1ssoT34VunmNAu04s+5VgMRFimawo8yYcr9zIVTz2t
	 RXwC4XPfJtJ7g==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Please test U-Boot Allwinner F1C100s support
Date: Mon, 31 Jan 2022 14:07:54 +0100
Message-Id: <813A2F53-7592-4DDF-86B6-993BFB1A6819@benettiengineering.com>
References: <20220131125746.4702fac0@donnerap.cambridge.arm.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 George Hilliard <thirtythreeforty@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
In-Reply-To: <20220131125746.4702fac0@donnerap.cambridge.arm.com>
To: Andre Przywara <andre.przywara@foss.arm.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfIYVRioee9r7MrwT+nhKM2FnspFfe/fo3Lf0alZdzM58j9g0HEpcHv6gvzTWcNBtxJoko+mOeXIznnlMF4M5HfLsFudjLo+BJijRCi1jJ9nr9cOSUdUi
 +uqCYWlOQkWQpmHdiIMc/OSdiD1TSq3V4oeiTP+EkTuMwgnFDECYnVk/fApe0OzEwDSNBEVyPFSemQZs/TjJP9oWfM8kjDWY6GOhDqNr2UWP2qce6h575fdS
 i71+82Wr8pyDaiOt3Q14QmD4i0Ky/5Gx27iENIb9KUBlCJDEw4xjb4G+ruBFlHCNSl8Z2i6+q8TSWAPHpaVl9/jg38+N6Odk3TudxizZ9dtx3QlHqV5Ps7jf
 v0nGoYRRhJWn/Oy9ziNavoD5hy0z8l4VfgoG2aajrHjPJo08fkw9UcZzcJSdXnNkmkWk539/

Hi Andre,

> Il giorno 31 gen 2022, alle ore 13:57, Andre Przywara <andre.przywara@foss=
.arm.com> ha scritto:
>=20
> =EF=BB=BFOn Mon, 31 Jan 2022 13:17:52 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>=20
>> Hi All,
>>=20
>> I've tried several times on both F1C100s and F1C200s, maybe I'm doing=20
>> something wrong but it doesn't work :-/
>>=20
>> I burn sd-card with:
>> # sudo dd if=3Du-boot-sunxi-with-spl.bin of=3D/dev/sdb bs=3D1k seek=3D8
>>=20
>> I've triple-checked that the file has been written there by dumping the=20=

>> sd-card and I see it's written at 0x2000, so 8K offset, like the mangoPI=20=

>> image for example. But no uart output.
>=20
> I haven't looked in detail what would be needed for the SPL part of the
> MMC driver to really work, I just checked that the base addresses are
> correct, the pinmux looked alright as well.
> The DT nodes are not needed for the SPL, and I don't see other changes
> related to MMC in the original series?

Yes that=E2=80=99s true.

> Do you see UART output from the SPL, or nothing at all?

Unfortunately nothing either with SPL

> And you are not using UART0 on the PortF pins, so multiplexed with the
> MMC, I guess?

I use PE0 and PE1 Uart0 according to dts.

Have you got such board to test it?
Or we can wait for Jesse or George.

I=E2=80=99ve used the git you=E2=80=99ve pointed.

Anyway I think we=E2=80=99re very close to have it working.

At least my work =E2=80=9Cbehind the scenes=E2=80=9D will be worth, right Je=
sse :-)?

Best regards
=E2=80=94-
Giulio Benetti
Benetti Engineering sas

>=20
> Cheers,
> Andre
>=20
>=20
>=20
>>=20
>> Am I doing something wrong?
>>=20
>> Best regards
>=20

