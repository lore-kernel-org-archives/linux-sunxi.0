Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8A428A1D6
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751899869; cv=none; b=sFCaVcUhuy2UvOuDLP3agTe20wQVtYe9TgxGjFRCPtGMyANUL3IkOy6yPODLeUIvvi8rofdj4q6cizEjPnsrkrkhmfDEJ1Sk8draobezj9mVALB57eHB4w5ZHkSsMr5vGiX1l8lFs79NQDYm+qaSTRUejIGdKcg2fU/5j/7u7M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751899869; c=relaxed/simple;
	bh=zslry4wmreMmW0pbR3PUOlqcEPkBx2BO5j57hWlanZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BB5gqzJrUNjARPL8Ne4Z8nPUBFxqH3mTMYX9TKui/0xincJncFPcQ8R0PNwpqgRD+xiQKxDgOOK5FgDNYda1MQnzIeclKhDK2lGXHh7yY4vWg71n38AmNpcRNhGUUKL5qrQ6GOWK/ds9lZobwgfTkh99ptB/nVqMh29bK2eXrwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B35A5168F;
	Mon,  7 Jul 2025 07:50:53 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74E503F694;
	Mon,  7 Jul 2025 07:51:05 -0700 (PDT)
Date: Mon, 7 Jul 2025 15:51:03 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: T113-S3: reboot fails unless "wdt" node is enabled
 =?UTF-8?B?4oCU?= safe to set status = "okay"?
Message-ID: <20250707155103.556a4b68@donnerap.manchester.arm.com>
In-Reply-To: <8591557.NyiUUSuA9g@lukas-hpz440workstation>
References: <9473157.CDJkKcVGEf@lukas-hpz440workstation>
	<20250707140217.56955b52@donnerap.manchester.arm.com>
	<8591557.NyiUUSuA9g@lukas-hpz440workstation>
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

On Mon, 07 Jul 2025 15:08:04 +0200
Lukas Schmid <lukas.schmid@netcube.li> wrote:

Hi Lukas,

> On Montag, 7. Juli 2025 15:02:17 CEST Andre Przywara wrote:
> > On Sun, 06 Jul 2025 19:32:35 +0200
> > Lukas Schmid <lukas.schmid@netcube.li> wrote:
> > 
> > (CC:ing Samuel who probably knows more)  
> 
> Hi Andre,
> 
> > 
> > Hi Lukas,
> >   
> > > I'm working with a board based on the Allwinner T113-S3 and running a  
> > > recent>   
> > > mainline Linux kernel. I noticed that calling `reboot` from Linux results   
> in:
> > >     Reboot failed -- System halted
> > > 
> > > After some investigation, I found that the watchdog (`wdt:
> > > watchdog@20500a0`) is marked as `status = "reserved"` in the mainline
> > > device tree.
> > > 
> > > If I override that node to `status = "okay"` in my board's .dts file,
> > > reboot starts working as expected.
> > > 
> > > Is there a specific reason why the `wdt` node is marked `"reserved"` by
> > > default in mainline?  
> > 
> > Yes, that is deliberate. The T113s uses the same base devicetree as the
> > D1(s), so we share a number of watchdogs. I cannot remember the details,
> > but I think the idea was to pick the right watchdog for each SoC variant,
> > and dedicate one for firmware.
> > Consequently we fix this up in U-Boot, see the commit message here:
> > https://source.denx.de/u-boot/u-boot/-/commit/95168d77d391b1464
> > 
> > So if you just use the DT from U-Boot (by just using $fdtcontroladdr on
> > the bootz command line, instead of loading a DT from some storage), you
> > will get the fix for free.  
> 
> So if I need to load the dtb from storage (because I have different trees for 
> my carrier boards) I need to patch the device tree specifically for my devices? 

Conceptually there is one devicetree for any particular board. You
upstream that to the kernel, then it will be picked up automatically, into
the U-Boot tree.
Even if it's not upstream, you can just copy your DTs into
dts/upstream/src/arm/allwinner, to get the same effect.

> Or have a custom U-Boot built for each carrier board instead of the SoM?

Traditionally we build U-Boot for one particular *board*, not a SoM. That
the board DT then includes a shared SoM .dtsi is just an implementation
detail.
Alternatively you can implement board auto-detection in U-Boot: either by
including all possible .dtb files in the FIT image, and pick the right one
in the SPL (like we do for the original Pine64 board, check
CONFIG_PINE64_DT_SELECTION), or by manually patching the DTB already in
memory, see U-Boot commit a4fc1e3e27fb0956.

> Would it be possible for me to enable the watchdog in my SoM's dt as I do not 
> intend to have the RISC-V variant on my SoM due to the missing CAN interfaces?

Well, I proposed that back then: to enable it in Arm specific .dtsi, but
Samuel denied that, and asked for firmware to set this up. I cannot
quickly find that conversation in the archives, and don't remember the
exact details, but it was convincing enough for me back then to deploy the
U-Boot solution ;-)

Cheers,
Andre.
