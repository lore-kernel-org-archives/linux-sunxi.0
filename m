Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34153DEFE7
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jul 2026 22:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673748; cv=none; b=nfRBne7z4E/unT02G49tjjUKcc5x7PLfilbqabalh/+YH2AGnas5RWWXQAVRUHQZwQ2sAWUd6ji/hAxi7SdabJyn41+dZW30yIZ1ZSlm+zGkYa/OvbKSLKw0ZyaB+l50VbPOQ7LWYM3wsKlqYSNmgobQP9azquzZdB5F1bAAB6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673748; c=relaxed/simple;
	bh=RxYsiQP8kq8WcX4Wiu5TBYeE+KzuGRPuMyC04vTe9lo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XdD8jxPCCflOBaBT6E6QEdp+Mhl0StVkuDX1jz4gq9aGk3HGqLwZTLyOjLF4D/UIoBWKT3YMn5DSSPJHW9qkLVtbIC9eJ26oMKfLtG1eGQmP/530YwrxkseTL9BLiz6QEyeri8xaMay40UYLRdxeNiUjdxd5b84yBLwDOd4QcZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jJEHv73h; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jJEHv73h"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE9C41476;
	Tue, 21 Jul 2026 15:42:20 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15AD93F86F;
	Tue, 21 Jul 2026 15:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784673744; bh=RxYsiQP8kq8WcX4Wiu5TBYeE+KzuGRPuMyC04vTe9lo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jJEHv73hO6HQ086lu5xbbitXLOIGvcROEcTiIkVYUuD2o4T+l39wdKV8aezTQckJT
	 DT1haVSH+RvItnWnU7gy41xC2ZW81zMcRGrrE40Wql6Qt0dl4rcQ5ufj83RXNKeajk
	 i3dySNQ3QBnxXoJwt+6eL15DwX8atYc+Sxa1mz3g=
Date: Wed, 22 Jul 2026 00:38:36 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: a523: x96qpro+: overvolting eMMC
Message-ID: <20260722003836.4677a33b@ryzen.lan>
In-Reply-To: <20260720213832.3763-1-andre.przywara@arm.com>
References: <20260720213832.3763-1-andre.przywara@arm.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Jul 2026 23:38:32 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

> On the X96QPro+ TV box, the eMMC wasn't working properly: the chip would
> be detected, but most requests failed, leaving it unusable. Some
> "solutions" were circulating downstream, one "popular" one is severely
> limiting the clock frequency, with a drastic performance impact.
> 
> Instead slightly bumping the I/O voltage on PortC from the canonical
> 1.8V to 1.9V seemed to do the trick: the eMMC now works and reaches the
> expected 120MB/s performance.

So for the records: please disregard this patch, it was more voodoo
than a proper fix.
As Sashiko pointed out, this slight voltage bump changes the GPIO bank
withstand voltage, which turned out to be the actual culprit: the
encoding was wrong, and the new voltage here now changed the value to
inadvertently use the right bit setting.
I will send another patch to fix this properly.

Cheers,
Andre

> 
> Adjust the respective regulator voltage in the .dts to enable eMMC
> operation on that device.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
> 
> I am not super happy with this patch, but it seems to be a pragmatic and
> the least hacky solution I have seen.
> 
> Cheers,
> Andre
> 
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> index a96927fbdadd5..5636e95312218 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> @@ -194,8 +194,8 @@ reg_bldo4: bldo4 {
>  
>  			reg_cldo1: cldo1 {
>  				regulator-always-on;
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <1800000>;
> +				regulator-min-microvolt = <1900000>;
> +				regulator-max-microvolt = <1900000>;
>  				regulator-name = "vcc-codec-sd";
>  			};
>  

