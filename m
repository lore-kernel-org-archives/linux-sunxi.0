Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36ED5337F
	for <linux-sunxi@lists.linux.dev>; Mon, 20 May 2024 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716214700; cv=none; b=Thrx+ak7cE3+DT7mSc6YLJ7mbQhi7Go0KoeZ7kFfV/uYVbTJ9r5g9BzdFO+WwsWKKkZB7npZ5tlkHvENGsHiTdUAN62o4aWIqaJoje5NdpaaNTw2mNzhl9a0yNt86BeHWhVdaREOJNiIe2WjN23k2FxJGyIbAxZweQNfwofroWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716214700; c=relaxed/simple;
	bh=QPUZNg4ZG8F/6uR53RjpChJelTVdovXvdCnNHEnZu9w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ui7vpf2H87wEcBMrrNLUqgapX/EWjIaA9Dsd1F9VSD07WiyrhHaYV1Ddgt/zEy2/o5TULpEjDOstkuza/4UTCegZnMMFr9T1Gi+QbIO4rLK14gnVPe0ViWvtQKy06gF3a6Jz0j0VFBHKaOGrYOHQD0CeKjMIMLMzZZtVj+0Lo+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F218DA7;
	Mon, 20 May 2024 07:18:36 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BA093F766;
	Mon, 20 May 2024 07:18:11 -0700 (PDT)
Date: Mon, 20 May 2024 15:18:08 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Tom Rini <trini@konsulko.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Chris
 Morgan <macromorgan@hotmail.com>, Ryan Walklin <ryan@testtoast.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/6] power: pmic: sunxi: consolidate AXP SPL drivers
Message-ID: <20240520151808.1e5fe1e1@donnerap.manchester.arm.com>
In-Reply-To: <CALeDE9OrY-wdpbdOWvqkgYE6YD8SLGCw_Fo1FaBsjQ75LQcqtQ@mail.gmail.com>
References: <20240515234839.26898-1-andre.przywara@arm.com>
	<CALeDE9OrY-wdpbdOWvqkgYE6YD8SLGCw_Fo1FaBsjQ75LQcqtQ@mail.gmail.com>
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

On Mon, 20 May 2024 13:48:41 +0100
Peter Robinson <pbrobinson@gmail.com> wrote:

Hi Peter,

thanks for having a look!

> Hi Andre,
> 
> > this is the first series in an attempt to clean up the X-Powers AXP PMIC
> > drivers used by the SPL for sunxi boards. So far we have a separate
> > driver file for each AXP variant, but the code was largely the same,
> > just differing by the regulator ranges.
> >
> > This adds a new generic driver, which reads the regulator description
> > from an array of structs. This is similar to how the DM AXP driver used
> > for U-Boot proper works, but is simplified, since we won't need the full
> > feature set for the SPL, and we want to keep the code size small.  
> 
> Overall seems a reasonable approach, would it make sense to put the
> regulator descriptions in a file that could be shared between this and
> the DM driver so the information isn't duplicated and hence may
> diverge over time with things like copy/paste errors?

Yes, I thought about it, but it gets nasty:
- The SPL should only have the regulator descriptions for the *one*
selected AXP chip, whereas the DM driver can afford to describe all
regulators and select the right ones via the compatible at runtime. This
is to conserve memory for the SPL.
- The SPL should only be interested in the DC/DC buck converters, we don't
really need any LDOs. Again saves memory.
- Each regulator entry for the SPL should be as small as possible, we don't
want and need the regulator name, for instance, or the table pointer.
Again to save memory.

Currently the array for the three AXP313 regulators in the SPL is exactly
30 bytes long; in the DM driver, just for the small AXP313: 192 bytes. The
difference is even more pronounced for the larger AXPs.

I am hopeful there might be some macro magic to express this, like:
static const struct axp_regulator_plat axp313_regulators[] = {
   SPL( "dcdc1", 0x10, BIT(0), 0x13, 0x7f,  500, 1540,  10, 70 )
   SPL( "dcdc2", 0x10, BIT(1), 0x14, 0x7f,  500, 1540,  10, 70 )
   SPL( "dcdc3", 0x10, BIT(2), 0x15, 0x7f,  500, 1840,  10, 70 )
PROPER( "aldo1", 0x10, BIT(3), 0x16, 0x1f,  500, 3500, 100, NA )
PROPER( "dldo1", 0x10, BIT(4), 0x17, 0x1f,  500, 3500, 100, NA )
	{}
};
But we still need something to avoid the array altogether when another AXP
is selected, which might require #ifdefs.
So it might be possible, but the devil is probably in the details.

For now I just wanted to avoid adding more AXP driver files to
the drivers/power directory, so I consider this a future optimisation.
Happy to take patches :-D

Cheers,
Andre

> Peter
> 
> > To help bisect-ability, and to simplify review, each of the simpler AXP
> > drivers covered by this approach is handled in a separate patch.
> > We just convert the AXP313, AXP305, AXP717 for now, and on the way add
> > support for the AXP707, just because it's now very easy, and we will
> > need it soon enough.
> > The other AXP SPL drivers are more complex, and support more regulators,
> > but my hunch is that we really just need the DC/DC converters in the
> > SPL. However I need to prove and test this, so I will convert the other
> > AXP chips later.
> >
> > Please have a look and comment whether the approach in general is a good
> > idea.
> >
> > Cheers,
> > Andre
> >
> > Andre Przywara (6):
> >   power: pmic: sunxi: only build AXP drivers for SPL
> >   power: pmic: sunxi: introduce generic SPL AXP DC/DC driver
> >   power: pmic: sunxi: replace AXP717 SPL driver
> >   power: pmic: sunxi: use generic AXP SPL driver for AXP313
> >   power: pmic: sunxi: use generic AXP SPL driver for AXP305
> >   power: pmic: sunxi: add AXP707 support
> >
> >  drivers/power/Makefile  |   8 +-
> >  drivers/power/axp305.c  |  82 ------------------
> >  drivers/power/axp313.c  | 133 -----------------------------
> >  drivers/power/axp717.c  |  92 --------------------
> >  drivers/power/axp_spl.c | 184 ++++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 189 insertions(+), 310 deletions(-)
> >  delete mode 100644 drivers/power/axp305.c
> >  delete mode 100644 drivers/power/axp313.c
> >  delete mode 100644 drivers/power/axp717.c
> >  create mode 100644 drivers/power/axp_spl.c
> >
> > --
> > 2.35.8
> >  

