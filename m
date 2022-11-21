Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91344A4F
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 09:33:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AF341FB;
	Mon, 21 Nov 2022 01:33:19 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39A1D3F587;
	Mon, 21 Nov 2022 01:33:11 -0800 (PST)
Date: Mon, 21 Nov 2022 09:33:08 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v4 0/3] phy: sun4i-usb: add support for the USB PHY on
 F1C100s SoC
Message-ID: <20221121093308.6c01140b@donnerap.cambridge.arm.com>
In-Reply-To: <20221116151603.819533-1-andre.przywara@arm.com>
References: <20221116151603.819533-1-andre.przywara@arm.com>
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

On Wed, 16 Nov 2022 15:16:00 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

Hi Vinod, Kishon,

is there any chance you could take at least patch 1/3 and 2/3 through your
tree? As suggested, I split this off the original series, which now
somewhat depends on this one - at least dtbs_check and functionality wise,
both series build cleanly in isolation.

Many thanks,
Andre

> This is a spin-off of v3 of the suniv F1C100s USB support series[1], just
> carrying the USB PHY bits. The H616 USB PHY support is already in
> linux-phy.git/next, so this is rebased on top of that, to avoid
> conflicts.
> The actual binding and driver change in the first two patches is
> straightforward. Since it came up in reviews, I reworked the quirk
> handling in the phy-sun4i-usb.c driver, to become more maintainable and
> readable, in patch 3/3. For a changelog, see below.
> 
> Cheers,
> Andre
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20221106154826.6687-1-andre.przywara@arm.com/
> 
> Changelog v3 ... v4:
> - split off from rest of suniv F1C100s USB series
> - rebase on top of H616 USB PHY patches
> - drop phy2_is_hsic in favour of reusing existing hsic_index member
> - add tags
> 
> Changelog v2 ... v3:
> - remove redundant "Device Tree Bindings" suffix in DT binding doc title
> - add BSD license to binding doc file (as per checkpatch)
> - use existing PHY sun4i_a10_phy type instead of inventing new one
> - add patch to clean up sunxi USB PHY driver
> 
> Changelog v1 ... v2:
> - USB PHY binding: clarify the relation with other phy-sun4i-usb bindings
> 
> 
> 
> Andre Przywara (1):
>   phy: sun4i-usb: Replace types with explicit quirk flags
> 
> Icenowy Zheng (2):
>   dt-bindings: phy: add binding document for Allwinner F1C100s USB PHY
>   phy: sun4i-usb: add support for the USB PHY on F1C100s SoC
> 
>  .../phy/allwinner,suniv-f1c100s-usb-phy.yaml  | 83 +++++++++++++++++++
>  drivers/phy/allwinner/phy-sun4i-usb.c         | 59 ++++++-------
>  2 files changed, 107 insertions(+), 35 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,suniv-f1c100s-usb-phy.yaml
> 

