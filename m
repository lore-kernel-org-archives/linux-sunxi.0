Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3A37E1
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Apr 2023 00:48:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F23411063;
	Sat, 15 Apr 2023 17:49:15 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEFE93F73F;
	Sat, 15 Apr 2023 17:48:29 -0700 (PDT)
Date: Sun, 16 Apr 2023 01:47:56 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jonathan McDowell <noodles@earth.li>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: sun5i: Add port E pinmux settings for
 mmc2
Message-ID: <20230416014756.2270af13@slackpad.lan>
In-Reply-To: <00d37ef9bf70785d05fb446ee6d0060c4a8d521a.1681580558.git.noodles@earth.li>
References: <cover.1681580558.git.noodles@earth.li>
	<00d37ef9bf70785d05fb446ee6d0060c4a8d521a.1681580558.git.noodles@earth.li>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 15 Apr 2023 18:46:24 +0100
Jonathan McDowell <noodles@earth.li> wrote:

Hi,

> These alternate pins for mmc2 are brought out to the 40 pin U14 header
> on the C.H.I.P and can be used to add an external MMC device with a 4
> bit interface. See
> 
> https://byteporter.com/ntc-chip-micro-sd-slot/
> 
> for further details on how.
> 
> Signed-off-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/sun5i.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
> index 250d6b87ab4d..e4922506ce22 100644
> --- a/arch/arm/boot/dts/sun5i.dtsi
> +++ b/arch/arm/boot/dts/sun5i.dtsi
> @@ -517,6 +517,14 @@ mmc2_4bit_pc_pins: mmc2-4bit-pc-pins {
>  				bias-pull-up;
>  			};
> 

As this seems to be a highly non-standard and rare modification, that
doesn't even get used in the mainline DT, please add a:
			/omit-if-no-ref/
line, so we don't get this into every sun5i board.

Otherwise looks good, though I don't know if that should belong into
the same DT overlay that is probably used to also enable the MMC2 node.

Cheers,
Andre


> +			mmc2_4bit_pe_pins: mmc2-4bit-pe-pins {
> +				pins = "PE4", "PE5", "PE6", "PE7",
> +				       "PE8", "PE9";
> +				function = "mmc2";
> +				drive-strength = <30>;
> +				bias-pull-up;
> +			};
> +
>  			mmc2_8bit_pins: mmc2-8bit-pins {
>  				pins = "PC6", "PC7", "PC8", "PC9",
>  				       "PC10", "PC11", "PC12", "PC13",

