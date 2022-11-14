Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E465256D
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 10:21:45 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id u2so12514575ljl.3
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 02:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EECihYF9c88LJIQKWGKZKOyFDgZGNXgYE2EMHMrpgGc=;
        b=l2iLI+xhGaJ79qTwJr2KzxikJ+QQbCqGuLf2cII2hL51fYEH7kB+GYspHgN4hrIQIC
         gAwMVJ+Dt8tSuNWevmPoST3KvaECqePkwCvKBrQR/G37K/ViMRe2l0ynHt/u1Ysf9Hxv
         Ea16PX28n/gOC6SU9YAxcHsyRfCR1HE2OmY/URcsWa9Ll5tEKjg4WWUS1z+eRKf/USt1
         /YFnCSJySjL/pcOlD6WFTVnhfnfZenv7lJCMI//OjJoycqE2dnaWNTMvyyy/gYUDS9wD
         ImOGDi+LIYLs+dTIGqdzHbes2ydl5GAoQzcj/9bpsCjnl55bmj4qDFq7hUILnhLda8GP
         AHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EECihYF9c88LJIQKWGKZKOyFDgZGNXgYE2EMHMrpgGc=;
        b=sJTQzYVRm+xJqsfmhGLGKKYEVDKTDmECZFD4sLFikFrT2EF8osvNsiYM4ysEbeBbW1
         V/OYYFylljIyAaCiK4Vi61BiGC+ZWXezCmCkETfwUQeKSb85zqAeDt/YmmhcSUw7tFL5
         /Fn/45TJbrW7yHfuZOESiCZ+Xrnp94cyq6OYlaDxMBq2oPquv5z4sA6L0eQWxZZvDEL2
         cqj/DJdqpWQowBrSzDBsvh8PyGC21aD2VnNrueR1aMh/yniloawEWwahPdveEFZqHRI2
         O6lJicf2o6erndEyZVeZxkI0cFh+WHBZCoND9a557JbGypHWlLdU6b/iLyZhDqge2UG5
         OOSg==
X-Gm-Message-State: ANoB5pnJ2gxKCPVpdPwdL3vtsaF0krKztIjMEpRA5FwywwrfEklLHv6o
	I3o8tJY0pTvfbR90uGNKfdJbmg==
X-Google-Smtp-Source: AA0mqf5EjdvDCOi7qOUPGfn3HlohNe9gT78Bfzd2K+VM/Wk3LnYToHrPsC+o+wcmAPZ4cnYfqPZIeQ==
X-Received: by 2002:a2e:9a85:0:b0:277:64ad:383d with SMTP id p5-20020a2e9a85000000b0027764ad383dmr3632499lji.67.1668421303305;
        Mon, 14 Nov 2022 02:21:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d19-20020a194f13000000b004a044928923sm1767610lfb.293.2022.11.14.02.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 02:21:42 -0800 (PST)
Message-ID: <03b94d20-05a6-71fb-61e4-00889f5aa64d@linaro.org>
Date: Mon, 14 Nov 2022 11:21:41 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/18] mfd: max14577: Replace irqchip mask_invert with
 unmask_base
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, lee@kernel.org
Cc: mani@kernel.org, cristian.ciocaltea@gmail.com, wens@csie.org,
 tharvey@gateworks.com, cw00.choi@samsung.com, brgl@bgdev.pl,
 mazziesaccount@gmail.com, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 jernej.skrabec@gmail.com, samuel@sholland.org, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-6-aidanmacdonald.0x0@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221112151835.39059-6-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/2022 16:18, Aidan MacDonald wrote:
> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/max14577.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Mention this is a resend or provide a changelog for v2.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

