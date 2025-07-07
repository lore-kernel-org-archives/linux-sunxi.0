Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC18DFBF0
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893342; cv=none; b=iHTy2X1VjMxuOGd4zWpah5qmEM/0B2tKnCLJANwM21XkBElm4x0r8gX4pxbsdy4/X/xGZVit6hHa8/iiO79WKXQNOSSz4iqN5cmJmeHT6gPzJgarvnh4XSuAVPMhZzTYlhrAZfBJMx4atsxv4lBKU2H44mT+/hvCadX5kKWQ24s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893342; c=relaxed/simple;
	bh=n5F+hxkuweqGILpzOC/j7lp+lExMGQiiSgAnSCBKfJM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t597KUkQ4/F110l/ked3YezSJRJil18kyfvJEOoV79r7kN1UtU0RRkdcLgumOxVHK/YKHPHCKv+Xhq7MZNP9Jr8XvDhS44zdZ7zrCF9w24gfP3G7a7NkTpRH8dL1rtUZ8LNp65/HRuzfjgxzsYTuC+K61ZuN4f3g3MFnvFLc7bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA747168F;
	Mon,  7 Jul 2025 06:02:07 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F9553F6A8;
	Mon,  7 Jul 2025 06:02:19 -0700 (PDT)
Date: Mon, 7 Jul 2025 14:02:17 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>
Subject: Re: T113-S3: reboot fails unless "wdt" node is enabled
 =?UTF-8?B?4oCU?= safe to set status = "okay"?
Message-ID: <20250707140217.56955b52@donnerap.manchester.arm.com>
In-Reply-To: <9473157.CDJkKcVGEf@lukas-hpz440workstation>
References: <9473157.CDJkKcVGEf@lukas-hpz440workstation>
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

On Sun, 06 Jul 2025 19:32:35 +0200
Lukas Schmid <lukas.schmid@netcube.li> wrote:

(CC:ing Samuel who probably knows more)

Hi Lukas,

> I'm working with a board based on the Allwinner T113-S3 and running a recent 
> mainline Linux kernel. I noticed that calling `reboot` from Linux results in:
> 
>     Reboot failed -- System halted
> 
> After some investigation, I found that the watchdog (`wdt: watchdog@20500a0`) 
> is marked as `status = "reserved"` in the mainline device tree.
> 
> If I override that node to `status = "okay"` in my board's .dts file, reboot 
> starts working as expected.
> 
> Is there a specific reason why the `wdt` node is marked `"reserved"` by default 
> in mainline?

Yes, that is deliberate. The T113s uses the same base devicetree as the
D1(s), so we share a number of watchdogs. I cannot remember the details,
but I think the idea was to pick the right watchdog for each SoC variant,
and dedicate one for firmware.
Consequently we fix this up in U-Boot, see the commit message here:
https://source.denx.de/u-boot/u-boot/-/commit/95168d77d391b1464

So if you just use the DT from U-Boot (by just using $fdtcontroladdr on
the bootz command line, instead of loading a DT from some storage), you
will get the fix for free.

Cheers,
Andre
