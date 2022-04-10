Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEADDEA9
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Apr 2022 06:18:42 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id o16so10500826ljp.3
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Apr 2022 23:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z1jw+y9o5uE0VLHN3bcJI3UpsQI6FGnX4PanajaN3C0=;
        b=OWbKo9ckcZYS5XByRR3lH+LoZ962C75yEOUSwiI5mCU7COTX9qEbBAOg4vahn5yB9U
         M4F1kxRiCtmL/heP3YXrKjBeH7TBMek6MBHqJfsR2FIvV/G5qd5QXz84+Szm5zySZz5S
         TDYUL2Tv0/o0d+Dwd9YmG+rZvlyxV7itJGL5LgygvZ/CxGzCzgbe2k++09s7UfrZc7UO
         3sColQ3vyk4eywzonTIGNTDAayKwMPqmOZtZKEsuQRVBirYqwU2IBHXsDKi9YlptiLHW
         9C0szBfj0DJT2HpXUGbocEWkzIPWolh9D2RoQwWRG/tvWOrZMDtbuTvHYX2LYIZqxwth
         +syQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z1jw+y9o5uE0VLHN3bcJI3UpsQI6FGnX4PanajaN3C0=;
        b=FxT6r2TR+5wFpMPti0pFKy4HcO76D6ipd67lgO55UhF3nd8nXbZCnnqQqELK41BBz2
         W+aulyVL7I7jkE6z2WKAJCvq1nBBE1GGxRxJL1LnF9OYTF24PdnOxH4k3mwMJg70VgED
         l1W8HWOFaTdvjn13NRav928ERepdS9RiEMiPZtA24a4evYe8E4DCLj0CMz8ROnpIS3Lt
         IQUXWW6VI9sMGTXjR9+PwR7AMP94DTdsmu28WDvjA+Ybm7lhXe0zkAytx/Y8xwaBQxrE
         MWLmbf8au9TblJGIz/44MF7HGOGPWM2iX4K/tcC8DoSKIYrDeJnfZX5OrAlG2Dcb5gdJ
         bbFw==
X-Gm-Message-State: AOAM531s9Gfg3LcbElBdl42jTnTVazbm88LDT8aGfymw+Vy7D853hS5V
	Zuwp5xdnfObWhdVLgbSVG7Tmjg==
X-Google-Smtp-Source: ABdhPJxCKemgfOxwfgevDo9mP5PdcXwctr8cglAX4J9JiuUo5L+pkiKT7Om1qbCcS5Y72CoL324bXg==
X-Received: by 2002:a05:651c:a07:b0:24b:6102:ed0a with SMTP id k7-20020a05651c0a0700b0024b6102ed0amr496510ljq.468.1649571520696;
        Sat, 09 Apr 2022 23:18:40 -0700 (PDT)
Received: from [192.168.1.21] ([78.109.70.66])
        by smtp.googlemail.com with ESMTPSA id i26-20020a196d1a000000b0046b8e060c9csm461430lfc.188.2022.04.09.23.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 23:18:40 -0700 (PDT)
Message-ID: <f3394694-31ce-fe22-48b8-cf999509b9d3@wirenboard.com>
Date: Sun, 10 Apr 2022 09:18:38 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/1] phy: sun4i-usb: fix phy write on H3 and newer
Content-Language: en-GB
To: Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>,
 linux-sunxi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Yangtao Li <frank@allwinnertech.com>, andre.przywara@arm.com
References: <20220111165153.63632-1-boger@wirenboard.com>
 <20220111165153.63632-2-boger@wirenboard.com>
 <683de674-2613-a96e-2831-7e3172c0f9e2@sholland.org>
 <12624AAD-9989-412B-B7EB-5C73562E804E@aosc.io>
From: Evgeny Boger <boger@wirenboard.com>
In-Reply-To: <12624AAD-9989-412B-B7EB-5C73562E804E@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

10.04.2022 07:36, Icenowy Zheng пишет:
>
> 于 2022年4月10日 GMT+08:00 下午12:28:25, Samuel Holland <samuel@sholland.org> 写到:
>> On 1/11/22 10:51 AM, Evgeny Boger wrote:
>>> We noticed that USB hosts won't reliably enumerate USB HS (480Mb/s) devices
>>> in our custom A40i-based design. What we observe is that after several
>>> attempts USB device would fail to enumerate on EHCI port (HS) and will be
>>> enumerated instead on OHCI (FS, 12Mb/s) only:
>>>
>>> [    6.368009] usb 1-1: new high-speed USB device number 5 using ehci-platform
>>> [    6.818008] usb 1-1: device not accepting address 5, error -71
>>> [    6.823868] usb usb1-port1: unable to enumerate USB device
>>> [    7.308013] usb 3-1: new full-speed USB device number 2 using ohci-platform
>>> [    7.575045] usb 3-1: not running at top speed; connect to a high speed hub
>>>
>>> On some boards one of the ports would work in high-speed mode, but
>>> on most of the boards all three USB ports would only work in FS mode.
>>>
>>> At the same time, USB work flawlessly in high-speed mode in vendor kernel.
>>>
>>> Looking for the differences in USB code, we found the issue with USB PHY
>>> register initialization. Basically, USB PHY driver sets a couple of
>>> internal undocumented PHY registers to the predefined constants. These PHY
>>> registers are accessed in a very (and I mean VERY) weird way by shifting
>>> register addresses and values bit-by-bit. This access method was slightly
>>> changed starting from H3 SoC, according to the BSP source for different
>>> SoCs.
>>>
>>> As a result, mainline PHY driver won't set these PHY registers properly
>>> resulting in unreliable enumeration in high-speed mode.
>>>
>>> We don't know whether this issue will result in broken HS mode on all
>>> affected SoCs or instead the A40i is an unfortunate exception. What we
>>> indeed verified, is that BSPs for all affected SoCs write these registers
>>> properly while mainline kernel don't. We also were able to reproduce the
>>> USB issue on a couple of A40i boards from other vendors, so we are pretty
>>> sure these registers have to always be properly set, regardlress of
>> typo: regardless
>>
>>> a hardware layout.
>>>
>>> The proposed patch is tested on A40i-based Wiren Board 7 building
>>> automation controller. More details are below.
>>>
>>> On older SoCs (prior to H3) PHY register are accessed by manipulating
>>> the common register for all PHYs. PHY index is specified by pulsing
>>> usbc bit.
>>>
>>> Newer SoCs leave the access procedure mostly unchanged, the
>>> difference being that the latch registers are separate for each PHY.
>>>
>>> Additionally, accessing USB PHY registers is only possible if phy0 is
>>> routed to musb IP instead of HCI.
>>>
>>> Introduce phy_reg_access_v2 cfg flag for H3 (H2+, H5),
>>> R40 (V40, A40i, T3), V3s (V3, S3) and A64 SoCs.
>>>
>>> On A83t, H6, H616, T507 and probably on more recent hardware,
>>> these PHY registers are not used in vendor BSP.
>>> So don't set v2 flag for these even newer SoCs as a precaution.
>>>
>>> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
>> Tested-by: Samuel Holland <samuel@sholland.org> # A40i, H3
>>
>> I tested this patch on a Banana Pi M2 Berry (A40i) board. My board did not have
>> any USB reliability problems without this patch, but the patch didn't break
>> anything either. So since it fixes USB for you, the patch looks like a net
>> improvement.
>  From my memory, R40 OTG used to be broken.
>
> I may check whether this is fixed by this patch when I am back home (I am
> trapped in Shanghai because of COVID now).
Hi Icenowy,

I don't think OTG being broken has something to do with this patch.

Actually, on R40 USB OTG is implemented in the same way as on many other 
Allwinner SoCs: there are both HCI and OTG controllers for the first USB 
port and
there is a PHY which can route signals to either one.

Vendor kernel reroute signals to HCI controller whenever a host role is 
activated. The mainline kernel does the same, albeit in a very obscure way.

So enabling OTG on R40 is just a matter of adding a few lines to dtsi 
and, preferably, making a few modifications to phy code.

Could you please test OTG using our kernel tree: 
https://github.com/wirenboard/linux ?

There a few patches there waiting for being submitted which make it work.


>
>> And with Maxime's comments resolved:
>>
>> Reviewed-by: Samuel Holland <samuel@sholland.org>
>>


