Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB88D157038
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jan 2024 16:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706547368; cv=none; b=M0aIUBdm8Vh1iZp/YMbSTjB0Y7OO17dGMWsJkIBLMVg1kM3ZUNFiHDaI9gLz/xocKPnkR9JaNfOUlILZvAOuyeBCZAukZ5I0OIfmmaRqVsvrJOEA9wGY2rPvxPcjrRCoS1ETRnfS1mE+rYdv64h5oMGJ7FjuAU7qY1GHuK2Z5RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706547368; c=relaxed/simple;
	bh=3x2pAcUF9IG3QcxA1bixYqhbV4gOILL8YqgIbJzYHK0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a4982Xlp9wo9rO80ks6aP2vIHERIFXp5sP680OgSKp+ny1qxx5V5LHSHlvWKDYMZxEvNqgkzecTseL5zBh6TiN8bqxyPKV/G6j4/qTLFF/vcYfT+Inoj9/eO736FCmzpaj5BebkCbI2apoydbQDjIKd/X131nKDmMxoO0kHqupk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EACC2DA7;
	Mon, 29 Jan 2024 08:56:48 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77F513F738;
	Mon, 29 Jan 2024 08:56:04 -0800 (PST)
Date: Mon, 29 Jan 2024 16:55:55 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: u-boot@lists.denx.de, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH] sunxi: add defconfig for nanopi_duo2
Message-ID: <20240129165555.63ddd462@donnerap.manchester.arm.com>
In-Reply-To: <20240121011528.3fb06011@minigeek.lan>
References: <20231228052915.121433-1-gch981213@gmail.com>
	<20240121011528.3fb06011@minigeek.lan>
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

On Sun, 21 Jan 2024 01:15:28 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

> On Thu, 28 Dec 2023 13:29:15 +0800
> Chuanhong Guo <gch981213@gmail.com> wrote:
> 
> Hi,
> 
> thanks for taking care and sending a patch!
> 
> > FriendlyElec NanoPi Duo2 is a tiny SBC with Allwinner H3 and
> > Ampak AP6212 WiFi module. The device-tree for it is already
> > available in u-boot source tree. Add a default config for it.
> > 
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > ---
> >  configs/nanopi_duo2_defconfig | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 configs/nanopi_duo2_defconfig
> > 
> > diff --git a/configs/nanopi_duo2_defconfig b/configs/nanopi_duo2_defconfig
> > new file mode 100644
> > index 0000000000..5a2069789f
> > --- /dev/null
> > +++ b/configs/nanopi_duo2_defconfig
> > @@ -0,0 +1,11 @@
> > +CONFIG_ARM=y
> > +CONFIG_ARCH_SUNXI=y
> > +CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-nanopi-duo2"
> > +CONFIG_SPL=y
> > +CONFIG_MACH_SUN8I_H3=y
> > +CONFIG_DRAM_CLK=408
> > +# CONFIG_VIDEO_DE2 is not set
> > +# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > +CONFIG_CONSOLE_MUX=y
> > +CONFIG_USB_EHCI_HCD=y
> > +CONFIG_USB_OHCI_HCD=y  
> 
> Judging by the DT, this board has USB-OTG wired up correctly, so we
> should enable it, by adding:
> CONFIG_USB_MUSB_GADGET=y
> This would allow access to USB Ethernet, fastboot or UMS devices, which
> prove to be quite useful for U-Boot.

So I merged this patch, after adding the USB_MUSB_GADGET option.
I just see that the CI complained about a missing maintainer entry, I will
fix this up in a follow-up patch.

Thanks,
Andre.



> 
> Cheers,
> Andre

