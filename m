Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75C1EA3
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Jun 2023 06:35:10 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-519b771f23aso2099724a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Jun 2023 23:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686983709; x=1689575709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNT8my+SiFbZD9T/fcGxTR3DICyVBZUrxZ99bCKczpc=;
        b=qtZzIpdPyJHlaA2FTI6t5QCFza+C313CsGC/9mU/1VSsS/QKer4/A+pvQABorl/I9N
         qaqycr4Zzkm6xNmiavgNMbZ2R4sbDwoHa7nnXruVzUiDm+Qm7Qn2nnVyfCohVNXB2ho0
         7v6rWTa6cmlSlfLcTPPhK4dKsSrI66mPdWy+6/NMBVvLFMzfRzcPBg4GndE8yqxWY2qf
         Px4VzX8QtxPkhj+dXYyzakAQLHs9TpL0RZD69u64L3Wxz2AIQrDucTtEPrQUpwuFaaf/
         TnE07Ou0nmXb+oxo2EnG2r38t6GAwe2RFLmiz8Bqm0Q82whYQdbieY8oYG0rbzjHaJAL
         7H2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686983709; x=1689575709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNT8my+SiFbZD9T/fcGxTR3DICyVBZUrxZ99bCKczpc=;
        b=fv7YB4QgfLft6np8BJDrRTIr96X4m6uEr2s7E2hEZJrAt9fh9ZAjjU/rCywmy8Kyur
         1SEgGkhZPEPa1AcVSEgHIcu0C3Zl/7LCYkXIdqNfgm/S/cGnw/2gwtOpeYrY3CJSDjHp
         ocojzbsQNmBq07N/xGl6uQJsg+TaKvb+6rRkMSLw26Ne95b4QtU6QzDPz6qDIshfb/Lh
         TXlmd7SwaJbglZjXoxWZ4Bc+KkrhT+UY6fnRUHtsJKTjhMHDQmZa7vqohZXTbTXnZh15
         PK2R0L8Ac6+OFHsKJ46aHWQn8EnL72RM/pVGogZG0LjXqziX7LTpiLbFanQW4OSlrni3
         XU2g==
X-Gm-Message-State: AC+VfDwpNFAzR6aRXFHO95pp51El13hlQU3h7WS8ztoLvzkrHmJcDHGv
	XB0MOS8vfQcoBkWfbSuSWfM=
X-Google-Smtp-Source: ACHHUZ7GWkIRD6xmGpnYxFQ+dhryE5CHRW9+1jwEYo6qyRprIQVG7Lls890hd/g9eKnFJ7TSyb20uw==
X-Received: by 2002:a17:907:3f29:b0:973:8cb7:4d81 with SMTP id hq41-20020a1709073f2900b009738cb74d81mr5532340ejc.49.1686983708554;
        Fri, 16 Jun 2023 23:35:08 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id h27-20020a17090619db00b00987a6e01e94sm248705ejd.214.2023.06.16.23.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 23:35:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Marek Vasut <marex@denx.de>, Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Sam Edwards <cfsworks@gmail.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev, =?utf-8?B?6Lev6L6J?= <luhux76@gmail.com>
Subject:
 Re: [PATCH] usb: musb-new: sunxi: read SRAM controller address from DT
Date: Sat, 17 Jun 2023 08:35:01 +0200
Message-ID: <5941900.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20230613112158.1572725-1-andre.przywara@arm.com>
References: <20230613112158.1572725-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 13. junij 2023 ob 13:21:58 CEST je Andre Przywara napisal(a):
> Some older SoCs (<=A20, F1C100s) do not have a dedicated SRAM buffer for
> the USB-OTG controller, but require the CPU to relinquish one of its SRAM
> blocks to the USB controller. This is done by flipping a bit in the SRAM
> controller (aka "syscon").
> So far we were doing this using the hardcoded SRAM controller address,
> but that breaks the abstraction, and we can find that address in the DT.
> 
> Follow the "allwinner,sram" phandle property in the devicetree to get to
> the SRAM node. The reg property in there gives us the SRAM MMIO address,
> as seen by the CPU, but we need the SRAM *controller* address, which is
> two levels up from that node.
> 
> Utilise U-Boot's DT code to do the traversal and DT address translation
> for us, then store the controller address in the glue struct, to later
> hand it to the routine that programs the SRAM controller.
> This allows us to drop the usage of the hardcoded SUNXI_SRAMC_BASE from
> the MUSB code.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
> 
> this patch goes on top of Sam's musb sunxi fixes. Can someone look at
> the DT calls? There are quite some interfaces to U-Boot's DT framework,
> so I want to be sure to got the right one.
> If that patch looks fine, I would send a new series including Sam's two
> patches, this patch here, and a (simple) patch adding F1C100s support.
> 
> Cheers,
> Andre
> 
>  drivers/usb/musb-new/sunxi.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/musb-new/sunxi.c b/drivers/usb/musb-new/sunxi.c
> index 4bf0ee346a4..1da05e29a56 100644
> --- a/drivers/usb/musb-new/sunxi.c
> +++ b/drivers/usb/musb-new/sunxi.c
> @@ -23,13 +23,12 @@
>  #include <malloc.h>
>  #include <phy-sun4i-usb.h>
>  #include <reset.h>
> -#include <asm/arch/cpu.h>
> -#include <asm/arch/clock.h>
>  #include <dm/device_compat.h>
>  #include <dm/lists.h>
>  #include <dm/root.h>
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
> +#include <linux/ioport.h>
>  #include <linux/usb/musb.h>
>  #include "linux-compat.h"
>  #include "musb_core.h"
> @@ -93,6 +92,7 @@ struct sunxi_glue {
>  	struct sunxi_musb_config *cfg;
>  	struct device dev;
>  	struct phy phy;
> +	uintptr_t syscon_base;
>  };
>  #define to_sunxi_glue(d)	container_of(d, struct sunxi_glue, dev)
>  
> @@ -181,6 +181,7 @@ static void USBC_ForceVbusValidToHigh(__iomem void *base)
>   */
>  static void sunxi_musb_claim_sram(uintptr_t syscon_base)
>  {
> +	debug("%s(0x%lx);\n", __func__, (unsigned long)syscon_base);
>  	/*
>  	 * BIT(0) of SRAM_CTRL_REG1 (syscon+0x04) controls SRAM-D ownership:
>  	 * '0' -> exclusive access by CPU
> @@ -326,7 +327,7 @@ static int sunxi_musb_init(struct musb *musb)
>  		 * block 'D', ownership of which needs to be handed over by
>  		 * the CPU
>  		 */
> -		sunxi_musb_claim_sram(SUNXI_SRAMC_BASE);
> +		sunxi_musb_claim_sram(glue->syscon_base);
>  	}
>  
>  	USBC_EnableDpDmPullUp(musb->mregs);
> @@ -450,6 +451,7 @@ static int musb_usb_probe(struct udevice *dev)
>  	struct sunxi_glue *glue = dev_get_priv(dev);
>  	struct musb_host_data *host = &glue->mdata;
>  	struct musb_hdrc_platform_data pdata;
> +	struct ofnode_phandle_args args;
>  	void *base = dev_read_addr_ptr(dev);
>  	int ret;
>  
> @@ -476,6 +478,24 @@ static int musb_usb_probe(struct udevice *dev)
>  		return ret;
>  	}
>  
> +	ret = dev_read_phandle_with_args(dev, "allwinner,sram", NULL, 1, 0,
> +					 &args);
> +	if (ret && ret != -ENOENT) {
> +		dev_err(dev, "failed to get SRAM node\n");
> +		return ret;
> +	} else if (!ret) {
> +		/* The SRAM *controller* address is in the grandparent node. */
> +		ofnode node = ofnode_get_parent(ofnode_get_parent(args.node));

Above is not the safest thing to do in case of corrupted DT. It will trigger assert.

> +		struct resource res;
> +
> +		ret = ofnode_read_resource(node, 0, &res);

ofnode_get_addr() seems better choice here. What do you think?

Best regards,
Jernej

> +		if (ret) {
> +			dev_err(dev, "failed to read SRAM controller base\n");
> +			return ret;
> +		}
> +		glue->syscon_base = res.start;
> +	}
> +
>  	ret = generic_phy_get_by_name(dev, "usb", &glue->phy);
>  	if (ret) {
>  		pr_err("failed to get usb PHY\n");
> 




