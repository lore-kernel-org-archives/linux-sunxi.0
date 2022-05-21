Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C19290C
	for <linux-sunxi@lists.linux.dev>; Sat, 21 May 2022 11:10:31 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id p22so18157965lfo.10
        for <linux-sunxi@lists.linux.dev>; Sat, 21 May 2022 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Xqs6YalYM/kNVrXG6osA8oyceYVKDzeo65YCCK/3l9g=;
        b=mj9BhqTSoYRQOMpfY3xrHR1CAdK7oXyc/d/CHN9V196CT6I3GKWesOrdpv7vpjewcj
         Hns8zTN5aHbBex299iCJZLioczKpCpgY4iYn8SExl4Ud269BQW1SfXM4epNO2FQXFmOU
         PZAIq64XOxX+bn3OURD/M6lymXfdoIRHpwvmhVwyacgLe5weG9omzuDkyu4EO+Rfm/78
         sJREgrfKdXOqo4ZkdZddQ18V0QQzncdc54M3CHmJRvNzTTgYyfTvbFbdtonL6Ywy1vSK
         dAAHVpj3I21t2p8C3Q6wBdRuJPYnZaIfi6pH77si3ohvp6jbfZ/I/la/KbTAYwqQJVQk
         LhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xqs6YalYM/kNVrXG6osA8oyceYVKDzeo65YCCK/3l9g=;
        b=g/C3pK7ACYCd8XB8rTZCOqMACt5bqKPSDhFWfiiB40DGT7jzbaE2HkzUZpWWjv4qWp
         zDvXC9yLsM8olJgcnDM43eqReJvASKpDaoK/7SlBvlu5yCyXoddjmLIZeTUsmd11Sqqd
         4NJGJP2RfSOGEkrYCXr1QqHfmKXAxOp182C6NUfVrnQbQohhNdK60KBBvFGHXgkbuiMf
         cFJgxS0ZWmbW479nMuZ0eSnZ1X3kGwazaH3ZFEGlq4EbTxKdk3yyKsqGno1WuwSo93m3
         oXdPF4yAHlYDqO0lpoHDAkTGHECfU9UdAZKD6rF30CBaz7s2whyBgPnFytZknAn10K8F
         82rg==
X-Gm-Message-State: AOAM533jxPUsqlMMumphwH+2ku37bynHTnoT75fEe3bZh3M/Fg7avWbr
	6JdKzk+noQ/RSBTVJaxt2EQIKw==
X-Google-Smtp-Source: ABdhPJy6SkyZ59wlAQLT8eiNrpq3N/c796d8ejEmHOPq5HL32Hsz14BhU927QwnR8drIMEjP9AeEQA==
X-Received: by 2002:a05:6512:13a9:b0:448:9dd3:b84 with SMTP id p41-20020a05651213a900b004489dd30b84mr9864847lfa.556.1653131429762;
        Sat, 21 May 2022 04:10:29 -0700 (PDT)
Received: from [192.168.1.21] ([78.109.71.116])
        by smtp.googlemail.com with ESMTPSA id o24-20020a056512051800b0047255d21201sm1013555lfb.304.2022.05.21.04.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 04:10:27 -0700 (PDT)
Message-ID: <21a659db-f64c-fbea-b3e7-ccc27aec29a0@wirenboard.com>
Date: Sat, 21 May 2022 14:10:25 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 0/2] ARM: sun8i-r40: Enable usb otg support
Content-Language: en-GB
To: qianfan <qianfanguijin@163.com>
Cc: andre.przywara@arm.com, devicetree@vger.kernel.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, robh+dt@kernel.org, samuel@sholland.org,
 wens@csie.org
References: <264cb004-677a-13df-cc68-676ef3c2e7d8@163.com>
 <ec5f7fe8-d47d-ce7f-0e0a-2bdf41a88ba2@wirenboard.com>
 <0936de49-a349-8fd4-2598-2a8995b01c86@163.com>
From: Evgeny Boger <boger@wirenboard.com>
In-Reply-To: <0936de49-a349-8fd4-2598-2a8995b01c86@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

my point is not that your patch is good enough.

My point is that it would be very difficult to maintain backward 
compatibility with this device tree once proper driver support is 
implemented.


On 5/21/22 07:26, qianfan wrote:
>
>
> 在 2022/5/20 4:54, Evgeny Boger 写道:
>> Hi qianfan,
>>
>> As Allwinner A40i user, let me first thank you for your effort for 
>> making better upstream support for R40!
>>
>> However, I would strongly suggest *not* to add USB support to one 
>> more Allwinner SoC in this particular way.
>> The problem is, this approach consists of a number of carefully 
>> crafted hacks in device tree to make current drivers work on 
>> Allwinner hardware without modification to the drivers.
>>
>> a few examples:
>>
>> 1) please notice how ohci0 and ehci0 nodes do not contain reference 
>> to usb phy. It is done intentionally, otherwise EHCI will reset musb 
>> mode.
>> Of course omitting phy reference here is also completely breaking 
>> power cycling in case of usb error and otherwise messes with a power 
>> management.
>>
>> 2) one must always enable ohci, ehci and usb_otg nodes at the same 
>> time. If one forgets to enable ohci/ehci nodes while enabling usb_otg 
>> node, the system will silently fail to work as USB host.
>>
>> 3) For host-only mode we still have to enable usb_otg node despite no 
>> role switching is needed. That's because phy reference is missing in 
>> ehci/ohci, so the ehci/ohci driver won't enable the PHY.
>> Also I might be wrong, but I think phy won't be routed to ehci/ohci 
>> controllers is this case.
>>
>> 4) musb host controller is initialized and present to hardware though 
>> never actually used
>>
>> To summarize, not only the resulting device tree is not describing 
>> the hardware properly, it is creating device tree configuration which 
>> will be very hard to support in future, once proper driver support is 
>> in place.
> PHY setting is did in MUSB driver, so we need enable MUSB regardless 
> of host mode.
>
> I know your's point, OHCI/EHCI need do more works to init USBPHY, it 
> shoule be able to work
> in dependently, but I don't have the ability to deal with these things 
> right now, I need
> learn more things about OHCI/EHCI, that's a long-term goal.
>
> So now I need to make the whole usb work and do some tests as much as 
> possible,
> hoping to merge this patch into master. Some other optimizations can 
> be made later.
>
> Thanks for yours guide.
>>
>>
>> At Wiren Board kernel tree we tried to untangle this issue [1-6]. 
>> Unfortunately I didn't have time to prepare it for kernel submission 
>> yet, but I think I better submit it as RFC to get a feedback from you 
>> and others.
>>
>>
>> [1] 
>> https://github.com/wirenboard/linux/commit/359abbbd86ddff4d3c61179c882c286de32bb089
>> [2] 
>> https://github.com/wirenboard/linux/commit/6327f9d7972c21b229fb83457fdde643b31553f9
>> [3] 
>> https://github.com/wirenboard/linux/commit/f01f4c66758bde460a4d8c5b54ecee3b585c0232
>> [4] 
>> https://github.com/wirenboard/linux/commit/c27598ad601e5a46f624b73412a531d6f1f63d37
>> [5] 
>> https://github.com/wirenboard/linux/commit/5796d6eebb86b32a3751b2038b63af46f94954b3
>> [6] 
>> https://github.com/wirenboard/linux/commit/0928a675d875f9c2849fd3a9888f718bbb673bda
>>
>>
>


-- 
Kind regards,
Evgeny Boger
CTO @ Wiren Board
+49 3046690053
https://wirenboard.com/

