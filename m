Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34D370
	for <linux-sunxi@lists.linux.dev>; Wed, 30 Jun 2021 07:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=waD0X
	OGzYVlXCqgQjmoijjU1B5+WcDju/rUDU+04b9s=; b=Ft+5u959VrVOpVI4wKmSC
	dzYDeu0WJwPVj0P+l+bBDPRp+97xGtKU9gf3QFCpL4e0kMaN+9IP5ojtPTRM9nBH
	IAzpxIBIAPhvBkkGtCTbFfNE6kx7FBhfcQlVsr31PMsZYd4nhHaB84K8Qu4OoVpk
	4djoTbDuxWBB4OPOHE/Grk=
Received: from [192.168.3.109] (unknown [218.201.129.20])
	by smtp11 (Coremail) with SMTP id D8CowABXZo7fE9xgx59nAA--.29S2;
	Wed, 30 Jun 2021 14:49:12 +0800 (CST)
Subject: Re: [PATCH 1/4] phy-sun4i-usb: Fix sun8i_r40_cfg
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Icenowy Zheng <icenowy@aosc.io>,
 Chen-Yu Tsai <wens@csie.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
References: <20210616023326.18135-1-qianfanguijin@163.com>
 <20210621013356.7ad01d6a@slackpad.fritz.box>
From: qianfan <qianfanguijin@163.com>
Message-ID: <4fd361e7-89a0-712d-e8f1-56955ae04680@163.com>
Date: Wed, 30 Jun 2021 14:48:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210621013356.7ad01d6a@slackpad.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:D8CowABXZo7fE9xgx59nAA--.29S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWUWryrCr17Ar1UAF4DXFb_yoW5XFyxpF
	WrKFy2krsYgFWag392qF4DJryUXa1kWryjyrWDt343XFnxGas2vFW8Kws0gFZY9r1fAa12
	qan0qFyfuF1DAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9ID7UUUUU=
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXAjB7VXl0IdT4gAAsu


在 2021/6/21 8:33, Andre Przywara 写道:
> On Wed, 16 Jun 2021 10:33:23 +0800
> qianfanguijin@163.com (qianfanguijin@163.com) wrote:
>
> Hi,
>
> first many thanks for sending this! Indeed OTG support was
> broken/missing on the R40, also in Linux.
> So it seems you have the found the problem: the missing PHY multiplex.
> Many thanks for that! This indeed enables OTG functionality for me
> (although with some changes). That means that actually a similar patch
> needs to go through Linux.
> Do you plan on enabling support in Linux as well?
sure.
>> From: qianfan Zhao <qianfanguijin@163.com>
>>
>> The address of sun8i_r40's phyctrl is 0x01c13404,
> But this isn't quite right, is it? See below.

Yes, the right address of R40 is 0x01c13410. I had checked the bsp code 
of allwinner: #if defined (CONFIG_ARCH_SUN50I) || defined 
(CONFIG_ARCH_SUN8IW10) || defined (CONFIG_ARCH_SUN8IW11)#define  
USBPHYC_REG_o_PHYCTL            0x0410#else#define  
USBPHYC_REG_o_PHYCTL            0x0404#endif

But I had no idea why the addres 0x01c13404 can work fine, maybe I load u-boot by using
sunxi-tools, that the usb otg is already init by IBR.

>> enable_pmu and dual_route.
> Ah, of course! The R40 is closer to the A33/A23 here, with not having
> separate EHCI0/OHCI0 controllers, instead relying on the MUSB host IP.
> So indeed we don't have the PHY multiplex for PHY0.
> I think this is the root cause of the non-working OTG support so far!
>
>> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>> ---
>>   drivers/phy/allwinner/phy-sun4i-usb.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
>> index 5723c98032..608ba46242 100644
>> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
>> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
>> @@ -587,10 +587,10 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
>>   	.num_phys = 3,
>>   	.type = sun8i_r40_phy,
>>   	.disc_thresh = 3,
>> -	.phyctl_offset = REG_PHYCTL_A33,
>> +	.phyctl_offset = REG_PHYCTL_A10,
> So this doesn't work for me, no device appearing on the host. Also
> writing anything to this register (+0x04) reads back as 0, so it's not
> implemented, as in the H3. The register at +0x10 however works, and if I
> keep the A33 line, OTG indeed works for me. Same in Linux, btw.
>
>>   	.dedicated_clocks = true,
>> -	.enable_pmu_unk1 = true,
>> -	.phy0_dual_route = true,
>> +	.enable_pmu_unk1 = false,
>> +	.phy0_dual_route = false,
> If they are false, you don't need to list them, the default of 0 will
> take care of this.

Thanks for yours guide, I will make a change later.

>
> Cheers,
> Andre
>
>>   };
>>   
>>   static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {

