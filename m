Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D005115B7
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 12:39:46 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id he5so3060547wmb.3
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 04:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CEiKMEVtBuEXcWgSS3bW1AVgiz7paLJWbSWxqpf4KL0=;
        b=SvD6tLh44XT/G3dEu8Z8dGpH9lPbBgjhOj5q+gsSI47Lu+AJtYFcrwM9qzPskfrcbe
         ZL1EfMKNEFcdmipx5JbaLO+9y96WTz0lM6xcVKGu2IzoV51TyzgyFJRArRIhnUlP2GpE
         d5S7YmuuUZoYWG6KsRtKypEbp2uEx/Aj/ABu2a8qaIcoE5noIF9pvBZWW+tN6JRNni+b
         oPVdJIkmqDtbVjXB7kIsoRZitgeDom2h3AscRdNPiz4iZNlDJtkO8HNlI2syKNRLmg5m
         FNZMHs4uGHrH1TNIz4rlAH66JNZSNINmQpBT6j63Cu3EGYT5JhYuFJuhSrgqcjAJwZ0o
         66ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEiKMEVtBuEXcWgSS3bW1AVgiz7paLJWbSWxqpf4KL0=;
        b=rVmk955SqSFO3a9LSxFOifcwo0Fn+TUBFDMM4cBjWev2ZiLZ/lq2Jn9z6Eunz+7xr/
         Ehm7cdNMWXj9f4ATlLEqjdltjaoge8tK5E71Zu35ZCid8Imi9JlHtcegPS6QiYr4QyuH
         ii6bhNrK6quhzVm1sY8LFogAMN7TLmMhyLOb8xO7YgpP5IkkmSPj9Dk76V/xZQi8cwMT
         cvSA2LMGn/PX/NPQ+1LCAt4BO/JXvoBzgTzj17471Ko33i2I6JdX9hZsHePtXxgaL16i
         gDZfKz/v+dD3vzkiSnMYX/fEDZoAUqHl7krgHPRcDCXdimpd0ogmVflThZMSEUc7LHof
         sFZw==
X-Gm-Message-State: AO0yUKWcGMgk6JNBPp7RRVl5Ujiwa9DmBmqVf6yWVhA1UizM4kNrpTPo
	kBWdc8xe8aGdXVptKpIcguNzoA==
X-Google-Smtp-Source: AK7set8EVHso4/Xkab5oZtnZwwagkai8GeZ6rb46YWHuCXYyV4Vpj+uUYZuT8GMB/w/FqJ3nfkh7iA==
X-Received: by 2002:a05:600c:43ca:b0:3d3:513c:240b with SMTP id f10-20020a05600c43ca00b003d3513c240bmr1717849wmn.7.1676378385174;
        Tue, 14 Feb 2023 04:39:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s21-20020a1cf215000000b003e001119927sm19664484wmc.24.2023.02.14.04.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 04:39:44 -0800 (PST)
Message-ID: <f9bd4ef2-fe69-8414-babb-fcc30810d70f@linaro.org>
Date: Tue, 14 Feb 2023 13:39:43 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add missing names
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Bastian Germann <bage@debian.org>, Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
References: <20230213231931.6546-1-bage@debian.org>
 <20230213231931.6546-3-bage@debian.org> <20230214104554.35338faa@posteo.net>
 <20230214121217.43f6124f@donnerap.cambridge.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214121217.43f6124f@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 13:12, Andre Przywara wrote:
> On Tue, 14 Feb 2023 09:45:54 +0000
> Wilken Gottwalt <wilken.gottwalt@posteo.net> wrote:
> 
> Hi,
> 
>> On Tue, 14 Feb 2023 00:19:29 +0100
>> Bastian Germann <bage@debian.org> wrote:
>>
>>> The allwinner,sun6i-a31-hwspinlock.yaml binding needs clock-names
>>> and reset-names set to "ahb" as required by the driver.  
>>
>> Hmm, this one is a bit odd. If you look into my earlier versions of the
>> patchset, you may notice, that I actually included these bindings and they
>> were refused. I think the argumentation was like
>> "there is only one bus = no need for it".
> 
> That's interesting, because your driver implementation relies on there
> being a clock name. And if I chased down devm_clk_get() correctly, there
> must be a named clock in the DT, otherwise it would fail? I haven't tested
> this, though, but I guess this is the  reason for Bastian's patch.
> 
> Regarding "one bus clock only": while this is true, I think there
> is (or was?) also the rationale of using names being more future-proof, so
> adding clocks (for future hardware revisions) can be done more easily,
> without breaking compatibility. It's not a big problem, since you probably
> have a new compatible string in this case anyway, but it also doesn't
> hurt, and allows to use more generic helpers like devm_clk_get().
> 
>> If it gets accepted now, I really like to know why. (It was some trouble
>> back then to get the documentation properly done and accepted.)
> 
> IIUC, it simply doesn't work without a clock-names property.

Oh, there is clear way. One can ignore review and push mismatched
bindings/drivers. Incomplete binding to satisfy DT maintainers and
driver doing something entirely else (using undocumented properties).

Best regards,
Krzysztof

