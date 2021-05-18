Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5332FBF
	for <linux-sunxi@lists.linux.dev>; Tue, 18 May 2021 10:17:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00E3D106F;
	Tue, 18 May 2021 03:11:34 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFEE43F719;
	Tue, 18 May 2021 03:11:32 -0700 (PDT)
Date: Tue, 18 May 2021 11:11:18 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>,
 Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, linux-sunxi@lists.linux.dev
Subject: Allwinner H616 USB support woes
Message-ID: <20210518111008.20f0ea1c@slackpad.fritz.box>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I wanted to ask for some advice on the proper upstream H616 USB
support. This is the only problem left before I can post v6 of the
H616 support series.
The main problem is that only controller 2 (EHCI2+PHY2) works on its
own, all other ports need some help from controller 2.
Just enabling the EHCI2 DT node does the trick, but with some help from
Samuel and Jernej (who were looking into the BROM) I wiggled it down to
the following things actually needed:
- CLK_BUS_PHY2 and RST_BUS_PHY2 need to be enabled.
- PMU2.SIDDQ (0x05310810[3]) needs to be clear.
We can add the clock and reset to the list of clocks and resets in the
other OHCI/EHCI DT nodes, so that's not a real problem.

But this SIDDQ bit is a bit nasty in the details:
It would only need to be flipped once, and wouldn't be changed
back by any reset bits. So what would work is to do this
once in U-Boot. However to actually be able to access this register, we
need CLK_BUS_EHCI2 to be ungated. What works in U-Boot is:
=> mw.l 0x3001a8c 0x40	/* pass USBEHCI2_GATING */
=> mw.l 0x5310810 0	/* clear SIDDQ in PMU2 */
=> mw.l 0x3001a8c 0	/* mask USBEHCI2_GATING again */

Now I would rather see this done in Linux, in the kernel's
phy-sun4i-usb.c, to be self contained and independent.
The easiest way looks like to call sun4i_usb_phy_init() again for PHY2,
after this function is called for another PHY. So at the end of
sun4i_usb_phy_init() (simplified code just for demonstration):

	if (need_phy2 && phy->index != 2)
		sun4i_usb_phy_init(data->phys[2].phy);
(that does a bit more than is really needed, but OK)

However this doesn't work, because CLK_BUS_EHCI2 is still gated, it is
only unmasked in ehci-platform.c, when EHCI2 in initialised.
And annoyingly ehci-platform.c only parses 4 clocks, so adding
CLK_BUS_EHCI2 to the DT would be the fifth in the ehci<x> nodes (three
at the moment plus the still needed CLK_BUS_PHY2 plus CLK_BUS_EHCI2).

Extending this limit is trivial, but sounds a bit like a stretch, since
it's outside of sunxi code and technically the clock is just needed for
initialisation, not during runtime.

Do you guys have any idea how to best solve this?
I would prefer some change confined to phy-sun4i-usb.c, without
bending the DT parts too much. The other alternatives are a U-Boot
solution or extending the limit in ehci-platform.c.

Would be grateful for any input!

Cheers,
Andre
