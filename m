Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D7173
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 08:59:34 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id e3so2922608lfc.9
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 00:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hYar1LitKjoEfAl2JnfsMukPkQViOGYPpgjJSu1h+TM=;
        b=htea1mxZcGWpvoArah6sPXsIOtBMWNlV+FAiyMuX7D5UxTC+1oQi3K4YRmnF1Xtfjk
         qIs4ppmZ4m8PogOWbEdyf/KaBJdF86s+sMXDqkip0jyQir0jaSoT05Y9V/b6nwFsLtHn
         NLPy1zZfAoWv/9WsPEdUAzYEKt5MnQNIWuCHsP+Fgwtxrn9AU0cq1XBb2NSJ0TfP57nN
         VwpwC6pdqQ9dXVj6SEvoMOaw522I0JZsjqIXb2TgWpIwDTztux0B5k2aTSe18QsOXEIN
         Y0N1czmWWyZZBkVpqh3R3Ak4T4L5Sw8m+SMgRZLKmnqP9S6AYJK/K0NukxqcGKC/ZQzu
         /v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hYar1LitKjoEfAl2JnfsMukPkQViOGYPpgjJSu1h+TM=;
        b=cVg7lFDT4mzF0WS/RF0+Kydguzkwe58TS7A2oWN/EhkPa8/QHiW5BwJYmSnJ71SVa8
         UhZsX7U/qGTEopTvnt9issPA86mnuIBakHV9g6DaUGo2SW+FCDvk5xxb7gyL49KqAiYf
         OAtNbpO5IQkbTF0FQVMFVF4WxI9y7CEunYB3M3F8NLV3Hmal7pgeUvSRRq9hKCeoot8f
         zx9tUYl8VLTZ7uIvphUl36QXWCwytFRReLB6aidI0LL9AQEdqFixw50JO07Fevba9Yv6
         q5D5nmpDzMS8fS+49YByautcCZT1FxhFI0Gg1zr0uliYvtRqXaUcA+5rzkXZWmQfGjrP
         U8nA==
X-Gm-Message-State: AOAM531QHc8lr516FNdYPKQh7da4F9gxhuIBMs0/lBXfuGIyzXMSDbtQ
	Vl27yhvLDjVPCP501+Qoe3y2oQ==
X-Google-Smtp-Source: ABdhPJxUjxPiwJYJj1sIpDisgVqN7cQXmd7pITV/Z1cf4mXtO0EuOQD8x+g08Pr5gSn9aAups+8MQg==
X-Received: by 2002:a2e:908b:: with SMTP id l11mr5465935ljg.299.1641977972598;
        Wed, 12 Jan 2022 00:59:32 -0800 (PST)
Received: from [192.168.1.213] (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.googlemail.com with ESMTPSA id r6sm1580774lfm.114.2022.01.12.00.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 00:59:32 -0800 (PST)
Subject: Re: [PATCH v2 1/1] phy: sun4i-usb: fix phy write on H3 and newer
To: Maxime Ripard <maxime@cerno.tech>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Yangtao Li <frank@allwinnertech.com>, Icenowy Zheng <icenowy@aosc.io>,
 andre.przywara@arm.com
References: <20220111165153.63632-1-boger@wirenboard.com>
 <20220111165153.63632-2-boger@wirenboard.com>
 <20220112084223.j5nm4ennfv7f6ekt@houat>
From: Evgeny Boger <boger@wirenboard.com>
Message-ID: <1e13f894-6900-15a8-66ea-f5e4d65bf822@wirenboard.com>
Date: Wed, 12 Jan 2022 11:59:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220112084223.j5nm4ennfv7f6ekt@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

Hi Maxime!
12.01.2022 11:42, Maxime Ripard пишет:
> Hi,
>
> On Tue, Jan 11, 2022 at 07:51:53PM +0300, Evgeny Boger wrote:
>> We noticed that USB hosts won't reliably enumerate USB HS (480Mb/s) devices
>> in our custom A40i-based design. What we observe is that after several
>> attempts USB device would fail to enumerate on EHCI port (HS) and will be
>> enumerated instead on OHCI (FS, 12Mb/s) only:
>>
>> [    6.368009] usb 1-1: new high-speed USB device number 5 using ehci-platform
>> [    6.818008] usb 1-1: device not accepting address 5, error -71
>> [    6.823868] usb usb1-port1: unable to enumerate USB device
>> [    7.308013] usb 3-1: new full-speed USB device number 2 using ohci-platform
>> [    7.575045] usb 3-1: not running at top speed; connect to a high speed hub
>>
>> On some boards one of the ports would work in high-speed mode, but
>> on most of the boards all three USB ports would only work in FS mode.
>>
>> At the same time, USB work flawlessly in high-speed mode in vendor kernel.
>>
>> Looking for the differences in USB code, we found the issue with USB PHY
>> register initialization. Basically, USB PHY driver sets a couple of
>> internal undocumented PHY registers to the predefined constants. These PHY
>> registers are accessed in a very (and I mean VERY) weird way by shifting
>> register addresses and values bit-by-bit. This access method was slightly
>> changed starting from H3 SoC, according to the BSP source for different
>> SoCs.
>>
>> As a result, mainline PHY driver won't set these PHY registers properly
>> resulting in unreliable enumeration in high-speed mode.
>>
>> We don't know whether this issue will result in broken HS mode on all
>> affected SoCs or instead the A40i is an unfortunate exception. What we
>> indeed verified, is that BSPs for all affected SoCs write these registers
>> properly while mainline kernel don't. We also were able to reproduce the
>> USB issue on a couple of A40i boards from other vendors, so we are pretty
>> sure these registers have to always be properly set, regardlress of
>> a hardware layout.
>>
>> The proposed patch is tested on A40i-based Wiren Board 7 building
>> automation controller. More details are below.
>>
>> On older SoCs (prior to H3) PHY register are accessed by manipulating
>> the common register for all PHYs. PHY index is specified by pulsing
>> usbc bit.
>>
>> Newer SoCs leave the access procedure mostly unchanged, the
>> difference being that the latch registers are separate for each PHY.
>>
>> Additionally, accessing USB PHY registers is only possible if phy0 is
>> routed to musb IP instead of HCI.
>>
>> Introduce phy_reg_access_v2 cfg flag for H3 (H2+, H5),
>> R40 (V40, A40i, T3), V3s (V3, S3) and A64 SoCs.
>>
>> On A83t, H6, H616, T507 and probably on more recent hardware,
>> these PHY registers are not used in vendor BSP.
>> So don't set v2 flag for these even newer SoCs as a precaution.
>>
>> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> This should probably be sent to stable, and have a Fixes tag?

well, phy register writes never worked on H3 SoC and newer, so there is 
no specific commit which broke it. So nothing to put to Fixes: tag.

I'm not sure it qualifies for stable too. Citing guidelines:

 >It must be obviously correct and tested

I was only able to test it on handful of A40i boards and on one A20 board

 >It must fix a real bug that bothers people

this bug for certain bothers *us*, but our users won't benefit from 
porting this fix to stable.
I didn't find reports on this bug from other people.
I think unfortunately not many people are using mainline kernel on these 
SoCs.


>
>> ---
>>   drivers/phy/allwinner/phy-sun4i-usb.c | 44 ++++++++++++++++++++++++---
>>   1 file changed, 39 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
>> index 788dd5cdbb7d..cf10e385f199 100644
>> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
>> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
>> @@ -119,6 +119,7 @@ struct sun4i_usb_phy_cfg {
>>   	bool dedicated_clocks;
>>   	bool enable_pmu_unk1;
>>   	bool phy0_dual_route;
>> +	bool phy_reg_access_v2;
>>   	int missing_phys;
>>   };
>>   
>> @@ -192,13 +193,38 @@ static void sun4i_usb_phy_write(struct sun4i_usb_phy *phy, u32 addr, u32 data,
>>   				int len)
>>   {
>>   	struct sun4i_usb_phy_data *phy_data = to_sun4i_usb_phy_data(phy);
>> -	u32 temp, usbc_bit = BIT(phy->index * 2);
>> +	u32 otgctl_val, temp, usbc_bit;
>>   	void __iomem *phyctl = phy_data->base + phy_data->cfg->phyctl_offset;
>> +	void __iomem *phyctl_latch;
>>   	unsigned long flags;
>>   	int i;
>>   
>>   	spin_lock_irqsave(&phy_data->reg_lock, flags);
>>   
>> +	/* On older SoCs (prior to H3) PHY register are accessed by manipulating the
>> +	 * common register for all PHYs. PHY index is specified by pulsing usbc bit.
>> +	 * Newer SoCs leave the access procedure mostly unchanged, the difference
>> +	 * being that the latch registers are separate for each PHY.
>> +	 */
> Multi-line comments need to start with an empty line
>
>> +	if (phy_data->cfg->phy_reg_access_v2) {
>> +		if (phy->index == 0)
>> +			phyctl_latch = phy_data->base + phy_data->cfg->phyctl_offset;
>> +		else
>> +			phyctl_latch = phy->pmu + phy_data->cfg->phyctl_offset;
>> +		usbc_bit = 1;
>> +
>> +		/* Accessing USB PHY registers is only possible if phy0 is routed to musb.
>> +		 * As it's not clear whether is this related to actual PHY
>> +		 * routing or rather the hardware is just reusing the same bit,
>> +		 * don't check phy0_dual_route here.
>> +		 */
> Ditto
>
> Thanks!
> Maxime


-- 
С уважением,
     Евгений Богер / Evgeny Boger
     CTO, Wiren Board Team
     https://wirenboard.com/ru
     +7 495 150 66 19 (# 33)

