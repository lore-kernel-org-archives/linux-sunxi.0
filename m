Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD981101D2
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Aug 2023 10:32:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fe490c05c9so42860755e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Aug 2023 03:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692181965; x=1692786765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YC9zSjW5qJSLaHkjlLNtCDqndh0xP9swEagVyGknaqU=;
        b=wpEs/CpPrI3h+HCkYEr01NY3QqBMr2yKvpUYmnhgogr/P7kZSDcxaIQaawdGNRPE22
         j4f7zj5xJhTQw0gs/WT4tvtb8ZlQpWGHGnbZSkkzs2mHl80GvBaOiG2t7Yo8lm9ur8hB
         wHO3g/R4TgJZl0V0rcZcDlDGpFYodp9LSCYRQtLXTMtlEjWgmg/2TsL4FOgHsZlYZWqT
         XfcqNpEiLNdF3rO/ESTI8OmhsNQqpycYadi44h0f5Du7zaxfftvBrcG5RIqIvTKygTdS
         AyOUueRPAAPRtS8vd78zQlUqTsBGPGjtwT4pnpGGzHpKelJ7JqeGmdojyOa1JILm2Ecx
         lDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181965; x=1692786765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YC9zSjW5qJSLaHkjlLNtCDqndh0xP9swEagVyGknaqU=;
        b=DpFxR8uctPQWfSk3MIOFRqzfBnxd/TGUDpr7WYllZnknUKySboNjjCO7ndmK8Vx7H/
         UddSp78R0jU2fbMxKCJxGTsMs0p1vhvcfdwGUIA9ekD4sIHxNKeOIpkEk8tWH6ZSU9sd
         c9FNQrdcTdzF46DpNWCMb31D26WUYpL7aV2K/lVJqZDgE/nDKTJ3si2nCxF24alBC1gn
         y3b1X+3/McV/UVsxGjcpeb+TnNxlb6gDpTZxgtthKSXF2IdJy1KoQUPduo/Qr2HqAZal
         jeMcGuoMY0vXR0lCOII7JQeI+m7Uss/chSDRrydVS4Q1a7iUKPul14ggLDmmQXkojNTr
         rqpA==
X-Gm-Message-State: AOJu0YxBWIheE6EuQ24/J+3h4w5noTGfJAx7kjmSASIJ/FcbiVvdx+xB
	YL+XvSd4b17jGhbiPzjvQlK6og==
X-Google-Smtp-Source: AGHT+IEz3ZApHcg9tH0Wrn9dq79bBukMYWbSso0EoozDFpWboS2hbhfJ66cm9MP+tf15RtnZqY9vRQ==
X-Received: by 2002:adf:e588:0:b0:317:de66:259b with SMTP id l8-20020adfe588000000b00317de66259bmr3563667wrm.15.1692181965592;
        Wed, 16 Aug 2023 03:32:45 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id l6-20020adff486000000b003143867d2ebsm20913347wro.63.2023.08.16.03.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 03:32:45 -0700 (PDT)
Message-ID: <87248920-c5d6-1ab7-db87-f0dc34b787ec@linaro.org>
Date: Wed, 16 Aug 2023 12:32:44 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] thermal: sun8i_thermal: remove unneeded call to
 platform_set_drvdata()
Content-Language: en-US
To: Andrei Coardos <aboutphysycs@gmail.com>, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Cc: samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
 rui.zhang@intel.com, amitk@kernel.org, rafael@kernel.org,
 tiny.windzz@gmail.com, anarsoul@gmail.com, alex@shruggie.ro
References: <20230811194032.4240-1-aboutphysycs@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230811194032.4240-1-aboutphysycs@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/08/2023 21:40, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Also,
> the private data is defined in this driver, so there is no risk of it being
> accessed outside of this driver file.
> 
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---

Applied, thanks

Are you checking neither dev_get_drvdata is used ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

