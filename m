Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF0F25A65E
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740420033; cv=none; b=rGjX9niHWLWrf3yvuLA4vA7raNxIXgKMsqJ0LI1YU1HqNvxfutXblIfRkpWApkX9nHnK33hRzjXaRMbeH80CI174aWaDg8ZPo1HRqdo6GwoOLfQ+9ZR58kRIG5uGSIHbUDjHDgG2SYx1rX0Bn3yK4R+AD6Ipj2N8t43SCIMsZ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740420033; c=relaxed/simple;
	bh=dgloKXcKVpSKtrf/dWe0ySsZ0JgzxCev0zt2s1Bd8jc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvoDD9AWnFgSD1ABJ5IY8QF9szkWUYXqu1L07HN+uZRcUCnLin4PTlJIb8/AWOPucJYYsUC8b64E1Qr1SdrTI6AcidgA5VkjkxF82WXtDnZSoGcxajBdMYRmwRqWOhBwZtTUmbjlAlyXlx/9ScwXIGtCMJIHNjCQ+DmienHSHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF246152B;
	Mon, 24 Feb 2025 10:00:47 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46D223F5A1;
	Mon, 24 Feb 2025 10:00:29 -0800 (PST)
Date: Mon, 24 Feb 2025 18:00:25 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macroalpha82@gmail.com>, Hironori KIKUCHI
 <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: allwinner: h616: add display engine,
 bus and mixer nodes
Message-ID: <20250224180025.4eb33c3f@donnerap.manchester.arm.com>
In-Reply-To: <20250216092827.15444-3-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
	<20250216092827.15444-3-ryan@testtoast.com>
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

On Sun, 16 Feb 2025 22:27:09 +1300
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The Allwinner H616 and variants (H618, H700 and T507) have a new display
> engine variant (DE33). Support has been added to the existing DE2/DE3
> sun4i driver in a previous patch series (x). The variant is selected via
> the appropriate mixer device tree compatible string.
> 
> Add the respective device-tree nodes for the DE, bus, clock and mixer to
> the H616 DTSI, and the matching SRAM section for the DE.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index cdce3dcb8ec02..ab8b70ce7df89 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -94,6 +94,12 @@ l2_cache: l2-cache {
>  		};
>  	};
>  
> +	de: display-engine {
> +		compatible = "allwinner,sun50i-h6-display-engine";

That should either be sun50i-h616-display-engine, or it should use a
fallback. IIUC this "device" is just something more or less artificial
that ties things together? I don't see any differences between the
latest SoCs in the driver, but still we seem to use a separate compatible
for every SoC there, which I guess is intentional?

> +		allwinner,pipelines = <&mixer0>;
> +		status = "disabled";
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -150,6 +156,51 @@ soc {
>  		#size-cells = <1>;
>  		ranges = <0x0 0x0 0x0 0x40000000>;
>  
> +		bus: bus@1000000 {
> +			compatible = "allwinner,sun50i-h616-de33",
> +				     "allwinner,sun50i-a64-de2";
> +			reg = <0x1000000 0x400000>;
> +			allwinner,sram = <&de3_sram 1>;

Should this label be de33_sram?

> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x1000000 0x400000>;
> +
> +			display_clocks: clock@8000 {
> +				compatible = "allwinner,sun50i-h616-de33-clk";
> +				reg = <0x8000 0x100>;
> +				clocks = <&ccu CLK_DE>, <&ccu CLK_BUS_DE>;
> +				clock-names = "mod", "bus";
> +				resets = <&ccu RST_BUS_DE>;
> +				#clock-cells = <1>;
> +				#reset-cells = <1>;
> +			};
> +
> +			mixer0: mixer@100000 {
> +				compatible = "allwinner,sun50i-h616-de33-mixer-0";
> +				reg = <0x100000 0x100000>,
> +				      <0x8100 0x40>,
> +				      <0x280000 0x20000>;

As mentioned in the binding patch, I think having reg-names here would
help to make it clearer what those regions are for.

> +				clocks = <&display_clocks CLK_BUS_MIXER0>,
> +					 <&display_clocks CLK_MIXER0>;
> +				clock-names = "bus", "mod";
> +				resets = <&display_clocks RST_MIXER0>;
> +				iommus = <&iommu 0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					mixer0_out: port@1 {
> +						reg = <1>;
> +
> +						mixer0_out_tcon_top_mixer0: endpoint {
> +							remote-endpoint = <&tcon_top_mixer0_in_mixer0>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +
>  		crypto: crypto@1904000 {
>  			compatible = "allwinner,sun50i-h616-crypto";
>  			reg = <0x01904000 0x800>;
> @@ -173,6 +224,11 @@ sram_c: sram@28000 {
>  				#address-cells = <1>;
>  				#size-cells = <1>;
>  				ranges = <0 0x00028000 0x30000>;
> +
> +				de3_sram: sram-section@0 {

de33_sram?

> +					compatible = "allwinner,sun50i-a64-sram-c";

I think we need a new compatible, with the A64 as a fallback. The H6 seems
to do this as well.

Cheers,
Andre

> +					reg = <0x0000 0x1e000>;
> +				};
>  			};
>  		};
>  

