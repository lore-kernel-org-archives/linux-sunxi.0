Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E849E2BEC2E
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jan 2026 14:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399622; cv=none; b=daVZ9mHCaRLqroCM/KTX+QdvgJRR8QN0pqDlZE5KYyTumVQUSZArt/NBNi+BMBeJjOyG6DkylAu58UJChCRjdbEh6ocdWec3M8mmIm7hVKBtjo0rH+WGNO+1igl17FWob+ha+B9mRzZNID29mo+NHrSvz405lfxYfVWKKX7wcoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399622; c=relaxed/simple;
	bh=y5u8cltlwT2+49hSOGuYdfse6QUPO2ckdibtKTQtok4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BAT7R0pP4I6D7dqSizjmXvrim9bBGRRWgfyka3YMndFa46RCUnzmvFUJLlqEbYcXV0jHwTSImHLFQAqe2A4p++oOOKEk/ic1y3gzfW3p7elyVcvhwNLcq+VF0CCZbn7lXNGNSeQXZzHEL6WQOkC/QdOiJhTCN3fqNGeLyiwlupc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E9BE1515;
	Wed, 14 Jan 2026 06:06:52 -0800 (PST)
Received: from orionap.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08C2E3F632;
	Wed, 14 Jan 2026 06:06:56 -0800 (PST)
Date: Wed, 14 Jan 2026 14:06:53 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: sun7i: a20: fix MMC index enumeration
Message-ID: <20260114140653.05365221@orionap.fritz.box>
In-Reply-To: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
References: <20260114105005.3136045-1-giulio.benetti@benettiengineering.com>
Organization: ARM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Jan 2026 11:50:04 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

Hi Giulio,

> Currently, the OLinuXino-A20-Micro experiences non-deterministic MMC
> enumeration during boot. When both an SDIO WiFi module (MMC1) and
> an SD card (MMC0) are present, the kernel may swap their indices.
> 
> Explicitly define mmc* aliases to ensure consistent device naming
> and prevent mapping conflicts.

So this comes up every now and then, but for sunxi it was decided to not
support this. The enumeration of devices in the kernel is never guaranteed
to follow some order, and this is widely accepted for SCSI (/dev/sda) and
NVMe. Distros are coping with this forever since, using more sustainable
designations like UUIDs or labels.

If you don't want to change the way you communicate the root device to the
kernel, you can actually use U-Boot's DTs, which adds the indicies for its
own purposes, and can pass this on to the kernel. Just don't load a DT
from storage (which you shouldn't be doing anyways), and just use
$fdtcontroladdr as the DT address when booting the kernel.

Cheers,
Andre

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
> index 5f44f09c5545..a958400bcd7c 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
> @@ -55,6 +55,10 @@ / {
>  	#size-cells = <1>;
>  
>  	aliases {
> +		mmc0 = &mmc0;
> +		mmc1 = &mmc1;
> +		mmc2 = &mmc2;
> +		mmc3 = &mmc3;
>  		ethernet0 = &gmac;
>  	};
>  

