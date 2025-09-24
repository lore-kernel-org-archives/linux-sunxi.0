Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6A42D978D
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Sep 2025 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758707798; cv=none; b=XQXqlwhC1jZIQZvLdZ04crUWk9ykcgW1iCY2UhcFPVpmJytOJTwOWVBypIO1g8EG4c9LtAcvpL7RdcG/VVYsO5yeO1acGBF8S6c823n9IeuSP/DKCt60Iw11d5yLNMiiTG7Xaea8jNhwPkm8Ykl824efdwd/NyvRlGXsb/YskZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758707798; c=relaxed/simple;
	bh=K7HkPBGK3e5nU9QqqF15eAJq2zS0ANjzo64UtZ+qrzs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZG3E++byPIMrWx0ArHqIUh+b90Q7iO44CmOxzZs0mcfVRqGc8cNVO7LKQ/65hjBfTLvsx+p/c2szMAvSzVNGa2nEvPHeVlHsoX/6ffTSN3SXnFjFHbOc0u16h5LZcMW6rMJH5QEsFQSuUr+hRDutgs1RrSylD7OIsrVKrrHt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A617C106F;
	Wed, 24 Sep 2025 02:56:23 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5EB83F66E;
	Wed, 24 Sep 2025 02:56:30 -0700 (PDT)
Date: Wed, 24 Sep 2025 10:56:27 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Peter Robinson <pbrobinson@gmail.com>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, u-boot@lists.denx.de
Subject: Re: [PATCH] Allwinner: fix booting on a number of devices
Message-ID: <20250924105627.27b32035@donnerap.manchester.arm.com>
In-Reply-To: <CALeDE9NQq+7yxEQ3v6KB=2OK58+MC-923nPr1tbxaw0vEcfMAA@mail.gmail.com>
References: <20250827075017.1583168-1-pbrobinson@gmail.com>
	<20250829153124.55f35ac6@minigeek.lan>
	<CALeDE9NQq+7yxEQ3v6KB=2OK58+MC-923nPr1tbxaw0vEcfMAA@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 Aug 2025 16:13:51 +0100
Peter Robinson <pbrobinson@gmail.com> wrote:

Hi,

> > > Revert "sunxi: enable MMU_PGPROT proper page table protection"
> > >
> > > This reverts commit 16cfccda4dbf0b53473b8212897f5c63bfbeb6e1.
> > >
> > > This causes the follow issue on the A64 boards I have including
> > > Pine64+, Pine64-LTS and the Pinephone. Revert until the issue
> > > can be properly investigated.
> > >
> > > CPU:   Allwinner A64 (SUN50I)
> > > Model: Pine64+
> > > DRAM:  2 GiB
> > > Insufficient RAM for page table: 0x5000 > 0x4000. Please increase the size in get_page_table_size()  
> >
> > Mmh, how did you get this? I just ran mainline on a Pine64-LTS, and
> > didn't see any issues. Are you running on some specific setup? I am on
> > GCC 11.2.0, TF-A is some v2.12.0-724-gf745e004a, and that's with
> > pine64-lts_defconfig.  
> 
> Fedora 42/43, gcc 15.2, binutils 2.44, TF-A 2.13.
> 
> I've seen it across Pine64+, Pine64-LTS and Pinephone.
> 
> No special setup and I reproduced in on the vanilla upstream checkout
> from a couple of days ago when I had the time to do the bisect.

So I tried this with some gcc 15.2 from kernel.org, binutils is at 2.45
there. That worked just fine for me. So can you send me the generated ELF
files (u-boot and spl/u-boot-spl), from some upstream commit that breaks
for you? And also the final u-boot-sunxi-with-spl.bin? Either for the
Pine64+ or LTS. Could be privately, no need to spam the list. I would then
try to build something as close as possible to that, and compare the ELF
files to mine, to spot any differences.

Cheers,
Andre

> > > resetting ...
> > > System reset not supported on this platform
> > >
> > > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > > ---
> > >  arch/arm/Kconfig | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > > index 40368abc297..b8be270e4d7 100644
> > > --- a/arch/arm/Kconfig
> > > +++ b/arch/arm/Kconfig
> > > @@ -1207,7 +1207,6 @@ config ARCH_SUNXI
> > >       select DM_SPI_FLASH if SPI && MTD
> > >       select DM_KEYBOARD
> > >       select DM_SERIAL
> > > -     select MMU_PGPROT if ARM64  
> >
> > Regardless that's quite a sledgehammer. If that's a real issue, we
> > could surely provide our own get_page_table_size() implementation which
> > is more generous?  
> 
> You commit that reverts says "This might trigger runtime exceptions in
> misbehaving drivers, which should then be fixed." which shows that it
> might cause a problem, and I agree that any drivers should be fixed,
> but the above output tells me absolutely nothing about even where to
> begin to look so to use your sledgehammer analogy, if I knew whether I
> needed a ball-peen hammer or a claw hammer I could but I am basically
> blind and with my testing the sledge hammer solves the problem.
> 
> Peter

