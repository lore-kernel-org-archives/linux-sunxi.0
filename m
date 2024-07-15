Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F8018FA01
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Jul 2024 14:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721053892; cv=none; b=YgPP9E9w1nBmd8bqAcbGkyPBNnSDwUfB1F2A78HSeaV1HV4ulskNhKqNC3+OJpAogoIFVciDv8gbde79zswHyg+oPLS7rKjFLYJmm2oqwNWuXqTUskBheQyW0zUybLBImpRWqmF3LcdX+X9I2mpgDwYbKQSe7h0xaKJQt9cIeUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721053892; c=relaxed/simple;
	bh=crb+jqK+oSxvrPaIxqH++HtwQvHGvekMPic165ghUJA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F/cOkJ+dCF/wkdes/ZSz57dR5W2arKGHvhzLL7PmND4+FJ3IQB/2JPTfhPIq3QRTpXD2DsqsEW5YA9vfdI4gz1CiT4P1/VNbs/X0qbdLfFiEQHGse9FhF2DV1ZvJ1DMaz6ureEkplytRI979Vj084hkJHuY9GQNrnkyo9EMOPIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA3CFEC;
	Mon, 15 Jul 2024 07:31:55 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D5533F766;
	Mon, 15 Jul 2024 07:31:28 -0700 (PDT)
Date: Mon, 15 Jul 2024 15:31:25 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>, Jaehoon Chung <jh80.chung@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Chris
 Morgan <macromorgan@hotmail.com>, Ryan Walklin <ryan@testtoast.com>,
 Philippe Simons <simons.philippe@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/6] power: pmic: sunxi: only build AXP drivers for
 SPL
Message-ID: <20240715153125.7aaf86be@donnerap.manchester.arm.com>
In-Reply-To: <20240712165352.3767166-3-andre.przywara@arm.com>
References: <20240712165352.3767166-1-andre.przywara@arm.com>
	<20240712165352.3767166-3-andre.przywara@arm.com>
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

On Fri, 12 Jul 2024 17:53:48 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

> The axp<xxx>.c drivers are only used for the SPL, for U-Boot proper we
> have a separate, DM compliant driver.
> Mask the build instructions with CONFIG_SPL_BUILD, to avoid them being
> build for U-Boot proper as well.

For the records: this breaks builds of boards with the AXP221, since they
need axp_get_sid() for the cpuinfo() function in U-Boot proper, and
axp_set_eldo() for some hideous code in sunxi_display.c. I have a decent
fix for the former, but the latter requires some refactoring. So I will
keep the axp221.o line out of this SPL-only guard for now.

Cheers,
Andre

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/power/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/power/Makefile b/drivers/power/Makefile
> index c7ee4595fc8..0f39459dec4 100644
> --- a/drivers/power/Makefile
> +++ b/drivers/power/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_$(SPL_TPL_)POWER_DOMAIN) += domain/
>  obj-y += pmic/
>  obj-y += regulator/
>  
> +ifdef CONFIG_SPL_BUILD
>  obj-$(CONFIG_AXP152_POWER)	+= axp152.o
>  obj-$(CONFIG_AXP209_POWER)	+= axp209.o
>  obj-$(CONFIG_AXP221_POWER)	+= axp221.o
> @@ -15,6 +16,7 @@ obj-$(CONFIG_AXP305_POWER)	+= axp305.o
>  obj-$(CONFIG_AXP313_POWER)	+= axp313.o
>  obj-$(CONFIG_AXP809_POWER)	+= axp809.o
>  obj-$(CONFIG_AXP818_POWER)	+= axp818.o
> +endif
>  obj-$(CONFIG_EXYNOS_TMU)	+= exynos-tmu.o
>  obj-$(CONFIG_SY8106A_POWER)	+= sy8106a.o
>  obj-$(CONFIG_TPS6586X_POWER)	+= tps6586x.o

