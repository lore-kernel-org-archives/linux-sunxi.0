Received: from lab.riabenko.com (lab.riabenko.com [185.143.146.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761CF29A309
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Apr 2026 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.143.146.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777209672; cv=none; b=BeIxa/rc02vWcxW22ltGnIzkx9oWZiLCKBZe9zEZ4EpOI4sJAU6pJBVutBgA1ZqWt26558kcucfcXAtiuexGufg0A5X+Cs4ZXNA/HjtTtMnBGOJLisEufIwcAhPo+95Eh5MX7OdQJ+MoG4MdHwgaRXyfyLK6bnFKVXiOM2z8MZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777209672; c=relaxed/simple;
	bh=sPfEG+wUTIqr+CzfJx1O6qJDgjgoeuy5Q6bdIAdEEvE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OZEfe/9gIdTYJGtFiGDtEeAdfRL/SoUzdh/ghAH+rgkRH4l4MJpR37BYflCj0NvkXRStJ/haSkA4ooPaKZKXnEpoGw20NDisdShDQyHpItxZbPeBlGcg9fe16kWaJAHxZnTK14uK+BclMbzAI1KcH19TWrluqHR0kYP1+C4M04g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=riabenko.com; spf=pass smtp.mailfrom=riabenko.com; dkim=pass (2048-bit key) header.d=riabenko.com header.i=@riabenko.com header.b=Ucmwp4qf; arc=none smtp.client-ip=185.143.146.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=riabenko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riabenko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riabenko.com header.i=@riabenko.com header.b="Ucmwp4qf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=riabenko.com; s=selector; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hu1fM16Tg+LfmM0t03249I0gGGDpJBpNVjtR+hWEnUE=; b=Ucmwp4qfRH5qxH0s1ccrgevaXM
	FsKEtz9n6rUD+g4LyzSfjKC1JzXKfyFheiRlLkJVFxLho46RKvnnz5E8yd1WzzHyfJdxAzWXksYXc
	+B5BNlPI4o5mgfy7ZjdREoxLUIQTdxAWq6uPACQZKbjIMY/zSk7QoYvE26MpHmSP7DwgqcSnCV5fX
	BZGY1dqccTV1+JzWzvf9db+HBT3VcSfb5H36qIBitBQsy+/eoJpJfY1ycxUDKTpv0UPhqku4RGCbr
	8F6YiMlsyQVYaj+A6p6XF5pU3jsEhsmt6cg5T468upAX7mhvO5AYKfZ7NKp+d2e80TpZqck+FbKrs
	hZ2DKe/A==;
Received: from desk.lan ([2a01:d0:333::831])
	by mini.riabenko.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <roman@riabenko.com>)
	id 00001w-0000000004F-2oSq;
	Sun, 26 Apr 2026 16:20:59 +0300
Message-ID: <8382259f9d19c8480bf77ac04d7970d1d6f0988c.camel@riabenko.com>
Subject: Re: new A64-OLinuXino revisions
From: Roman Riabenko <roman@riabenko.com>
To: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Stefan Mavrodiev <stefan@olimex.com>
Date: Sun, 26 Apr 2026 16:20:51 +0300
In-Reply-To: <2e17130f-0bc4-4f76-a793-546aed49c9e0@arm.com>
References: <a20042b7088df2182121445368fce8fb4d129d46.camel@riabenko.com>
		 <2e17130f-0bc4-4f76-a793-546aed49c9e0@arm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Zh41KPS2YTMi3TI8Zk/7"
User-Agent: Evolution 3.60.0 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-Zh41KPS2YTMi3TI8Zk/7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=A3 =D0=BF=D1=82, 2026-04-24 =D1=83 12:08 +0200, Andre Przywara =D0=BF=
=D0=B8=D1=88=D0=B5:
> I take it you are not directly involved with the vendor
Yes, I am not connected to the vendor.

> On 4/24/26 11:25, Roman Riabenko wrote:
> > The vendor revised A64-OLinuXino and released additional
> > devicetrees.
> Well, "released" should be done via sending to the kernel mailing
> list, getting them reviewed and then merged.=20
I should said instead that they released a version of their customised
Debian image, which uses those devicetrees. I have asked in the support
forum to clarify whether they plan to mainline the changes.[1]

>=20
> So does one vendor devicetree support all versions? Or do they patch=20
> something, either when installing or at each boot time?
Per their uboot source code,[2] SPL identifies the board by its RAM,
SPI, and eMMC sizes and assigns one of 5 configuration codes according
to the board variant, but not revision. There are generated kernel.itb
(and kernel.its) in /boot, which matches the configuration codes[3] to
5 board variants, provides paths to 5 devicetrees, and the address to
load the devicetree to. Those 5 devicetrees are the new ones which I
refer to. They contain variant-specific "model" and "compatible"
values. They set RX delay for Ethernet.

There is some uboot logic matching 6 variants of the board (1 extra
code) to only 2 devicetrees.[4] Running binwalk on uboot copied from
the image confirms that there are only those 2 devicetrees in uboot.
Those devicetrees look similar to the mainline. The "model" and
"compatible" match the upstream. And they do not set RX delay for
Ethernet.

The vendor's uboot source code differentiates between revisions of
another board,[5] but not between revisions of A64-OLinuXino.

I asked in the support forum to clarify whether the new devicetrees
work for all revisions of the board, including the past revisions.[1]
Previously, the support suggested that the changes are possibly
associated with additional electromagnetic shielding of Ethernet in
revision E,[6] which is mentioned in the hardware changes log.[7]

So, there are two different devicetrees loaded by uboot. The one used
by uboot appears to be one of the 2 uboot includes, but modified in
memory. For example, "compatible" matches the board variant already,
but "model" is still from the devicetree included in uboot. The other
one, which is passed to the kernel, is one of the 5 new ones.

=3D> fdt addr $fdt_addr_r
=3D> fdt header
magic:                  0xd00dfeed
totalsize:              0x9af8 (39672)
off_dt_struct:          0x38
off_dt_strings:         0x8df0
off_mem_rsvmap:         0x28
version:                17
last_comp_version:      16
boot_cpuid_phys:        0x0
size_dt_strings:        0xd08
size_dt_struct:         0x8db8
number mem_rsv:         0x0
=3D> fdt print / model
model =3D "Olimex A64-Olinuxino-2Ge8G-IND"
=3D> fdt print / compatible
compatible =3D "olimex,a64-olinuxino-2ge8g", "allwinner,sun50i-a64"
=3D> fdt print /soc/ethernet@1c30000 allwinner,rx-delay-ps
allwinner,rx-delay-ps =3D <0x000000c8>
=3D> fdt addr $fdtcontroladdr
=3D> fdt header
magic:                  0xd00dfeed
totalsize:              0xacad (44205)
off_dt_struct:          0x38
off_dt_strings:         0x8f20
off_mem_rsvmap:         0x28
version:                17
last_comp_version:      16
boot_cpuid_phys:        0x0
size_dt_strings:        0xd81
size_dt_struct:         0x8ee8
number mem_rsv:         0x0
=3D> fdt print / model
model =3D "Olimex A64-Olinuxino-eMMC"
=3D> fdt print / compatible
compatible =3D "olimex,a64-olinuxino-2ge8g-ind"
=3D> fdt print /soc/ethernet@1c30000 allwinner,rx-delay-ps
libfdt fdt_getprop(): FDT_ERR_NOTFOUND

> Do you have any board of older revisions, by any chance, so that you=20
> could run some tests?
No, I only have a revision H board.

> And do you have a list of exact changes between revisions? Is there
> some changelog somewhere on the Olimex site or repo? Also I see that
> the Olimex OSHW repo lists revisions up to H already.
For hardware, the revisions changelog is the one which you refer to.[7]
For software, I did not find one matching board revisions. There is the
changelog for the vendor distribution images.[8] I have asked the
support whether there is anything else.[1]

>=20
> So is there a way to detect those revisions?=20
I have not found one so far.

> > For your immediate reference, I attach the patch obtained from the
> > GitHub commit changing devicetrees.
> So this one seemingly ignores the mainline devicetrees, instead
> installs their own versions? I would have hoped they would at least
> adjusted or included the mainline DTs ...
Per my observations described above, they still use modified versions
of the mainline DTs for their uboot, but the newer DTs are used by the
kernel.

[1]:
https://www.olimex.com/forum/index.php?topic=3D9989.msg46689#msg46689
[2]:
https://github.com/OLIMEX/u-boot-olinuxino/blob/23d8f769a94ae230b7a68fa812c=
c3c4dc0cbf1c9/board/olimex/a64_olinuxino/board.c#L39

[3]:
https://github.com/OLIMEX/olimage/blob/a33bf53f8dd13fdcece0c77f1b06064e9ffc=
bb83/configs/boards/a64-olinuxino.yaml

[4]:
https://github.com/OLIMEX/u-boot-olinuxino/blob/23d8f769a94ae230b7a68fa812c=
c3c4dc0cbf1c9/board/olimex/common/boards.c#L275
[5]:
https://github.com/OLIMEX/u-boot-olinuxino/blob/23d8f769a94ae230b7a68fa812c=
c3c4dc0cbf1c9/board/olimex/common/boards.c#L502
[6]:
https://www.olimex.com/forum/index.php?topic=3D9989.msg46678#msg46678
[7]:
https://github.com/OLIMEX/OLINUXINO/tree/master/HARDWARE/A64-OLinuXino
[8]: https://images.olimex.com/changelog.txt

--
Roman

--=-Zh41KPS2YTMi3TI8Zk/7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJHBAABCAAxFiEEbyuIUwJNVUrtp3hK60bLvjKDmmkFAmnuETMTHHJvbWFuQHJp
YWJlbmtvLmNvbQAKCRDrRsu+MoOaaVSFD/4h2D7Dl3uzQUV33QEhw7luWfCrU3rx
GmJRaOe8Gnqexe287JZmMWkNoH9XeaGep8Re5a//TV0XOeG/hAJ9lQIUUhKqRg/6
YQ7OHlz8iFlQPVQiOQrNef0GQMa1uosMktSktZQyvexmIPP7X1LoTcts+yA62IwT
TCZk9BP0hS7AIQEE/9l8fAdheuQUcwcWYYtT8QNGtz3AcEHpGt3S27MSbrneX5RY
EXkxDSaVNSy7emuLVwIv0nMtdSXNudIbQ5lZZSVj+EMAUjQ/bjpil0vNLGmDXUfz
bY6SSS3vJnbY8hKqfB9oF4Y2H0I+91uRtS0kj7qjc0gz4zf66XwAS4i4QNbTTzT2
D+cbBLSJSA8H/GbRDUy8Ww/1IHpDcsA0DWsKSedFEpnjpPUrmC5lo5HPFA0/bn8l
PvAY33HzlkPxzUtryb3RcXHiqRNKR1oO3V/V1U/ZsZzUwm/hhQGomenapECG4kEY
Zxx7qx9vsGMyo7ZjC6pnqOmn1BZojeH7ejS3Scz5GfaaOUO3ZU0XCjb/UlqxDzJW
0MOmn9BxNzU8SVthiL4s6lUIdnkpgMMOUO5X2JN1nXr2BVFGsrHdLGOYd0YMS5X9
LX2YAVcb2DXu1B2R2tzmECYPi8yvUFAs0xikekuIIRxTTpPywhmElqAgY3jSC0cZ
f3lUCsUVbvRUcg==
=5aff
-----END PGP SIGNATURE-----

--=-Zh41KPS2YTMi3TI8Zk/7--
