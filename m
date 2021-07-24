Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB8E70
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 17:05:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5C3F11D4;
	Sat, 24 Jul 2021 10:05:08 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11D813F694;
	Sat, 24 Jul 2021 10:05:07 -0700 (PDT)
Date: Sat, 24 Jul 2021 18:04:32 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Christopher Obbard <chris@64studio.com>, linux-sunxi@lists.linux.dev,
 mailing list linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] Re: Mainlining Linux Sunxi SoC AW USB
Message-ID: <20210724180432.4423b9e3@slackpad.fritz.box>
In-Reply-To: <YPw/iTdsqggtvlKL@pevik>
References: <YPvjYIsu0G0HSu5I@pevik>
	<YPvrpUZ/VRc0eHvA@kroah.com>
	<YPwYlvh4DqaUsPCF@pevik>
	<YPwhAsK/rDkVeK0y@kroah.com>
	<YPwiGB7VnzECN/jg@pevik>
	<CAP03Xer3QK7gFa5szL7gQLq-=-muyPDzH-D24mhafDpUjj5=bw@mail.gmail.com>
	<YPw/iTdsqggtvlKL@pevik>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Jul 2021 18:27:53 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

Hi Petr,

> [ Dropping Greg and linux-usb@vger.kernel.org ]
> > Peter,  
> 
> > On Sat, 24 Jul 2021 at 15:22, Petr Vorel <petr.vorel@gmail.com> wrote:  
> 
> > > Hi Greg,  
> 
> > > > On Sat, Jul 24, 2021 at 03:41:42PM +0200, Petr Vorel wrote:  
> > > > > > Why is this even a driver at all, it looks like you can write a small
> > > > > > userspace program using libusb to do everything it does, right?  What
> > > > > > exactly is this driver needed for?  
> 
> > > > > I'm sorry for not providing more info at the beginning. This is a driver for
> > > > > host computer (i.e. developers laptop) used by LiveSuit tool [2] to flash Images
> > > > > to the NAND of Allwinner devices. LiveSuit itself [3] is unfortunately provided
> > > > > only in binary form. The only open source code with GPL v2 license is awusb
> > > > > driver. Thus I thought I could ease my life with upstreaming at least the
> > > > > kernel driver. But maybe it's not a good idea. I'm using LiveSuit for flashing
> > > > > Allwinner A31, but it requires quite old distro due libqtgui4. Maybe sunxi folks
> > > > > use something newer nowadays, but I haven't found anything in their wiki.  
> 
> > > > Ah, that's not going to be good then.  Really, this doesn't seem to need
> > > > to be a driver at all, and the ioctls are really strange so we would
> > > > need to change them anyway before it could be merged.  But with no
> > > > access to userspace code, that will be quite difficult, so I would push
> > > > back on allwinner and have them work on resolving this.  
> > > Understand, it makes sense. Thanks for your time!  
> 
> > > @Sunxi community: am I missing something? Using LiveSuit with old distro chroot
> > > and Xephyr with out-of-tree module isn't fun :(.  
> 
> > Suggest you take a look at sunxi-tools - specifically the sunxi-fel
> > tool. This is a libusb-based userland tool to talk to these devices.
> > I'm not sure if it supports flashing to nand on A31 - never tried it -
> > but have used it to flash to eMMC and SPI flash on their other chips.  
> Thanks for a tip. Looking into sources it does not look like sunxi-fel supports
> NAND.
> 
> Also from Debian wiki [1] (which describes bootable SD Card) it looks like only
> old Allwinner u-boot supported access to NAND, thus I'd be surprised if
> sunxi-tools supported it. sunxi-bootinfo does not implement NAND,
> sunxi-nand-image-builder (which is not built by default) creates raw NAND
> images, but now word about flashing.
> 
> I wonder why NAND is (probably) not supported by sunxi? Lack of documentation?

Pure NAND is getting rarer these days, on modern boards we see mostly
eMMC now (maybe SPI NAND). So NAND is only a concern for older SoCs.

There is (limited) NAND support for mainline U-Boot on the C.H.I.P.
boards[1], which use an A13 (derivative). But reliable operation is
only possible with SLC NAND, which means only on the Chip Pro board,
IIUC. Most boards will probably utilise MLC (or worse) NAND these days,
where effects like write and read disturb make operation more
complicated. Maxime has some stories to tell about this.
So it would be first good to know if you have SLC NAND or not.

Because of this direct support for NAND in the tools is understandably
"limited" (as in: non-existent). Except for SPI NOR flash there is no
"direct" flashing support (for eMMC) in the tools anyway, it just relies
on U-Boot support.
How this works is that you use sunxi-fel to upload a (mainline) U-Boot
binary directly into DRAM, and launch that. Then you can use the full
functionality of U-Boot to load your image. Most popular for NAND
support seems to be U-Boot's Android Fastboot implementation over a USB
gadget device, so you can use the off-the-shelf fastboot tool on your
host computer to flash the NAND. Other possibilities would be to use
USB host support or TFTP to first load an image into DRAM, then use
U-Boot commands to write that into the NAND flash.
To my knowledge NAND flash in U-Boot *only* works on the A13/R8/GR8
chips with SLC NAND, and is only enabled and tested on the Chip boards.
Every other combination would require some work; much more work the
farther you move from there (other SoC, MLC, ...).

Cheers,
Andre

[1] https://linux-sunxi.org/NextThingCo_CHIP
