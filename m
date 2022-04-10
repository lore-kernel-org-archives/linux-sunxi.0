Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3F8EA9
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Apr 2022 06:08:30 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id h14so16296080lfl.2
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Apr 2022 23:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=c3MdJ5iupkVMXAqRVaBAqrrFAt4QhmkZA9+wTP0+R7M=;
        b=xy0CJ0xBn8naVnLlKM3/vCLpPLlSJet/Q2KSwpo8N+Sihg5QqK4psWrYrJzNVPJREM
         QjHX/NcIC9BMbilQJwA8lmrMB3z6GUMVYZmXlO14wf3eJZkMkcWShbYXhwK1Dt17GbRY
         Ywa3ZUpDE/cXvcvAvZv0SA9vUSO0QVVvUAMQGdW+HTTz/MAcBgdv2IzSsNDUrFSkh4FI
         PEwLtSnCbzJ6NEkKui1busjT53axQEhw8mLGcQ98hKZYAUMpYKaPR9iEWcMIEo7FdUW9
         X0N75I5MMs8+IzXzKL1g4lHJqfgcK2KgQaGQKqfFpCXznUuGoEIk7zroi9uDIKGzzxzr
         jdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c3MdJ5iupkVMXAqRVaBAqrrFAt4QhmkZA9+wTP0+R7M=;
        b=IJ+WMledprMEkAB5vZsjNrLQTHHmwLo5GdOiEvKD/FGOQsALceGxLKdxWh6Vw9KSp8
         f4z7O1FazmfZsr6z+Iq2keiZjH/dSl41R/YDEVNziQuszNqNpWRffKVeiOS3UJ8AoXil
         Swvi9LoCJancgvcdloUcxDXLMgb8IjlZo5LI5ug/Feo90DuIDpFdik9XV4GgKtgj+n5Z
         QpIk68fNhMsXv2OXtFaodWehl/k7S4AeZNSQlW3JK5zZOQ5mN3qRY6T3VyZJphs6USrO
         s8o1L43SOPevXRkyxa3MHyO53PUNIOwJKes+gtveEQzUOHPsZ94N85wIJwoyejjIzarL
         7Brw==
X-Gm-Message-State: AOAM530eBXmRmXKbNiVZQeEzCyxLERzR8o/KidqPJ5gZ6UAAi4OOynkU
	3kwruol2qLmWk/cTo9bj42Mz1g==
X-Google-Smtp-Source: ABdhPJyr8q/hts1A7kFYX1lsRNhk/vaIlZUSvxc/NF7olg1pEUs+kBwtqJx2Pf9BFRUE4UFNbo5MIw==
X-Received: by 2002:ac2:57cf:0:b0:439:94e:7c4a with SMTP id k15-20020ac257cf000000b00439094e7c4amr17232736lfo.23.1649570908427;
        Sat, 09 Apr 2022 23:08:28 -0700 (PDT)
Received: from [192.168.1.21] ([78.109.70.66])
        by smtp.googlemail.com with ESMTPSA id x17-20020a2e9c91000000b0024b43e349adsm1003085lji.77.2022.04.09.23.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 23:08:27 -0700 (PDT)
Message-ID: <1e75d401-a652-46d8-d10a-bff9215241e7@wirenboard.com>
Date: Sun, 10 Apr 2022 09:08:25 +0300
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
To: Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Yangtao Li <frank@allwinnertech.com>, Icenowy Zheng <icenowy@aosc.io>,
 andre.przywara@arm.com
References: <20220111165153.63632-1-boger@wirenboard.com>
 <20220111165153.63632-2-boger@wirenboard.com>
 <683de674-2613-a96e-2831-7e3172c0f9e2@sholland.org>
From: Evgeny Boger <boger@wirenboard.com>
In-Reply-To: <683de674-2613-a96e-2831-7e3172c0f9e2@sholland.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> On 1/11/22 10:51 AM, Evgeny Boger wrote:
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
> typo: regardless
>
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
> Tested-by: Samuel Holland <samuel@sholland.org> # A40i, H3
>
> I tested this patch on a Banana Pi M2 Berry (A40i) board. My board did not have
> any USB reliability problems without this patch, but the patch didn't break
> anything either. So since it fixes USB for you, the patch looks like a net
> improvement.
Samuel, thank you for testing this!
>
> And with Maxime's comments resolved:
>
> Reviewed-by: Samuel Holland <samuel@sholland.org>

