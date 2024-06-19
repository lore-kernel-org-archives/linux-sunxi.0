Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2284B368
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718755347; cv=none; b=YF5qCk18nO1k2tun1YWfP/9Ml1W2phHJOQdFWlAkUkaHKlbRXePcVH/qGkMRnkFemfpztdO9tI2fA9ybaQMpRwwKAPxDLFxjHyF01SmUqPjp3J4VH4Sx/KLk/Ve+LnViueeZby9gFeBGeoL0gIZbzTpWUfstpzQqGbFyMKMnmN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718755347; c=relaxed/simple;
	bh=R+6FaQSR6Nnrm2BWGpVhIViug0n83gw/N5/k6HFesZc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+YmwPTI+aFY27/BslPpBT4Qr76S+pDFluniM1RKZcRJMeoNcjsgMlSiRu1DUMuIcVGu3WMXApr+v+++7P1D1XvipmPdgfJ3CJk94mCX37J4XhD3YlVINAGVKq7/+E/4YeTbmFovKKskuOFM6MybqU5KOgTWBncJTKjGeq/ViX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C3C1DA7;
	Tue, 18 Jun 2024 17:02:49 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CD543F64C;
	Tue, 18 Jun 2024 17:02:22 -0700 (PDT)
Date: Wed, 19 Jun 2024 01:00:51 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Chris
 Morgan <macroalpha82@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: rg35xx: Enable DVFS CPU
 frequency scaling
Message-ID: <20240619010051.1bd9f00f@minigeek.lan>
In-Reply-To: <20240607092140.33112-4-ryan@testtoast.com>
References: <20240607092140.33112-1-ryan@testtoast.com>
	<20240607092140.33112-4-ryan@testtoast.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  7 Jun 2024 21:20:35 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

> The Anbernic RG35XX device variants (-2024, -H, -Plus and -SP) are the
> only currently known devices to have an Allwinner H700 SoC. The closely
> related RG28XX also has the H700 but a mainline DT for this device has
> not yet been submitted.
> 
> Include the H616 CPU OPP table in the base device DTS, and increase the
> DCDC1 regulator (vdd-cpu) upper voltage range to 1.16V, allowing the
> CPU to reach 1.5GHz.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index ee30584b6ad70..afb49e65859f9 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -6,7 +6,7 @@
>  /dts-v1/;
>  
>  #include "sun50i-h616.dtsi"
> -
> +#include "sun50i-h616-cpu-opp.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -221,7 +221,7 @@ regulators {
>  			reg_dcdc1: dcdc1 {
>  				regulator-always-on;
>  				regulator-min-microvolt = <900000>;
> -				regulator-max-microvolt = <1100000>;
> +				regulator-max-microvolt = <1160000>;
>  				regulator-name = "vdd-cpu";
>  			};
>  

