Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A26F2C80
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Jan 2022 12:10:38 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id m3so15573516lfu.0
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Jan 2022 04:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1ASk1ZaGWbl1L7bJNHe86eeFcaH9CpdLru4n5MCQlcU=;
        b=MlRoMxof9Ml4PwJ8Hk8FE71HorpzBpmc+XCju9M1ALUTNlAA104/xnlPYnWhqcFHIT
         9Nhq2OHAjf6Zy9BEt3xEM5jJtvk8oIWgVw721BKfkutsRKss6XaVBy1h6Ot1ppZbwAVd
         0T7ynlWTGE9xHHMB3XE0loVsfFWlExGmay9CnRVpUR0oSI/8wEjzgL4hYWnc0ESlbX/T
         rcO6MDjoFb3Y3VI+kaQdXx4jh8v9xrcn6WXUbhSOWWAmiYvZIXzHcxCUVuJpxsLkZSNd
         oSZuAMon8uuJ02wkbcVlCSmglnyOqPCUxk500KcypMdxeOJxAo8DaWURBJpdtsMdRUYG
         WVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1ASk1ZaGWbl1L7bJNHe86eeFcaH9CpdLru4n5MCQlcU=;
        b=ZX9dbDlQDfOqefTVCZW8ytE3jd1NJECHoXsbfsx2ZPHFlpFTSfBixyfKjT+jsHmfuP
         f1jtEQjuVzc3iIb5F4RcW/bWy+4QXaaXgiwbVmJucfMYNhH4u+XdhBqpYUZBOKI2aTtF
         Mju+7Q9A7384/Hvy5QLfOcDbEj+dimE82YsverF5qfzyjXn+zKNPhbMqNrtEi4bXeIFd
         49SvWQpRUOdc0uNdj7zzp1v1S/uJe9/z91EvNs91xckFor6bH/zQLgHUpUFmsgZQr4hi
         Dk128gGYSFlxz2KIi/efIqMtzWQv2ouNTLa3XMq3a+ddDVYAZf4NPG6CtvdJXhZAKqeP
         D0VA==
X-Gm-Message-State: AOAM5317XzXiSYiQx25zx0rpw/ok3Y7j03B0Qd1PVzQFhIBbIXXuILno
	oaHe67z+9zMSWsy0WWo9CXrjCxisXHcjuw==
X-Google-Smtp-Source: ABdhPJywfrC+coKBN7OPdaFzCiyrFlmxyAarB5oxDbujdSUVaek3Dx1liriNsNq0WjEr+4u2VHHG1A==
X-Received: by 2002:a05:6512:703:: with SMTP id b3mr6662402lfs.331.1642162236506;
        Fri, 14 Jan 2022 04:10:36 -0800 (PST)
Received: from [192.168.1.213] (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.googlemail.com with ESMTPSA id bq6sm566911lfb.191.2022.01.14.04.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 04:10:35 -0800 (PST)
Subject: Re: [PATCH v5 3/3] ARM: dts: sun8i: r40: add second ethernet support
To: Andre Przywara <andre.przywara@foss.arm.com>,
 Maxime Ripard <maxime@cerno.tech>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sunxi@lists.linux.dev
References: <20220113053734.105813-1-boger@wirenboard.com>
 <20220113053734.105813-4-boger@wirenboard.com>
 <20220114094255.br6qqqgoajvhpt2x@houat>
 <20220114103750.01f95d70@donnerap.cambridge.arm.com>
From: Evgeny Boger <boger@wirenboard.com>
Message-ID: <0d62080d-e373-8b6f-699a-b7e4e84a26ce@wirenboard.com>
Date: Fri, 14 Jan 2022 15:10:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220114103750.01f95d70@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB



14.01.2022 13:37, Andre Przywara пишет:
> On Fri, 14 Jan 2022 10:42:55 +0100
> Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
>> On Thu, Jan 13, 2022 at 08:37:34AM +0300, Evgeny Boger wrote:
>>> R40 (aka V40, A40i, T3) has two different Ethernet IPs
>>> called EMAC and GMAC. EMAC only support 10/100 Mbit in MII mode,
>>> while GMAC support both 10/100 (MII) and 10/100/1000 (RGMII).
>>>
>>> In contrast to A10/A20 where GMAC and EMAC share the same pins
>>> making EMAC somewhat pointless, on R40 EMAC can be routed to port H.
>>> Both EMAC (on port H) and GMAC (on port A) can be then enabled at
>>> the same time, allowing for two ethernet ports.
>>>
>>> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
>>> ---
>>>   arch/arm/boot/dts/sun8i-r40.dtsi | 49 ++++++++++++++++++++++++++++++++
>>>   1 file changed, 49 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
>>> index 03d3e5f45a09..8770b105f86e 100644
>>> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
>>> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
>>> @@ -217,6 +217,19 @@ syscon: system-control@1c00000 {
>>>   			#size-cells = <1>;
>>>   			ranges;
>>>   
>>> +			sram_a: sram@0 {
>>> +				compatible = "mmio-sram";
>>> +				reg = <0x00000000 0xc000>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <1>;
>>> +				ranges = <0 0x00000000 0xc000>;
>>> +
>>> +				emac_sram: sram-section@8000 {
>>> +					compatible = "allwinner,sun4i-a10-sram-a3-a4";
>>> +					reg = <0x8000 0x4000>;
>>> +				};
>>> +			};
>>> +
>>>   			sram_c: sram@1d00000 {
>>>   				compatible = "mmio-sram";
>>>   				reg = <0x01d00000 0xd0000>;
>>> @@ -553,6 +566,24 @@ gmac_rgmii_pins: gmac-rgmii-pins {
>>>   				drive-strength = <40>;
>>>   			};
>>>   
>>> +			emac_pa_pins: emac-pa-pins {
>>> +				pins = "PA0", "PA1", "PA2",
>>> +				       "PA3", "PA4", "PA5", "PA6",
>>> +				       "PA7", "PA8", "PA9", "PA10",
>>> +				       "PA11", "PA12", "PA13", "PA14",
>>> +				       "PA15", "PA16";
>>> +				function = "emac";
>>> +			};
>>> +
>>> +			emac_ph_pins: emac-ph-pins {
>>> +				pins = "PH8", "PH9", "PH10", "PH11",
>>> +				       "PH14", "PH15", "PH16", "PH17",
>>> +				       "PH18","PH19", "PH20", "PH21",
>>> +				       "PH22", "PH23", "PH24", "PH25",
>>> +				       "PH26", "PH27";
>>> +				function = "emac";
>>> +			};
>> There's 17 pins on the first group, but 18 on the second, is it intentional?
> Yeah, looks like PA17 is missing above. This pin is used for MII only, so
> it is omitted from the existing gmac_rgmii_pins group.
>
> Evgeny: Did you try a 100MBit PHY on PortA? That should work with both the
> GMAC and EMAC, right? I wonder if we should add a group that connects all
> pins needed for MII to the GMAC as well, so basically the above (with PA17
> added), but using 'function = "gmac";'? Put an "/omit-if-no-ref/" before
> that (also to those above?) to avoid blowing up the DTB needlessly.
Hi Andre,

No, it's not intentional, thank you for noticing that!
I haven't tried EMAC on port A with the latest patch, but it should be 
trivial to do.
The problem with TXERR signal is that it's kind of optional, so it's 
hard to notice if it doesn't work properly.

As for adding gmac_*mii*_pins node, I think it could be useful. Do you 
suggest to add it to the same series? Strictly speaking, it has nothing 
to do with R40 and second ethernet support. GMAC is ubiquitous among 
Allwinner SoCs, so I think it would make sense to add to all SoCs at once.

As for /omit-if-no-ref/ on pinctrl nodes, is there a policy on it? I 
mean there are people (ourselves included) who use device tree overlays 
a lot, both in bootloader and kernel, so it's not that harmless.


> Cheers,
> Andre.


-- 
С уважением,
     Евгений Богер / Evgeny Boger
     CTO, Wiren Board Team
     https://wirenboard.com/ru
     +7 495 150 66 19 (# 33)

