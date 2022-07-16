Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FE2367
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Jul 2022 01:59:15 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id r186so5896005pgr.2
        for <linux-sunxi@lists.linux.dev>; Fri, 15 Jul 2022 18:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tCv2d0jz7aYxXtvOKKLsPUo98p8UBRB5mwniLXluyp4=;
        b=qeMVe6ak4TXh288JdIVjZYsH/7dCKTDxWI6KAS6pAAAO5imaSHwMUcL9DHVrxyyU6l
         ZUxzdWJF47CtMW2AIdV/18KOD46vZAnJoinwziSjeLfg7c3LCxdKCCrNAhdzqwBfwmK+
         RqdXRx47FSOpbeZloyQE//IzAg/Swu+EwLDdS0jptsFB5Upx875a532MJYr2fT2iiHmb
         xY9OVvmanm54CCh9c29+dGAiYm98ydqRsh71kzuRXGvACLxLhra/xkC02T1jDDsABBbq
         qPRkT/+EywgCB1aVX5UyS9ZFMH+dQ+DtEJ/uP6Ys5rK6tmHkw7eIGTQ0GtIRL+kNIyWe
         ekrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tCv2d0jz7aYxXtvOKKLsPUo98p8UBRB5mwniLXluyp4=;
        b=hA/Ot8II99TbJtZzAmxAv7o4VvwTXifV4A7l1/b45E7PIcbOPQESyqdT+BE0cIU0qH
         HT9oD7sJyT4b9iAvDMSX/dmVsIMrd247otdWkTQ1K0f6M3U6WsPqkoFRXNgzED7J1WiC
         BC9QwKhhO9DE/ybMdkEYsk5mUynqXZTwZ+tJUiV3JmlswlDzxnrQ+B5S9nVwYOD1xu0C
         b0+zKbN6JirzYhKWqAkXx65CVen/MsZVgiTqTfCFFIt5c8pk5UEvG5wtiwcFEz1SmhUo
         4G3OY5ejynfwCLM0N067F7hDa+FEr7LEIVkQiLsZ6PgoG4Zt2443/aUnm1Gs91j6HKGB
         UbCA==
X-Gm-Message-State: AJIora+KKaeAQARNXzNKjfr4FuyPZ/QaBj7AaDwWMN0UxUDxEyIecP8J
	Vmvisa0p61VHpevqW6F7iII=
X-Google-Smtp-Source: AGRyM1s+NuVmm68uI+GX5krCVPdfDhjpnZUKMVrE+QW2HvW5pJGCRGNQG4OC7/rTUY+Y9uKPIYdf6A==
X-Received: by 2002:a63:1824:0:b0:408:a22b:df0c with SMTP id y36-20020a631824000000b00408a22bdf0cmr15113286pgl.119.1657936754785;
        Fri, 15 Jul 2022 18:59:14 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id o17-20020a170902779100b0015e8d4eb27esm4205420pll.200.2022.07.15.18.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 18:59:14 -0700 (PDT)
Message-ID: <043cec12-b719-e9e6-d234-fe6ca75ca894@gmail.com>
Date: Fri, 15 Jul 2022 18:59:12 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: build failure of next-20220715 due to "No rule to make target"
Content-Language: en-US
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
References: <YtH53r9UcYwquxcx@debian>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <YtH53r9UcYwquxcx@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/15/2022 4:35 PM, Sudip Mukherjee (Codethink) wrote:
> Hi All,
> 
> Not sure if it has been reported, builds of arm and arm64 allmodconfig
> have failed to build next-20220715 with the error:
> 
> make[3]: *** No rule to make target 'drivers/pinctrl/sunxi/pinctrl-sun20i-d1.o', needed by 'drivers/pinctrl/sunxi/built-in.a'.  Stop.

Caused by f6e42a0fce98b85380df8cdfb081d75c48e4fee1 ("pinctrl: sunxi: Add 
driver for Allwinner D1/D1s") adding CONFIG_PINCTRL_SUN20I_D1 a build 
rule in drivers/pinctrl/sunxi/Makefile to build pinctrl-sun20i-d1.o but 
... there was no drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c file added to 
the commit, missing git add presumably?
-- 
Florian
