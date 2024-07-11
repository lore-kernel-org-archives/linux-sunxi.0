Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7E815746A
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Jul 2024 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720691583; cv=none; b=uTS7KF6iXrW10msGXfLrzbIrvt3xyG0iqfdrMiNwvtaxW0YAIopsCKjOjq/pvahmMascA4DW1pnEflFf3llfUbDE/9YMWW/ap58P9WxbqIjw6yebLDZRafa87UA50WkJRpsd+ou8OczMt3NSqPPNCUNoIhHvRVBqPZgokOi1ej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720691583; c=relaxed/simple;
	bh=y7Cnxvg2uhUsTVqpxt20HGLYNjuHntJRlTgTlzJc+MA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V16M1KclSCPhi+LjQSd2YimemRrZN4vN7+gXo34AA4tMsGrdJKycqnBUujSAytGQKi0b1Yn526iuh0SOl9Fdts4h1t/+En5OUZcWDqZD92GyFLJ8xcdkhlWUIWUsMmXnEbsqcu1vzb636tqX0+M0YvDRQtoAcvVL3NAhVYb7jFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EEE81007;
	Thu, 11 Jul 2024 02:53:26 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 418FA3F766;
	Thu, 11 Jul 2024 02:52:59 -0700 (PDT)
Date: Thu, 11 Jul 2024 10:52:56 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 mripard@kernel.org, ryan@testtoast.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, Chris Morgan
 <macromorgan@hotmail.com>, Philippe Simons <simons.philippe@gmail.com>
Subject: Re: [PATCH V3 3/4] arm64: dts: allwinner: h616: Change RG35XX
 Series from r_rsb to r_i2c
Message-ID: <20240711105256.61d1f00e@donnerap.manchester.arm.com>
In-Reply-To: <20240710231718.106894-4-macroalpha82@gmail.com>
References: <20240710231718.106894-1-macroalpha82@gmail.com>
	<20240710231718.106894-4-macroalpha82@gmail.com>
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

On Wed, 10 Jul 2024 18:17:17 -0500
Chris Morgan <macroalpha82@gmail.com> wrote:

Hi,

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Change the Anbernic RG35XX series to use the r_i2c bus for the PMIC
> instead of the r_rsb bus. This is to keep the device tree consistent
> as there are at least 3 devices (the RG35XX-SP, RG28XX, and RG40XX-H)
> that have an external RTC on the r_i2c bus.

The change itself looks alright, but I would like to see some Tested-by:s
from people with those Allwinner Anbernic devices, since the change affects
all of them.

> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index ee30584b6ad7..e2bbd22bd80a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -201,12 +201,12 @@ &pio {
>  	vcc-pi-supply = <&reg_cldo3>;
>  };
>  
> -&r_rsb {
> +&r_i2c {
>  	status = "okay";
>  
> -	axp717: pmic@3a3 {
> +	axp717: pmic@34 {
>  		compatible = "x-powers,axp717";
> -		reg = <0x3a3>;
> +		reg = <0x34>;
>  		interrupt-controller;
>  		#interrupt-cells = <1>;
>  		interrupt-parent = <&nmi_intc>;

