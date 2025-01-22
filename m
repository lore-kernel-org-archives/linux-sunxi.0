Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3F31EE7B6
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jan 2025 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737544755; cv=none; b=tS8bMZ+kXHS8kAVNQrhT+aPQQrgYtY6/wQ3ei0ktoAB3EA04RE9nqJlN3z7XrXB1DBj7WdMrXIKHaSDesHtlLxNkun4vY+i4SmAyiHJomR1skZZ7vtlONb9uE1Abb8OrpmE/AOQOkm25aUkElBBugaPhKD/qhhYPQbrXq2+or/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737544755; c=relaxed/simple;
	bh=2MPVVZepdqoJnlznQWFPnu8gVjnCpyjXirPukN4i7Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ITJLbSY8fEh50IUZRYcnSfVVNdHXhN9IDoDJ6z0oS3f85t75P2sROwAcBh6NEJNM1DpgtN1Ov8KdjC89/GNM/PG56VLs0wW+mNkodEniU3+Hem0zIFI169V/9ptU5UwAHO+k8Oj6uoDxM8OnP8YG4erdbV+q7lntlgLFZUwqmik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48D511007;
	Wed, 22 Jan 2025 03:19:39 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B53793F66E;
	Wed, 22 Jan 2025 03:19:09 -0800 (PST)
Date: Wed, 22 Jan 2025 11:19:05 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, Tom Rini
 <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 0/3] sunxi: switch three SoC families to OF_UPSTREAM
Message-ID: <20250122111905.4dcbceee@donnerap.manchester.arm.com>
In-Reply-To: <CAFA6WYNAW_KTK5Evs0e_d0c3g4uDOVOZ6dbeF0LhVhX3tUrZDw@mail.gmail.com>
References: <20250119164157.23648-1-andre.przywara@arm.com>
	<CAFA6WYNAW_KTK5Evs0e_d0c3g4uDOVOZ6dbeF0LhVhX3tUrZDw@mail.gmail.com>
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

On Wed, 22 Jan 2025 12:03:24 +0530
Sumit Garg <sumit.garg@linaro.org> wrote:

Hi Sumit,

> On Sun, 19 Jan 2025 at 22:13, Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > This series converts boards with the Allwinner F1C100s/F1C200s, A10, A10s
> > and A13s SoCs over to OF_UPSTREAM. The .dts and .dtsi files were
> > identical between the kernel and U-Boot repository, so this is a
> > no-brainer.  
> 
> Glad to see this series especially the diffstat.

Yeah, love that too, though the mailing list server blocked 2/3 and 3/3
initially because of their size ;-)

> > However there are four boards (tablets, I guess) that do not have a .dts  
> 
> Can you share the board names you refer to here?

Ah, sorry, sure, it's:
iNet_3F_defconfig	sun4i-a10-inet-3f.dts
iNet_3W_defconfig	sun4i-a10-inet-3w.dts
Ampe_A76_defconfig	sun5i-a13-ampe-a76.dts
iNet_86VS_defconfig	sun5i-a13-inet-86vs.dts

As you can see, they are extremely minimal, and also identical
between each other, except for the model names. So there is cleanup
potential regardless, but we have bigger fish to fry.

> > file in the kernel repository. For now I kept them using the "old
> > style", so they continue working. This requires to keep a copy of the
> > SoC .dtsi file,  
> 
> Is the SoC .dtsi file present in dts/upstream? If yes then it is
> better to not maintain a local copy for them as the local .dts board
> files are able to include SoC .dtsi file from dts/upstream directory
> too.

Oh, now I feel stupid for having not even tried that!
That indeed works, so I will remove the .dtsi, but keep the .dts files in,
at least for now. Jernej has a point that those boards could also be
removed, but I didn't want to pull the plug too early and unnecessarily.

> > I would be grateful for any advice as how to handle this
> > situation best. Ideally we would submit the DTs to the kernel, but I
> > don't know how feasible this is, given their age, the missing device
> > availability and their basic DT nature.  
> 
> Lets have only local board .dts files for them including other
> dependencies from dts/upstream tree. This will at least give folks who
> care about these boards a chance to uprev the corresponding DTs.

Yes, I agree, I didn't know that this was even possible. But works for me,
certainly.

If people don't mind, I will apply those patches now. In my test builds
the .dtb files came out identical, so there is really no risk in this
anyway.

Cheers,
Andre

> 
> -Sumit
> 
> >
> > I compiled all boards with and without this series applied: the
> > resulting u-boot.dtb files were always identical.
> >
> > Please have a look!
> >
> > Cheers,
> > Andre
> >
> > Andre Przywara (3):
> >   suniv: switch Allwinner F1Cx00 boards to OF_UPSTREAM
> >   sunxi: switch Allwinner A10 boards to OF_UPSTREAM
> >   sunxi: switch Allwinner A10s/A13 boards to OF_UPSTREAM
> >
> >  arch/arm/dts/Makefile                         |  48 +--
> >  arch/arm/dts/sun4i-a10-a1000.dts              | 255 -------------
> >  arch/arm/dts/sun4i-a10-ba10-tvbox.dts         | 151 --------
> >  arch/arm/dts/sun4i-a10-chuwi-v7-cw0825.dts    | 159 --------
> >  arch/arm/dts/sun4i-a10-cubieboard.dts         | 255 -------------
> >  arch/arm/dts/sun4i-a10-dserve-dsrv9703c.dts   | 218 -----------
> >  arch/arm/dts/sun4i-a10-gemei-g9.dts           | 192 ----------
> >  arch/arm/dts/sun4i-a10-hackberry.dts          | 140 -------
> >  arch/arm/dts/sun4i-a10-hyundai-a7hd.dts       | 115 ------
> >  arch/arm/dts/sun4i-a10-inet1.dts              | 229 -----------
> >  arch/arm/dts/sun4i-a10-inet97fv2.dts          | 203 ----------
> >  arch/arm/dts/sun4i-a10-inet9f-rev03.dts       | 357 ------------------
> >  .../dts/sun4i-a10-itead-iteaduino-plus.dts    | 126 -------
> >  arch/arm/dts/sun4i-a10-jesurun-q5.dts         | 181 ---------
> >  arch/arm/dts/sun4i-a10-marsboard.dts          | 182 ---------
> >  arch/arm/dts/sun4i-a10-mini-xplus.dts         | 144 -------
> >  arch/arm/dts/sun4i-a10-mk802.dts              | 144 -------
> >  arch/arm/dts/sun4i-a10-mk802ii.dts            | 111 ------
> >  arch/arm/dts/sun4i-a10-olinuxino-lime.dts     | 225 -----------
> >  arch/arm/dts/sun4i-a10-pcduino.dts            | 200 ----------
> >  arch/arm/dts/sun4i-a10-pcduino2.dts           |  67 ----
> >  arch/arm/dts/sun4i-a10-pov-protab2-ips9.dts   | 206 ----------
> >  arch/arm/dts/sun4i-a10-topwise-a721.dts       | 242 ------------
> >  arch/arm/dts/sun5i-a10s-auxtek-t003.dts       | 137 -------
> >  arch/arm/dts/sun5i-a10s-auxtek-t004.dts       | 149 --------
> >  arch/arm/dts/sun5i-a10s-mk802.dts             | 127 -------
> >  arch/arm/dts/sun5i-a10s-olinuxino-micro.dts   | 272 -------------
> >  arch/arm/dts/sun5i-a10s-r7-tv-dongle.dts      | 118 ------
> >  arch/arm/dts/sun5i-a10s-wobo-i5.dts           | 195 ----------
> >  arch/arm/dts/sun5i-a10s.dtsi                  | 173 ---------
> >  arch/arm/dts/sun5i-a13-difrnce-dit4350.dts    |  50 ---
> >  .../dts/sun5i-a13-empire-electronix-d709.dts  | 190 ----------
> >  .../dts/sun5i-a13-empire-electronix-m712.dts  |  51 ---
> >  arch/arm/dts/sun5i-a13-hsg-h702.dts           | 182 ---------
> >  arch/arm/dts/sun5i-a13-inet-98v-rev2.dts      |  50 ---
> >  arch/arm/dts/sun5i-a13-licheepi-one.dts       | 214 -----------
> >  arch/arm/dts/sun5i-a13-olinuxino-micro.dts    | 141 -------
> >  arch/arm/dts/sun5i-a13-olinuxino.dts          | 247 ------------
> >  .../dts/sun5i-a13-pocketbook-touch-lux-3.dts  | 258 -------------
> >  arch/arm/dts/sun5i-a13-q8-tablet.dts          |  80 ----
> >  arch/arm/dts/sun5i-a13-utoo-p66.dts           | 116 ------
> >  arch/arm/dts/sun5i-a13.dtsi                   | 118 ------
> >  arch/arm/dts/sun5i-gr8-chip-pro.dts           | 238 ------------
> >  arch/arm/dts/sun5i-gr8-evb.dts                | 333 ----------------
> >  arch/arm/dts/sun5i-gr8.dtsi                   | 126 -------
> >  arch/arm/dts/sun5i-r8-chip.dts                | 282 --------------
> >  arch/arm/dts/sun5i-r8.dtsi                    |  47 ---
> >  .../dts/sun5i-reference-design-tablet.dtsi    | 194 ----------
> >  arch/arm/dts/suniv-f1c100s-licheepi-nano.dts  |  73 ----
> >  arch/arm/dts/suniv-f1c100s.dtsi               | 330 ----------------
> >  arch/arm/dts/suniv-f1c200s-lctech-pi.dts      |  76 ----
> >  arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts  |  81 ----
> >  arch/arm/mach-sunxi/Kconfig                   |   3 +
> >  configs/A10-OLinuXino-Lime_defconfig          |   2 +-
> >  configs/A10s-OLinuXino-M_defconfig            |   2 +-
> >  configs/A13-OLinuXinoM_defconfig              |   2 +-
> >  configs/A13-OLinuXino_defconfig               |   2 +-
> >  configs/Ampe_A76_defconfig                    |   1 +
> >  configs/Auxtek-T003_defconfig                 |   2 +-
> >  configs/Auxtek-T004_defconfig                 |   2 +-
> >  configs/CHIP_defconfig                        |   2 +-
> >  configs/CHIP_pro_defconfig                    |   2 +-
> >  configs/Chuwi_V7_CW0825_defconfig             |   2 +-
> >  configs/Cubieboard_defconfig                  |   2 +-
> >  configs/Empire_electronix_d709_defconfig      |   2 +-
> >  configs/Empire_electronix_m712_defconfig      |   2 +-
> >  configs/Hyundai_A7HD_defconfig                |   2 +-
> >  configs/Linksprite_pcDuino_defconfig          |   2 +-
> >  configs/Marsboard_A10_defconfig               |   2 +-
> >  configs/Mele_A1000_defconfig                  |   2 +-
> >  configs/Mini-X_defconfig                      |   2 +-
> >  configs/UTOO_P66_defconfig                    |   2 +-
> >  configs/Wobo_i5_defconfig                     |   2 +-
> >  configs/ba10_tv_box_defconfig                 |   2 +-
> >  configs/difrnce_dit4350_defconfig             |   2 +-
> >  configs/dserve_dsrv9703c_defconfig            |   2 +-
> >  configs/iNet_3F_defconfig                     |   1 +
> >  configs/iNet_3W_defconfig                     |   1 +
> >  configs/iNet_86VS_defconfig                   |   1 +
> >  configs/inet1_defconfig                       |   2 +-
> >  configs/inet97fv2_defconfig                   |   2 +-
> >  configs/inet98v_rev2_defconfig                |   2 +-
> >  configs/inet9f_rev03_defconfig                |   2 +-
> >  configs/jesurun_q5_defconfig                  |   2 +-
> >  configs/lctech_pi_f1c200s_defconfig           |   2 +-
> >  configs/licheepi_nano_defconfig               |   2 +-
> >  configs/mk802_a10s_defconfig                  |   2 +-
> >  configs/mk802_defconfig                       |   2 +-
> >  configs/mk802ii_defconfig                     |   2 +-
> >  configs/pov_protab2_ips9_defconfig            |   2 +-
> >  configs/q8_a13_tablet_defconfig               |   2 +-
> >  configs/r7-tv-dongle_defconfig                |   2 +-
> >  configs/sunxi_Gemei_G9_defconfig              |   2 +-
> >  93 files changed, 45 insertions(+), 8832 deletions(-)
> >  delete mode 100644 arch/arm/dts/sun4i-a10-a1000.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-ba10-tvbox.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-chuwi-v7-cw0825.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-cubieboard.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-dserve-dsrv9703c.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-gemei-g9.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-hackberry.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-hyundai-a7hd.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-inet1.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-inet97fv2.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-inet9f-rev03.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-itead-iteaduino-plus.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-jesurun-q5.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-marsboard.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-mini-xplus.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-mk802.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-mk802ii.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-olinuxino-lime.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-pcduino.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-pcduino2.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-pov-protab2-ips9.dts
> >  delete mode 100644 arch/arm/dts/sun4i-a10-topwise-a721.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a10s-auxtek-t003.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a10s-auxtek-t004.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a10s-mk802.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a10s-olinuxino-micro.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a10s-r7-tv-dongle.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a10s-wobo-i5.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a10s.dtsi
> >  delete mode 100644 arch/arm/dts/sun5i-a13-difrnce-dit4350.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a13-empire-electronix-d709.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a13-empire-electronix-m712.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a13-hsg-h702.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a13-inet-98v-rev2.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a13-licheepi-one.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a13-olinuxino-micro.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a13-olinuxino.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a13-pocketbook-touch-lux-3.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a13-q8-tablet.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a13-utoo-p66.dts
> >  delete mode 100644 arch/arm/dts/sun5i-a13.dtsi
> >  delete mode 100644 arch/arm/dts/sun5i-gr8-chip-pro.dts
> >  delete mode 100644 arch/arm/dts/sun5i-gr8-evb.dts
> >  delete mode 100644 arch/arm/dts/sun5i-gr8.dtsi
> >  delete mode 100644 arch/arm/dts/sun5i-r8-chip.dts
> >  delete mode 100644 arch/arm/dts/sun5i-r8.dtsi
> >  delete mode 100644 arch/arm/dts/sun5i-reference-design-tablet.dtsi
> >  delete mode 100644 arch/arm/dts/suniv-f1c100s-licheepi-nano.dts
> >  delete mode 100644 arch/arm/dts/suniv-f1c100s.dtsi
> >  delete mode 100644 arch/arm/dts/suniv-f1c200s-lctech-pi.dts
> >  delete mode 100644 arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts
> >
> > --
> > 2.46.2
> >  

