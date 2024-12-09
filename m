Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD10113B58A
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Dec 2024 18:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733767495; cv=none; b=TkkliudCD2zNczEHc2F7OX5OLqpDhnxoGo8+3MmOHTfVx1ARFgF+1ksQMk+2VzmME7EfKMF33gXODBLj7rX9XPR0sDrmLvHmxZvyqbAx4GKPCgs2/tP/jvEexoiWCQnJbEHOqFdHR8JL/SCxrv9OD8XUWbdVeyft4takPE72Ty8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733767495; c=relaxed/simple;
	bh=XHJVjy4G8KWnKFDzFwAU7io+1PqalpIVOjawoVejFoA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rHLEhY+t8Nc0LzUBIflfnoJmGVC51FiermZOaq0bi6mnaGWybUbSkUv6xahiHif5LmeOHHR0CHWaxskU0Ebc8lLXp16lImFqMtZrT3jl4faj7g0nm5AfhYB7/FU+JdH6v5Ac+iQqXLabDD6njP6fRFGJYsYg1cCFhdVxHjDUUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 313CD1650;
	Mon,  9 Dec 2024 10:05:21 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77A913F720;
	Mon,  9 Dec 2024 10:04:50 -0800 (PST)
Date: Mon, 9 Dec 2024 18:04:47 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: codekipper@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 wens@csie.org, macromorgan@hotmail.com, jszhang@kernel.org, uwu@icenowy.me,
 ryan@testtoast.com, dsimic@manjaro.org, mripard@kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: Add X96Q Pro support
Message-ID: <20241209180447.7ddcc231@donnerap.manchester.arm.com>
In-Reply-To: <20241111162524.46812-1-codekipper@gmail.com>
References: <20241111162524.46812-1-codekipper@gmail.com>
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

On Mon, 11 Nov 2024 17:25:04 +0100
codekipper@gmail.com wrote:

Hi Marcus,

> From: Marcus Cooper <codekipper@gmail.com>
> 
> Hi All,
> The X96Q-Pro is an STB based on the Allwinner H313 SoC with a SD
> slot, 2 USB-2 ports, a 10/100M ethernet port using the SoC's
> integrated PHY, Wifi via an sdio wifi chip, HDMI, an IR receiver,
> a blue LED display, an audio video connector and an digital S/PDIF
> connector.
> Further information can be found on the sunxi wiki
> https://linux-sunxi.org/X96QPro and the vendors site
> https://x96mini.com/products/android-10-x96q-pro-smart-tv-box

You hinted at sending a v2 some day, will you get the chance to do this
still this month? Then the DT would have a good chance of getting merged
into v6.14, I think.

Cheers,
Andre


> Thanks in advance for the reviews,
> CK
> 
> Marcus Cooper (2):
>   dt-bindings: arm: sunxi: Add the X96Q Pro board name
>   arm64: dts: allwinner: Add initial support for the X96Q-Pro STB
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-h313-x96q-pro.dts    | 176 ++++++++++++++++++
>  3 files changed, 182 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
> 

