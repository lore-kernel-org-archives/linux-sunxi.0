Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DE172
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jul 2021 17:06:44 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 11so10046084ljv.1
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jul 2021 10:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20150623.gappssmtp.com; s=20150623;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=M986TXM8Elhqx77McAzCNistGm/yYBG8wncUlSFsEKE=;
        b=XcfXADl9ihKjBANqPnWxlbzObmR4YXiu40U5QnlyKVSaVQAtfVVDXVTrQovy0zAgsE
         sjdKbNmLXs15G5lq4Nw5rMxsYGN8YGKEytjizT1NiDEvpq7cCJkm2U1C9CsJtx4aLv5q
         lytjm8z7ludJAd39LlZOcaIBxHqe7CLikggeRQdk2ihrLeWxbLbt8aduVlfd9bIkkfUR
         yWsgIIUdIdS9XmmiK7qA2k2HsRlGthTTeut6cyF6Tp8/AIWR3Hhvnrm5rj2jqBvaiHqH
         45VorSNnIimLk4FE7kGBQBYdn/ahUhQ/SRsVi/8MpzJ0UkyulTT4r0rFC0QDqStUlB5A
         c5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=M986TXM8Elhqx77McAzCNistGm/yYBG8wncUlSFsEKE=;
        b=Wj70ohPZR1Pud8yRZ0QmEhMoL/iAzG5lDAQfn9fU631FhadDgbTTNUzB8LAGNQ7MjZ
         J4TXOELRYNb1bUDk04G8gigPfvPb5sIbzWNaMTvGtpMfp2eOV9wufELlyFwAy3M9YNXn
         qhqsQklpB/VrnFL16q8S13z9j9rThaAe45ngARoAqE4KMG63lbmuKvVFjuW9vnEnilBB
         N5Ij/bVnQdiIz1SDzzPkVAANHZpiKSD80QTYYclGFea1BGVIgo8tsEgUW4lpGgZClj2p
         2Vk2kxDxuX21xGo1V2MJR+szoCnHaX/KqOoprKzvXPpc8BlT++YK7rQcwMGVPXTqqMRH
         n4ew==
X-Gm-Message-State: AOAM531UVCMCpsUHKUOsuicscVZBkkrXQyvodGXvyQcpnPRaS/0RhO6s
	lIlEf6c8UtEDHctB2SqemCJuPQ==
X-Google-Smtp-Source: ABdhPJwGOpWu/BWyGs/x9+6ayJhYvO5vwN+5VE5SmpfqLNxZHKXR9618lU1L6a6NRPtcajWDC9Bhcg==
X-Received: by 2002:a2e:571d:: with SMTP id l29mr32500901ljb.163.1625936802588;
        Sat, 10 Jul 2021 10:06:42 -0700 (PDT)
Received: from [192.168.1.213] (81.5.110.226.dhcp.mipt-telecom.ru. [81.5.110.226])
        by smtp.googlemail.com with ESMTPSA id v138sm311305lfa.48.2021.07.10.10.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jul 2021 10:06:42 -0700 (PDT)
To: qianfanguijin@163.com
Cc: andre.przywara@arm.com, jernej.skrabec@gmail.com,
 linux-sunxi@lists.linux.dev, mripard@kernel.org, wens@csie.org,
 Icenowy Zheng <icenowy@aosc.xyz>
References: <20210705033104.7824-1-qianfanguijin@163.com>
Subject: Re: [PATCH v3 1/3] phy-sun4i-usb: Fix sun8i_r40_cfg
From: Evgeny Boger <boger@wirenboard.com>
Message-ID: <8021df40-f2dc-a2d5-7d6c-ad6e248c6835@wirenboard.com>
Date: Sat, 10 Jul 2021 20:06:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210705033104.7824-1-qianfanguijin@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

Hi,

I don't think that's the case.

According to my tests on custom Allwinner A40i board, the USB0 PHY works 
exactly as expected from its current configuration.

I.e. there are working ehci0/ohci0 at 1c14000/1c14400, which are working 
only if USB0 PHY is routed to EHCI/OHCI. In turn, musb stops working if 
we route USB0 to EHCI/OHCI.

Also, .enable_pmu_unk1 is needed as well.

So, the real issue here is that our current usb phy driver expects 
_both_ usbotg and ehci0+ohci0 nodes to be present and enabled so 
.phy0_dual_route works properly [1]. Attached please find the dtsi patch.

By the way, don't we need to improve PHY dual route handling?

I think the current behaviour is quite confusing. As one can see, USB on 
affected Allwinner SoCs doesn't work properly if only musb is enabled, 
as PHY is routed to non-initialized EHCI/OHCI. Surprisingly, USB won't 
also work if only ehci0/ohci0 are enabled, as usb phy is not referenced 
in ehci0/ohci0 nodes and thus won't be properly initialized. Musb's host 
controller is also exposed to the system, although it's never really 
used. I'm also afraid that current behaviour messes up with OTG dual 
role state machine, which is rarely used nowadays, but still.


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3ecc25e12f0e210d56fcca110a8144e50db05905

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi 
b/arch/arm/boot/dts/sun8i-r40.dtsi
index d5ad3b9efd12..98f598805867 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -363,6 +363,20 @@ mmc3: mmc@1c12000 {
                         #size-cells = <0>;
                 };

+               usb_otg: usb@1c13000 {
+                       compatible = "allwinner,sun8i-h3-musb";
+                       reg = <0x01c13000 0x0400>;
+                       clocks = <&ccu CLK_BUS_OTG>;
+                       resets = <&ccu RST_BUS_OTG>;
+                       interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+                       interrupt-names = "mc";
+                       phys = <&usbphy 0>;
+                       phy-names = "usb";
+                       extcon = <&usbphy 0>;
+                       dr_mode = "otg";
+                       status = "disabled";
+               };
+
                 usbphy: phy@1c13400 {
                         compatible = "allwinner,sun8i-r40-usb-phy";
                         reg = <0x01c13400 0x14>,
@@ -421,6 +435,25 @@ ahci: sata@1c18000 {
                         status = "disabled";
                 };

+               ehci0: usb@1c14000 {
+                       compatible = "allwinner,sun8i-r40-ehci", 
"generic-ehci";
+                       reg = <0x01c14000 0x100>;
+                       interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+                       clocks = <&ccu CLK_BUS_EHCI0>;
+                       resets = <&ccu RST_BUS_EHCI0>;
+                       status = "disabled";
+               };
+
+               ohci0: usb@1c14400 {
+                       compatible = "allwinner,sun8i-r40-ohci", 
"generic-ohci";
+                       reg = <0x01c14400 0x100>;
+                       interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+                       clocks = <&ccu CLK_BUS_OHCI0>,
+                                        <&ccu CLK_USB_OHCI0>;
+                       resets = <&ccu RST_BUS_OHCI0>;
+                       status = "disabled";
+               };
+
                 ehci1: usb@1c19000 {
                         compatible = "allwinner,sun8i-r40-ehci", 
"generic-ehci";
                         reg = <0x01c19000 0x100>;

