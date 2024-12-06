Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F017A22C6D9
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Dec 2024 22:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733525653; cv=none; b=FJmXWRPbHexMO1vEHD4k4r6HoGkLJOdp/VpsAmQMlXyaGz1U+vTfFPuCXOfCgXYC5rkZBHgZ/GBocjkR5VqX1xeowGK28RTF3L8nlM3GXLct0yUpUMplOFZV0AB3N9rW+0jPZk2VdSxo6hwiH6lKY9c6V/GnqeMfdFl6OZJLEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733525653; c=relaxed/simple;
	bh=0btFgP3dY9K+jU1Jzkl2IE9zDYR0v/Zv/qXNjqyPFLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=F+id65xVzANxiJx8LpFfCv8+iWYDp1uS7Lvzqz35hLjd3ps81Sf9EYSIRK8Gwk+x8scbs+XRlU09teJ7TsOvmGIgNT1FjfDvQ2gCMTyN3DXNgDGxIfVu0RmIiXcjSideOB7Nh+GYXbxCdRPAsfJxFI2RIhzOWn/zAh3mxlCMmpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6EC411FB;
	Fri,  6 Dec 2024 14:54:37 -0800 (PST)
Received: from [192.168.0.54] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5F323F58B;
	Fri,  6 Dec 2024 14:54:08 -0800 (PST)
Message-ID: <8906c357-069e-454f-936e-f4a90124118c@arm.com>
Date: Fri, 6 Dec 2024 22:53:58 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: sun8i: r40/a40i: rm unneeded PH23 setup which resets
 Banana Pi M2 Ultra V1.1
To: Hermann.Lauer@uni-heidelberg.de, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20241206202005.GA24845@lemon.iwr.uni-heidelberg.de>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20241206202005.GA24845@lemon.iwr.uni-heidelberg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hermann,

thanks for sending the patch!

The subject line would need to be shortened, something like:
ARM: dts: sun8i-r40: remove unused GPIO regulator
(no need to sweat it with the A40i/R40/A40 names, they are all the same 
chip, essentially)

And please add the maintainers in "To:", and put the lists on Cc:, as 
shown by:
$ scripts/get_maintainer.pl 0001-*

On 06/12/2024 20:20, Hermann.Lauer@uni-heidelberg.de wrote:
> Banana Pi M2 Ultra V1.1 board resets immediately when the usb core tries
> to setup PH23 GPIO. It turned out that the V1.0 board USB-A ports are
> always power supplied and according to the board scheme PH23 is simply
> not connected.
> 
> So remove the PH23 setup: Doesn't harm V1.0 (with R40) and let V1.1
> (with A40i) start
> 
> Signed-off-by: Hermann Lauer <Hermann.Lauer@uni-heidelberg.de>
> ---
> 
> # HG changeset patch
> # Parent  236ffa4558b03bbc654515fae80a7a2387f06cd4

Please remove those two lines, if possible.

> diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
> --- a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
> +++ b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
> @@ -347,7 +347,5 @@
>   };
>   
>   &usbphy {
> -	usb1_vbus-supply = <&reg_vcc5v0>;
> -	usb2_vbus-supply = <&reg_vcc5v0>;

So while this fixes your immediate problem, the regulator with the 
deadly GPIO is still in. For once it's not needed anymore, but more 
importantly it still references the problematic GPIO, so please remove 
the whole reg_vcc5v0 regulator node altogether as well.

Cheers,
Andre



>   	status = "okay";
>   };
> 
