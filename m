Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA987F
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 02:02:41 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id m3-20020a4ac683000000b0035f13dde9ccso117420ooq.6
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 19:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=GKaIcGp0RhRVxVeOdR17/W0HUq1CPb0cE7q5ZqqYxaM=;
        b=hkKItu6aecIhk/NoClNIjIXfNHvcfpFH3nuqsFRGYrP3YdsirumZ2LzJ9PNh7NVIGZ
         VOoIIumKjYVnqK4QXH2epsyXRaDaciIfoH3u/+6O/IkrjlvtLowF5cV8G+7az/aDjXBc
         v2pXcxkJjDUBdgM9V6HSQRZPiBZK0damBwQTohOvHM1k0pKMATy5/B+bpT4NjnGcz8+i
         BinW7941XVl1w9G+BMfWoWwrUWINPDYO5KfEn1IFsQMQaXGRyL4vl/PjunXgT7Dru+0L
         KmBFKsdN5OJ+encck6pPFGutZuvGmDhxFmdVd3B/WpCDIjoQISSRJKmvRmxZ20GJ9Cx/
         4Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=GKaIcGp0RhRVxVeOdR17/W0HUq1CPb0cE7q5ZqqYxaM=;
        b=IHkoMKGdlsLZc9A/FZjNS267BeXs1I9Z31QUuwwohvVEb7wzEY2Rilgncf6HRao25g
         s/+UWyI/10fRjR5IWh0iq8Up2FjxAgePrKMMfLMVii6MNRwe8ZMHUjB07mn788jNs2FR
         LKHaL+H0/mMCXV+5fauG3B4VQEjDOr0c7vui72mRukhjciKviDMMsVvX0T7i491nv117
         nAEVeYfEu9aj8xYFoEKDAMzTXEbvfGCFKg5y2gIwelPb6Lr/CJIZVLTcs8vE8np6j2Fx
         nl3xlfiM0S2RHW6Z4X8hA6wm/Bsy+hSpC4zvev8DTzh1l73qK8ny3oaJ5bjR5oNhOh4t
         BHMA==
X-Gm-Message-State: AOAM531NMxZSviChRPUN48+BKcg+hjSVS6NFUQglfdQqq2ITvEjr/BbJ
	ZF4VbQpuPDlAOZRpF5sb7Ds=
X-Google-Smtp-Source: ABdhPJxaK6/fEsYQoxwG2euqp3NppH7nBXY7mGfszjaFfrhxufHTKgE1HNVh1sbsvF4hLjdsisEEmA==
X-Received: by 2002:a4a:2cd3:0:b0:35e:99e3:a497 with SMTP id o202-20020a4a2cd3000000b0035e99e3a497mr5071598ooo.86.1651543360153;
        Mon, 02 May 2022 19:02:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 95-20020a9d0668000000b0060626a8e5a4sm1090211otn.74.2022.05.02.19.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 19:02:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4aabfd63-18e2-65c5-d1c2-d7600afc1c40@roeck-us.net>
Date: Mon, 2 May 2022 19:02:36 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Icenowy Zheng <icenowy@aosc.io>
Cc: Ruslan Zalata <rz@fabmicro.ru>, Jean Delvare <jdelvare@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20220428210906.29527-1-rz@fabmicro.ru>
 <20220502110010.q7vvdkdpaiz5acjl@houat>
 <7433B295-D896-4BF8-87DF-87EB89D7A550@aosc.io>
 <20220502112112.3ne7zy4b6gggxzoo@houat>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] hwmon: (sun4i-lradc) Add driver for LRADC found on
 Allwinner A13/A20 SoC
In-Reply-To: <20220502112112.3ne7zy4b6gggxzoo@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/2/22 04:21, Maxime Ripard wrote:
> On Mon, May 02, 2022 at 07:15:01PM +0800, Icenowy Zheng wrote:
>>
>>
>> 于 2022年5月2日 GMT+08:00 下午7:00:10, Maxime Ripard <maxime@cerno.tech> 写到:
>>> Hi,
>>>
>>> On Thu, Apr 28, 2022 at 09:09:03PM +0000, Ruslan Zalata wrote:
>>>> Some Allwinner SoCs like A13, A20 or T2 are equipped with two-channel
>>>> low rate (6 bit) ADC that is often used for extra keys. There's a driver
>>>> for that already implementing standard input device, but it has these
>>>> limitations: 1) it cannot be used for general ADC data equisition, and
>>>> 2) it uses only one LRADC channel of two available.
>>>>
>>>> This driver provides basic hwmon interface to both channels of LRADC on
>>>> such Allwinner SoCs.
>>>>
>>>> Signed-off-by: Ruslan Zalata <rz@fabmicro.ru>
>>>> ---
>>>>   MAINTAINERS                       |   6 +
>>>>   drivers/hwmon/Kconfig             |  13 ++
>>>>   drivers/hwmon/Makefile            |   1 +
>>>>   drivers/hwmon/sun4i-lradc-hwmon.c | 280 ++++++++++++++++++++++++++++++
>>>>   4 files changed, 300 insertions(+)
>>>>   create mode 100644 drivers/hwmon/sun4i-lradc-hwmon.c
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 5e8c2f61176..d9c71e94133 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -18861,6 +18861,12 @@ S:	Maintained
>>>>   F:	Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
>>>>   F:	drivers/input/keyboard/sun4i-lradc-keys.c
>>>>   
>>>> +SUN4I LOW RES ADC HWMON DRIVER
>>>> +M:	Ruslan Zalata <rz@fabmicro.ru>
>>>> +L:	linux-hwmon@vger.kernel.org
>>>> +S:	Maintained
>>>> +F:	drivers/hwmon/sun4i-lradc-hwmon.c
>>>> +
>>>>   SUNDANCE NETWORK DRIVER
>>>>   M:	Denis Kirjanov <kda@linux-powerpc.org>
>>>>   L:	netdev@vger.kernel.org
>>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>>> index 68a8a27ab3b..86776488a81 100644
>>>> --- a/drivers/hwmon/Kconfig
>>>> +++ b/drivers/hwmon/Kconfig
>>>> @@ -1691,6 +1691,19 @@ config SENSORS_SIS5595
>>>>   	  This driver can also be built as a module. If so, the module
>>>>   	  will be called sis5595.
>>>>   
>>>> +config SENSORS_SUN4I_LRADC
>>>> +	tristate "Allwinner A13/A20 LRADC hwmon"
>>>> +	depends on ARCH_SUNXI && !KEYBOARD_SUN4I_LRADC
>>>> +	help
>>>> +	  Say y here to support the LRADC found in Allwinner A13/A20 SoCs.
>>>> +	  Both channels are supported.
>>>> +
>>>> +	  This driver can also be built as module. If so, the module
>>>> +	  will be called sun4i-lradc-hwmon.
>>>> +
>>>> +	  This option is not compatible with KEYBOARD_SUN4I_LRADC, one
>>>> +	  of these must be used at a time.
>>>
>>> How do you plan on enforcing that?
>>>
>>> I guess a better path forward would be to either register an hwmon
>>> device in the original driver, or convert that driver to iio and use
>>> iio-hwmon.
>>
>> I think this driver should be use IIO, and then try to probe an IIO input
>> if possible.
> 
> It's been a while, but if I remember well we couldn't use IIO for that
> driver because it's not generating interrupts all the time but only when
> it goes over a given threshold:
> 
> https://lore.kernel.org/all/52C5E9F1.9010700@redhat.com/
> 
> I'm not sure if it's still relevant, so we might just need to add an
> hwmon driver to the existing driver
> 

So now we have conflicting claims that the hwmon driver would need
to implement continuous interrupts because the chip otherwise doesn't
continuously measure ADC input, and that implementing an IIO driver
isn't possible or doesn't make sense because the chip would not support
generating continuous interrupts. Which one is it ? Am I missing something ?

Guenter
