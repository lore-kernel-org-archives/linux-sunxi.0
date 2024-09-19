Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718641CABA
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Sep 2024 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726740054; cv=none; b=jMg+JNUSW0lL0CF1Iu5swybYe6oW94NZ7a1FRf8nmdKTfKAY7aGxos4Jt2fbMNYk9tL5cznXt1bUkK9S4+I3qaScbrD3j+5J/LR+uOjbSEHRtY1yyVIOIjbL9wpBCImL4Ssw8HDzQBrD/cAMM8j1k2UkYq0H8W0S/mfqo70ZabU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726740054; c=relaxed/simple;
	bh=sqvfYbzfe1fAW16uJxIic0EOdzlox5FP9GdoIDUmcDc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rx2w+8mOzMmW5T0oVTU6WfhhfZp8oMR63f1XRrGyEQECzayhJdal+fi6XZ6pj64HLMAv6ApeQ0OYoW+ixBzyYlMDIGTTOebBXeaB36JVRrPNl6hZZNdwFXlXeOs1n9+9jhFUt7r/Qka1gg5uG3/axWwxGkNQ+zps7PlLPehWczg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AF6E1007;
	Thu, 19 Sep 2024 03:01:22 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC66B3F64C;
	Thu, 19 Sep 2024 03:00:51 -0700 (PDT)
Date: Thu, 19 Sep 2024 11:00:48 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: h5: NanoPi NEO Plus2: Add
 disable-wp to mmc0
Message-ID: <20240919110048.7b76cb0e@donnerap.manchester.arm.com>
In-Reply-To: <48EAA118-8890-4528-A3AA-6C131A8F8F75@gmail.com>
References: <20240914-b4-nanopineoplus2-fix-mmc0-wp-v1-1-12f54f0d6620@gmail.com>
	<20240916150809.21889537@donnerap.manchester.arm.com>
	<D3EE8EF6-A6CC-4888-8699-A917471904CB@gmail.com>
	<20240918110200.4f6be49c@donnerap.manchester.arm.com>
	<48EAA118-8890-4528-A3AA-6C131A8F8F75@gmail.com>
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

On Thu, 19 Sep 2024 08:18:11 +0200
Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1mc@gmail.com> wrote:

> 18. z=C3=A1=C5=99=C3=AD 2024 12:02:00 SEL=C4=8C, Andre Przywara <andre.pr=
zywara@arm.com> napsal:
> >On Tue, 17 Sep 2024 17:51:11 +0200
> >Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1mc@gmail.com> wrote:
> >
> >Hi Kry=C5=A1tof,
> >
> >(putting back the lists, please keep the discussion public, for everyone=
's
> >benefit and for having this archived) =20
>=20
> Sorry, texted from a phone and used the wrong reply button.
>=20
> >> 16. z=C3=A1=C5=99=C3=AD 2024 16:08:09 SEL=C4=8C, Andre Przywara <andre=
.przywara@arm.com> napsal: =20
> >> >On Sat, 14 Sep 2024 12:07:00 +0200
> >> >Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1mc@gmail.com> wrote:
> >> >   =20
> >> >> The board does not have wp pin/switch for micro SD card (mmc0).   =
=20
> >> >
> >> >That is true, but for *every* microSD card. So I wonder if we should =
add
> >> >this property to all of the boards? I believe none of the arm64 board=
s have
> >> >full size SD card slots?   =20
> >>=20
> >> I believe this would be a correct thing to do for micro SD cards, few =
boards do have this property set already, but most don't. However, I am not=
 100% certain (I have had a lot of SBCs, in my hands, but definitely not al=
l of them), so I added it for this board only. So do you think it should be=
 added for other boards too, or every user should add it for their SBC on t=
heir own? =20
> >
> >Yes, I would like you to add this for the other arm64 boards, too.
> >I appreciate your concerns about not knowing, but we can help out here.
> >Maybe you can quickly go over the wiki and check each board's picture for
> >having a microSD slot, just to be on the safe side. But I am pretty sure
> >that full-size SD slots were only used on the first generation (A10)
> >boards, and any arm64 board always uses micro-SD slots. I would double
> >check this on my side during review.
> >
> >If we would wait for individual board owners to submit patches, we would
> >wait forever. So thank you for spotting this, and sending a fix, but it
> >would reduce churn and improve the situation for everyone if you would
> >cover the other boards as well.
> >
> >Thanks!
> >Andre
> >
> > =20
> Do you mean all sunxi arm64? Or every arm64 board? Sunxi arm64 has like 5=
0 boards or so, that would be probably possible to do manually. If you mean=
 all arm64, that would be probably too much to handle at once.

Ah, no, sorry, just the sunxi ones, handling all arm64 boards would indeed
be quite an endeavour, and it's much harder to verify.
git grep counts 22 out of the 34 arm64 sunxi boards missing disable-wp, so
that sounds doable.

Many thanks,
Andre
