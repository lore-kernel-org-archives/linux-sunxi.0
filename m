Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C52F45
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Feb 2023 13:37:16 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so4087912wms.1
        for <linux-sunxi@lists.linux.dev>; Fri, 10 Feb 2023 05:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7ekQ1ebVb37EvbrSMM8z2fZgMGZlkF4SAJIlmmXlIM=;
        b=FCf0kR0Gjrjfjr3X70C69QAWt/URQpaCkheBjnMlDc70dl4LzCqdDKZ0tAGyf2FEPs
         jI5F7nxgsGcpWMgcP2KL1Hk8Fdjak4Vu8TW1zgX+nZN6Rmm0FBgJLubzWXJ0r1J7zaVf
         mwcTyZz4yHW9LtRcav7buitHSFWRy133YRyTOHELsVJiYUHYLRuOroxoW//jkYnbnqoi
         NwmS2XnikbTHrOW1s95tZj6joLbawoAuRxPw5MJF3DvR04vpJfp/F6MHutBoPRwKRrd0
         Vm0mnznVit4L96oO2PsX4Pg+016PNwIf1cfSyu/McZj3p2W0I862YPPV5Jz9TFrumF2a
         Au3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7ekQ1ebVb37EvbrSMM8z2fZgMGZlkF4SAJIlmmXlIM=;
        b=j9AMCsZGlmFA3udk36eQlNlstyKkp3RjJAx2rgl/3u5+1snNFSXbM1X/FUOy7VTdqb
         3GazKfy6XS1j75g/GDvPysN1l7XTaOPPoNFripGwMdRSxow04a5D+U9t1RLMt+fhlsb2
         qxN8eIWF0v1MzMYA/amA3NifqRVbwJJmJlrzcGUJpGGU6P7IR8yNsCc+1Q02Zl9fAQcF
         ztFW1QG8Fgb8fCFnZfwXMhZPxTzClOzaFN7azE1NkKpMyMBuz89s2qmjMRi/npP84YID
         LWJ97RdnWedZiLJM7YOHzbNegoyctLP3hZI+GcLCGDq3OuztvKCxcOd/uZ9ALV900ID6
         oB0A==
X-Gm-Message-State: AO0yUKXM8lrfvzFwwEWfQ4TpTTd0p7f7OT36IoYp5VfnLBn6+SnoED/Z
	q7cJmzi8KXBnMLpypXDB/uZTow==
X-Google-Smtp-Source: AK7set8fjEPYu9ZwvA/RHRPBjh1BbgUcbDV5WYTXQPAUasU7/Z6NTrezKJEnTnCHemufwUts1ejAxA==
X-Received: by 2002:a05:600c:4a9a:b0:3dc:f24:f2de with SMTP id b26-20020a05600c4a9a00b003dc0f24f2demr12948965wmp.12.1676036234711;
        Fri, 10 Feb 2023 05:37:14 -0800 (PST)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id bi5-20020a05600c3d8500b003db012d49b7sm12578383wmb.2.2023.02.10.05.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 05:37:14 -0800 (PST)
Message-ID: <1d2d879c-4563-4ee0-7bf1-141d5796fe74@linaro.org>
Date: Fri, 10 Feb 2023 14:37:12 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Add
 CLOCK_EVT_FEAT_DYNIRQ
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, tglx@linutronix.de, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20230209040239.24710-1-frank.li@vivo.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230209040239.24710-1-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/02/2023 05:02, Yangtao Li wrote:
> Add CLOCK_EVT_FEAT_DYNIRQ to allow the IRQ could be runtime set affinity
> to the cores that needs wake up, otherwise saying core0 has to send
> IPI to wakeup core1. With CLOCK_EVT_FEAT_DYNIRQ set, when broadcast
> timer could wake up the cores, IPI is not needed.
> 
> After enabling this feature, especially the scene where cpuidle is
> enabled can benefit.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

