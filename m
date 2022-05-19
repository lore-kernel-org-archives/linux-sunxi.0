Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06FA2F48
	for <linux-sunxi@lists.linux.dev>; Thu, 19 May 2022 20:55:01 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id q130so7596027ljb.5
        for <linux-sunxi@lists.linux.dev>; Thu, 19 May 2022 13:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:references:subject
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=ykepN6VoLxDb519/zdl3hvscRGddEy2w8xlt6V9kG3g=;
        b=dMve2Rz5oX6qOdwprOe+DoCzTq+YEQgYj9e3Sh1Z7OES+6dVVGzh4jbb1En18wQf53
         BRuJEShG3rUzrDiN0HAe++6iYSFPX18sMPZOvOOe514v+5sUFDVWbpKXg5MCtJayT8RT
         Df1IFuZ8IS14Cfe+ACIGnu3YSIoy9KnnNa3ZnoEhn74qPGXqYmyGShnSBPrJt1Fe3jIN
         JIw84UwlxBWYR5H8fmXUl1nOqYHVxJ2M+ch/sIESxn7sWsCvU+1hVsE4Jn8CrdDEcr9+
         YGO4Xd8u+Zg1w/u6ng06m2B0oZHMhxgSiDkIuB7XXFJ1ZBYrESyxHHF2KMuMj8GhNJiv
         OHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :references:subject:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=ykepN6VoLxDb519/zdl3hvscRGddEy2w8xlt6V9kG3g=;
        b=eyu7ScEuLZONQlxIrIkg6OwRsXDhRNdm8rNgN62Y6ogjjWenllGJ2+OGV0bkjBbPZw
         nnSBSiLYU5fL75sWBzyCIXfFgoz12hVe1OIGx7IcxPZMdc+Bvnh7uj0R8r6IyPiYvPcn
         uNAFrXL8Q0b9mbfEiyRFZ3xu27s71a62D4G6kKa0NmKAEKmUNJ0HX4MHrGS8PRGtM1R8
         2ohsgi9TU6Xkpf63CHrkzYOWAcjTXJwGcJRsYj6sYmCHUQPkpzPlXQ6aj/OjHs7MKpy/
         HX9aiARQs2FtygJsYIJ9G3QZ56sbLuoVnogWXN0nsJfAxptXcObiuI5IiAs/UnuRiqHR
         Re+g==
X-Gm-Message-State: AOAM530pLWEROLmNeBo8PhWsrfdyG/8bNin0oyLEGqdP+kWEt5w0xqcF
	QVCNsy4nAdYpMsIAVUn6ATF+TA==
X-Google-Smtp-Source: ABdhPJxDVsDoZQ3rFb716+iXoB+BWGYPfwVUdvxncdPn1zWF/QEbWLsi0SxLUsOS7u5CqmXAXGPpDQ==
X-Received: by 2002:a05:651c:2124:b0:250:5b55:8147 with SMTP id a36-20020a05651c212400b002505b558147mr3612417ljq.439.1652993699699;
        Thu, 19 May 2022 13:54:59 -0700 (PDT)
Received: from [192.168.1.21] ([78.109.71.116])
        by smtp.googlemail.com with ESMTPSA id x14-20020a2e7c0e000000b00253d654b2desm37550ljc.91.2022.05.19.13.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 13:54:58 -0700 (PDT)
Message-ID: <ec5f7fe8-d47d-ce7f-0e0a-2bdf41a88ba2@wirenboard.com>
Date: Thu, 19 May 2022 23:54:57 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
To: qianfanguijin@163.com
Cc: andre.przywara@arm.com, boger@wirenboard.com, devicetree@vger.kernel.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, robh+dt@kernel.org, samuel@sholland.org,
 wens@csie.org
References: <264cb004-677a-13df-cc68-676ef3c2e7d8@163.com>
Subject: Re: [PATCH v4 0/2] ARM: sun8i-r40: Enable usb otg support
Content-Language: en-GB
From: Evgeny Boger <boger@wirenboard.com>
In-Reply-To: <264cb004-677a-13df-cc68-676ef3c2e7d8@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi qianfan,

As Allwinner A40i user, let me first thank you for your effort for 
making better upstream support for R40!

However, I would strongly suggest *not* to add USB support to one more 
Allwinner SoC in this particular way.
The problem is, this approach consists of a number of carefully crafted 
hacks in device tree to make current drivers work on Allwinner hardware 
without modification to the drivers.

a few examples:

1) please notice how ohci0 and ehci0 nodes do not contain reference to 
usb phy. It is done intentionally, otherwise EHCI will reset musb mode.
Of course omitting phy reference here is also completely breaking power 
cycling in case of usb error and otherwise messes with a power management.

2) one must always enable ohci, ehci and usb_otg nodes at the same time. 
If one forgets to enable ohci/ehci nodes while enabling usb_otg node, 
the system will silently fail to work as USB host.

3) For host-only mode we still have to enable usb_otg node despite no 
role switching is needed. That's because phy reference is missing in 
ehci/ohci, so the ehci/ohci driver won't enable the PHY.
Also I might be wrong, but I think phy won't be routed to ehci/ohci 
controllers is this case.

4) musb host controller is initialized and present to hardware though 
never actually used

To summarize, not only the resulting device tree is not describing the 
hardware properly, it is creating device tree configuration which will 
be very hard to support in future, once proper driver support is in place.


At Wiren Board kernel tree we tried to untangle this issue [1-6]. 
Unfortunately I didn't have time to prepare it for kernel submission 
yet, but I think I better submit it as RFC to get a feedback from you 
and others.


[1] 
https://github.com/wirenboard/linux/commit/359abbbd86ddff4d3c61179c882c286de32bb089
[2] 
https://github.com/wirenboard/linux/commit/6327f9d7972c21b229fb83457fdde643b31553f9
[3] 
https://github.com/wirenboard/linux/commit/f01f4c66758bde460a4d8c5b54ecee3b585c0232
[4] 
https://github.com/wirenboard/linux/commit/c27598ad601e5a46f624b73412a531d6f1f63d37
[5] 
https://github.com/wirenboard/linux/commit/5796d6eebb86b32a3751b2038b63af46f94954b3
[6] 
https://github.com/wirenboard/linux/commit/0928a675d875f9c2849fd3a9888f718bbb673bda


-- 
Kind regards,
Evgeny Boger
CTO @ Wiren Board
+49 3046690053
https://wirenboard.com/

