Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF13F15B108
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Sep 2024 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726653729; cv=none; b=u0WomzJuCVyBzK44xhs2BxVH5lt/4h7sDMflPj65oo/Hl1ciPVee6/GNdykbRo5B/EU8/SBB4yy+dW9PTOxPhnYfve9QY47DCZnTDyI0hvoVtmRhCPOwJQ1otzpn0tiQZSupQq9aqI8DQK9nkljj2tZaMS/X6OXl5injsa0gPQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726653729; c=relaxed/simple;
	bh=h7bPQY3ZhK/kSQzRiOpOJJWq1Mly/YzpU+Xm9AUcnLA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sKhV2F2XCEOpCT3u5G6h0lmoA3/8rXOY17+Z+T67rpt7Pd0NAsWVJyQNH4/vGM9zGAWA5j/sm4NzqrCrsPnYGu3jR1C7V5b9ziGC/OSID6Pqsjm0FpaLsHIQPiZtfdafzlDyT6KS0LJ975Rm/7Gvx0h5TSTw6OriG6bYS96aWJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FE12FEC;
	Wed, 18 Sep 2024 03:02:35 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABC7B3F64C;
	Wed, 18 Sep 2024 03:02:04 -0700 (PDT)
Date: Wed, 18 Sep 2024 11:02:00 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: h5: NanoPi NEO Plus2: Add
 disable-wp to mmc0
Message-ID: <20240918110200.4f6be49c@donnerap.manchester.arm.com>
In-Reply-To: <D3EE8EF6-A6CC-4888-8699-A917471904CB@gmail.com>
References: <20240914-b4-nanopineoplus2-fix-mmc0-wp-v1-1-12f54f0d6620@gmail.com>
	<20240916150809.21889537@donnerap.manchester.arm.com>
	<D3EE8EF6-A6CC-4888-8699-A917471904CB@gmail.com>
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

On Tue, 17 Sep 2024 17:51:11 +0200
Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1mc@gmail.com> wrote:

Hi Kry=C5=A1tof,

(putting back the lists, please keep the discussion public, for everyone's
benefit and for having this archived)

> 16. z=C3=A1=C5=99=C3=AD 2024 16:08:09 SEL=C4=8C, Andre Przywara <andre.pr=
zywara@arm.com> napsal:
> >On Sat, 14 Sep 2024 12:07:00 +0200
> >Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1mc@gmail.com> wrote:
> > =20
> >> The board does not have wp pin/switch for micro SD card (mmc0). =20
> >
> >That is true, but for *every* microSD card. So I wonder if we should add
> >this property to all of the boards? I believe none of the arm64 boards h=
ave
> >full size SD card slots? =20
>=20
> I believe this would be a correct thing to do for micro SD cards, few boa=
rds do have this property set already, but most don't. However, I am not 10=
0% certain (I have had a lot of SBCs, in my hands, but definitely not all o=
f them), so I added it for this board only. So do you think it should be ad=
ded for other boards too, or every user should add it for their SBC on thei=
r own?

Yes, I would like you to add this for the other arm64 boards, too.
I appreciate your concerns about not knowing, but we can help out here.
Maybe you can quickly go over the wiki and check each board's picture for
having a microSD slot, just to be on the safe side. But I am pretty sure
that full-size SD slots were only used on the first generation (A10)
boards, and any arm64 board always uses micro-SD slots. I would double
check this on my side during review.

If we would wait for individual board owners to submit patches, we would
wait forever. So thank you for spotting this, and sending a fix, but it
would reduce churn and improve the situation for everyone if you would
cover the other boards as well.

Thanks!
Andre


