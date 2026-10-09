Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5983431F8
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Oct 2026 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556485; cv=none; b=e6dMg+sp3D20RKhjCSTOQusL7Ryk0pi4Nc1C+mdlW6Xkbwbd4CacSsrN7n7/zMgS8lWVuch6g0GrLWfo5ihn5/LRuEZ/bveY717e+Xv8x6NIH8n2dU3WvW2ft2BEPoKVLw4jXbqdtY1XS7v6jGX+jxiLH7ZrhuKGq+FAPljj2wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556485; c=relaxed/simple;
	bh=jlzMa0qhsV3s6TQpGmRzA74DVbECH23C+r3/Vq3xTgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2WQrMqk6Irzriv+bdv5NcgKyDeABnvus/tbkZtkMvDftpAgtdfHeLh39wvNYGXcCh8vAUQ9vmjHIbWy/BicL9xCsqkb/du/me563voqBXjpSa/YPmviXMAL8cAF/77A0BOzMxHspeScRTP/AtIl5TlqOn2TxRTkPnLR34ovyAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=M7NTXEnV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="M7NTXEnV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7075F1BB2;
	Fri,  9 Oct 2026 07:34:37 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44A393F66F;
	Fri,  9 Oct 2026 07:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791556480; bh=jlzMa0qhsV3s6TQpGmRzA74DVbECH23C+r3/Vq3xTgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M7NTXEnVtwz7PtF5z9psPcCqorxcWW4tMIyt4Ps7mZhQKIV8pptv4ea4h9sKNnkhC
	 BXGCMIDIgD4UtNgV+1CZEMEfzUP1fIFmWSUR9pFURaayXt7SV5rS+uJPcc5vy8DIhg
	 MWa7wEcMQQTr9pKBzZJZfk9allmQgwUxGNfn2mIs=
Message-ID: <3f57db40-a604-4800-b15f-2d159a3a5ca7@arm.com>
Date: Fri, 9 Oct 2026 16:34:38 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] sunxi: Add support for A733 SoC
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Yixun Lan <dlan@gentoo.org>
Cc: u-boot@lists.u-boot-project.org, linux-sunxi@lists.linux.dev,
 Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <contact@paulk.fr>, Samuel Holland <samuel@sholland.org>
References: <20260113-01-a733-soc-support-v3-0-f19dcd098f60@gentoo.org>
 <20261009120356.194364-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261009120356.194364-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vinicius,

On 10/9/26 14:03, Vinicius Pedrosa wrote:
> Hi Yixun, Andre,
> 
> I'm porting U-Boot to the Radxa Cubie A7Z (A733, 1 GiB LPDDR4) and have

I read this wording ("I port xxx to the <board name>") now multiple 
times, from different people (blame AI?), but please avoid that.

First: The main thing here is the SoC support, the board is just a minor 
technicality. Once we have the DT bindings(!) settled, and figured the 
clocks and other basic peripherals, enabling a certain board is not a 
big problem, it's mostly just the board .dts bits on top of the SoC. 
dtsi. Relatively easy for boards with schematics.

Second: you *contribute* to the efforts, building on the work of others. 
Doing this all on your own would be a big effort, and not be 
recommended, and be it just to avoid working in the wrong direction.

Third: Honest question, is it really *you*, or is it some LLM? I grew a 
bit suspicious lately when it comes to lengthy contributions out of the 
blue from "new" people.
   > a board series (DTS, defconfig, MAINTAINERS, doc) on top of your A733
> work. Before posting it I'd like to settle the base and the boot flow.
> 
> With A733/next (165f07a69706), TF-A A733 (f4c0b0dba78a) and sunxi-tools
> PR #223, the SPL/FIT flow works here: boot0 trains DRAM, drops into FEL
> on "2" over UART, and the SPL loads BL31 and U-Boot. I had to clamp the
> SPL's fixed 2 GiB to the board's 1 GiB, and BL31 was linked for DRAM at
> 0x48000000, which the vendor kernel needed.
> 
> Andre's suggestion from January works too: load BL31 and U-Boot proper
> directly over FEL, no FIT. I used BL31 at 0x48000000 and U-Boot at
> 0x4a000000, then reset64 into BL31. The RMR request gets the core to
> AArch64 EL3 without an SPL, and the same BL31 and U-Boot binaries reach
> the prompt.

Please note that this is all temporary. IIUC, some people already 
cracked the DRAM init, within a mainline U-Boot base, which involves 
uploading some firmware to the DRAM controller. I haven't seen any code 
yet, but I guess it sits tightly on some github.
So we don't need to make those hacks we are using for now pretty, it 
just needs to be something usable.

What I am using meanwile:
Have *just* boot0 on an SD card, which automatically drops into FEL, if 
it can't find the rest of the firmware. From there I just upload U-Boot 
proper and TF-A, maybe the kernel via FEL.
I have masssaged Yixun's patches to just cover U-Boot proper, which 
looks much cleaner. I will post that at some point, but it's all a bit 
premature without having the SoC .dtsi, which is still waiting for the 
clock DT binding headers.
  > What's missing there is the RAM size. I couldn't find a usable size
> from boot0 in SRAM after entering FEL. Without it U-Boot falls back to
> get_ram_size(), whose probe range covers BL31 and goes past the 1 GiB,
> so I didn't let it run.

Why not? Probing DRAM is somewhat the idea of that routine, and it 
should restore the previous values it overwrote? So have you tried 
running that?

As for the rest: as I mentioned above, there is no reason in finding a 
proper solution for that problem: we will have proper DRAM init soon 
enough, it seems, and then the size will be at the right place in SRAM.
Meanwhile either hardcode it or place a memory node in the DT already.

Cheers,
Andre

> I added a "reset64-dram" command to sunxi-tools
> on top of #223: the thunk writes the usual SPL header with dram_size at
> 0x47000 once FEL has handed over, right before the RMR request. U-Boot
> reads it as is. The A7Z U-Boot came up that way with 1 GiB from the
> header and a working SD card.
> 
> The default SRAM BL31 layout clashes with that header. BL31 at 0x62000
> has its .bss at 0x46000-0x48400 and clears it at startup, header
> included, in the SPL flow as well. I ran that layout on October 7 and
> got 1 GiB at the prompt, but didn't trace where the size came from.
> 
> Questions:
> 
> 1. Which base should the A7Z series go on: A733/next, boot-2026.04 or
>     your next revision? The A7A defconfig differs between them (FIT at
>     0x4d000000 vs 0x48200000). Would SPL_LOAD_FIT_ADDRESS and
>     SPL_RAM_DEVICE fit better as SoC defaults?
> 
> 2. Andre, is direct FEL with an explicit size header something you'd
>     take as a documented boot path, or do you prefer SPL/FIT?
> 
> 3. For the size handoff, would you rather keep the header out of the
>     BL31 SRAM range, or use another interface? I'd also like to replace
>     the SPL's fixed 2 GiB without a board-specific hack.
> 
> Everything ran from RAM on a single board. Linux, secondary CPUs and
> UHS are untested with these binaries. If nobody else is on an A7Z port,
> I'll send the board series and the sunxi-tools change separately once
> we agree on the approach.
> 
> Thanks,
> Vinicius

