Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3298D40DFA0
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jun 2026 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013126; cv=none; b=LEN2PRTapjavG+zzuVSR9yZorUslO2qwfgWhUjmzu5MnJPfGwkgQqy+pVQ4OxYgirTyyn27crAv7xGlpwXssk0SwRicceVasvP4L9PPKibQVx8zsJAOP1I+EwSLFJDZ8rEmEHt5iuy+fHB4sgYQ/lbyoMCwADGMU96SJPw+fpgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013126; c=relaxed/simple;
	bh=v7nngvcifYmKc+sH7FKI4GZICS/ii/+nzpuW7vlhrug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx2gTx8myyDlwAgkJeIf/ZW/sh3ZyQaqYPTSdmtOn3dfjwr5C9Qz/MXzuMNspcWLkEJPnPWBnKoX2bxoPyCURvAj8MSM/6clZnTkPE40GXhRpWtGEEIMfY51pVcVB0fyULNN4joxztFzxSYx7bjGaU4NU9EhSP06c8RAiYT6UWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id A324637002EF
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Jun 2026 13:46:43 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 58888B43C04; Tue,  9 Jun 2026 13:46:42 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 73E79B43C04;
	Tue,  9 Jun 2026 13:46:41 +0000 (UTC)
Date: Tue, 9 Jun 2026 15:46:39 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
Message-ID: <aigZP9W6AWzde2qo@collins>
References: <ah3ZAPLzh8ORGmpH@home.wens.tw>
 <20260609-mighty-excellent-shoebill-04d7fa@quoll>
 <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com>
 <98f3e864-3a9e-4f96-a633-0c0053ec35fb@kernel.org>
 <CAGb2v64o+tgnLqK_xDoauB4ThF_0979_5XPB38KiZHYyh1BnVQ@mail.gmail.com>
 <e2bf1f8b-677e-4184-b752-26e987f29121@kernel.org>
 <CAGb2v654d6kj_CjWKtCGE+mLnSUBrQhywA9aCAGFhqh1SGQ1vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LIBKS0aWDw24Pb3i"
Content-Disposition: inline
In-Reply-To: <CAGb2v654d6kj_CjWKtCGE+mLnSUBrQhywA9aCAGFhqh1SGQ1vg@mail.gmail.com>


--LIBKS0aWDw24Pb3i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Tue 09 Jun 26, 22:26, Chen-Yu Tsai a =C3=A9crit :
> On Tue, Jun 9, 2026 at 10:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 09/06/2026 14:38, Chen-Yu Tsai wrote:
> > > On Tue, Jun 9, 2026 at 8:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >>
> > >> On 09/06/2026 13:48, Chen-Yu Tsai wrote:
> > >>> On Tue, Jun 9, 2026 at 8:43=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > >>>>
> > >>>> On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
> > >>>>> The following changes since commit 254f49634ee16a731174d2ae34bc50=
bd5f45e731:
> > >>>>>
> > >>>>>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> > >>>>>
> > >>>>> are available in the Git repository at:
> > >>>>>
> > >>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git=
 tags/sunxi-dt-for-7.2
> > >>>>>
> > >>>>> for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c24=
7e565f:
> > >>>>>
> > >>>>>   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02:5=
8 +0800)
> > >>>>>
> > >>>>>
> > >>>>> As mentioned in the tag, this pull request contains a change that=
 should
> > >>>>> be shared between the soc and clk trees. However since I don't ha=
ve any
> > >>>>> clk changes to send this cycle, I think it can just go through th=
e soc
> > >>>>> tree without any issues.
> > >>>>
> > >>>> But the clock driver change cannot be in the DTS branch. This shou=
ld go
> > >>>> via clock tree even if it is one change. And definitely not via DTS
> > >>>> branch.
> > >>>
> > >>> It is a shared change, because it moves two symbols from the driver=
's
> > >>> private header to the public DT binding header. I don't see how this
> > >>> can go through just the clk tree when one of the subsequent patches
> > >>> uses those new symbols.
> > >>>
> > >>> "clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public head=
er"
> > >>> is needed by "ARM: dts: sun8i: v3s: Add mbus node to represent the
> > >>> interconnect".
> > >>>
> > >>> The other way to go about this is to use raw numbers first, then
> > >>> another patch in the next cycle to switch the numbers to actual
> > >>> macros. IMHO not worth the churn and headache.
> > >>
> > >> You can have a duplicated define.
> > >
> > > I honestly did not know that it worked.
> > >
> > > However, splitting what is effectively one logical change (*move*
> > > something) into two patches just to be able to merge them through two
> > > separate trees still seems wrong to me.
> >
> > It is not really one logical change. Defining a new ABI (binding header
> > define) is considered one change. Merging binding change into driver
> > commit breaks rule of splitting bindings from implementation.
> >
> > Second rule is that DTS branch CANNOT take driver changes. So if you do
> > not want to adhere to the above rule you still cannot combine it into
> > DTS branch.
>=20
> Very well. I will drop the two changes and send a revised pull request.
>=20
> Paul, can you redo the clk changes as requested in the next cycle?

Sure, so if I understand correctly, commit:
clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public headersunxi

should be split into two, one adding the definitions to the dt-bindings
headers first and a second one removing them from the clk driver?

Can it still make it for 7.2?

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--LIBKS0aWDw24Pb3i
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmooGT8ACgkQhP3B6o/u
lQze5hAAh4nb0JtdBQTcb6rqE0JuYghcRY3WgOq9a+D58szlF96Vmt8kVC41vjXe
lH6Q3THbnM6nemQW/N6z6Nj8cZerQ6lgZF8d6MkjGIbvvrHzazajOY2BiAWYqurz
g87lGjeYnIoqMrwM2c6uAbJL59QqPSvYBUVHhNuthh8dq57NvToZ4rHGOd+1qU6X
Fc8IyiduL1p11BKAGiFxSsAaeauvwU/YDViT5GU5qAeLaxR3vud7N/PaGqlyNfsz
7NaCEpMUFZ1jZRGXebVkc680JjDWgjNwiF2gGN1pM5DXqPiKD8EB394ylb1lgZ44
+Iw9rAJpdgwgCvZ1MhBxHDbyrnIptkn6WpYGn5DEFhlwiuHztCEfgSgE6M34mzv0
jNn5+4iHAe8ewEH5FJXqy7xgFtbnKEcJLPUOW3MXe6hG9UyEBKZFqyl8bk6rPVPU
9TVKH3NsseD3m0KnZsL5j/Ljs0ySTWU5pm2cvy/+sy0vckIzkJT5z1RAMOauTyj/
bXceU2ZgcNm8e4pJ7fz6np7RrSDsDF53Jn2mPWFIUr/CLP9B4t4GuHiQE0yUsChf
SejY/kPJx2/Hpg2gwuIhuYwHw8NUZ+khe0rxstVqV7rBJVcK5YZU7JM3WKwrrEzh
4KcHRtdA9x+UFc2/w7PycdePOH695+fZ5neoLHiR77A0r8c7nII=
=+eke
-----END PGP SIGNATURE-----

--LIBKS0aWDw24Pb3i--
