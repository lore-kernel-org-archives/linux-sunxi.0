Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9225220E5;
	Tue, 29 Mar 2022 10:06:42 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id v64-20020a1cac43000000b0038cfd1b3a6dso946531wme.5;
        Tue, 29 Mar 2022 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gJYdJOur1iY6XbbeGXFj0ECGEHoJkzCeSnRWw+1akAE=;
        b=g1SGsbd/jLtCfDq6yzASjQLg1D1Di4TRzjMb5UiIfrE9WiDmnp4ps8sIblZUNtYLhl
         BEYp/E3cwcQ3Zx0+p3QoptHL3A/ppqsLefEG80tXSSwr+mpdP4i1AcDwb/671KD/V7Or
         SrBc47ULMLUb19cniOzsSHJIDLc2hutPluz+X07qok/90+UjDzhv6DSHFkWqgCReRafg
         8hQGGxrcX5P2AlRlhAUeG7o275fLN5UY/luSiQ/PippZc5scePfD88DWfB5YY4mbajP2
         /wEv07hBPdodolgvcwPf/ryO4mcjf2pm6CqHleQKRp4LwbU9hZS+Lg1pg+jJITwfzWUK
         5rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gJYdJOur1iY6XbbeGXFj0ECGEHoJkzCeSnRWw+1akAE=;
        b=XFpXlClJljXuIDt7+0MwhObDH9aBM19XsTQjpJgb8Uq7hw/bHKP8XduQhhtH4bcWVC
         sg+2C7Q15Y7TDzagn4kz//By26vjFvMjg5fW1xVKpKZ5/JP/TL+/fvlXBzEFgRt4I0Bd
         7hmwuaJZQFCzn5E60NyhEe8CLBe3jRo+mkOBn9/SxqGP6NU1j2RerB/ea5PPoiepjntv
         g3muEgvWs8VXrLu5NuXgJ1JCFVxLnOfSiEGq5CVHV00X7oPVhOhXYpaQB8hTB5Mksv8H
         koU+MTCwSaGVo8E6uGrJ7EDb6e8AGH3SMDWreQbnv03L9OSC3pgI/C/5pVCteIvZ0wRq
         urLg==
X-Gm-Message-State: AOAM532N8TRxvxuU8gzXgxT04lHSqfcQ2JmnhqyrxoxItlxg80HU79eA
	4yvUshYiLZadGImwbmzDtis=
X-Google-Smtp-Source: ABdhPJw/yl37bo84CH0/pwnTrqSkLHICdBHbZfyNAKleJ5pkLbBWcMtajlzC2TVgbnU7tHyn6wt30Q==
X-Received: by 2002:a05:600c:a47:b0:37c:965:2b6f with SMTP id c7-20020a05600c0a4700b0037c09652b6fmr5636166wmq.31.1648548400811;
        Tue, 29 Mar 2022 03:06:40 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id a11-20020a5d456b000000b0020406ce0e06sm14201716wrc.94.2022.03.29.03.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 03:06:39 -0700 (PDT)
Message-ID: <6dafde7d-17c6-bd25-dbe8-7f7acf80fd91@gmail.com>
Date: Tue, 29 Mar 2022 12:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, Ansuel Smith <ansuelsmth@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 chrome-platform@lists.linux.dev,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra <linux-tegra@vger.kernel.org>, linux-oxnas@groups.io,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-unisoc@lists.infradead.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-realtek-soc@lists.infradead.org
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
 <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
 <YkLXTWdZ3zASxr4H@atomide.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <YkLXTWdZ3zASxr4H@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/03/2022 11:54, Tony Lindgren wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [220329 09:02]:
>> On Tue, Mar 29, 2022 at 10:03 AM Tony Lindgren <tony@atomide.com> wrote:
>>> For example, I have a pile of pending omap clock clean-up dts patches
>>> posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
>>> redoing or fixing up the patches with sed :)
>>
>> Git merge/rebase/cherry-pick should handle renames fine?
> 
> Possibly.. Not sure I'd count on that based on my earlier experiences
> though :)
> 

Yes. If this could be split up in per silicon-vendor patches, the maintainer 
could take them. Although it might be a pain to soc maintainers to resolve small 
conflicts when merging that branches.

Just my 5 cents.

Matthias
