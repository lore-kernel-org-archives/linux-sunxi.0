Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56CE7F
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Sep 2022 13:28:44 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id bq23so10653554lfb.7
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Sep 2022 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=+9UPKb7Ii6FzBDArfIx0mfVT3Zwlk63jeV9czZ35D+0=;
        b=me0+3UlNEKv/v6DZqOPfcO4uSIDs3xkvdhHto4CLAR3VdMynR1c1Kbm3ZYrqIGKYfJ
         VLVB5MrinHp2+2Q3tl+14ZONtMbB+Xr6x0VJpnggNCZYXJwf7RTHoyqiOp+Vl6vjYZGg
         a5j3ubD8QHTK+OTZsBZ8ny6TrkyuCzAIkTLpMQW6OJFkU0x2x3TWHcH9lX4H1SsMoEsd
         v0pgK4CNWQjqw2ZBDAGNeIfkOzqmTcl6bfO+pJv55s0Df1cqB7wmquEsIOuZHuD5DTKF
         d9P1NH3QDR3ctRs0Im7NPYhBI78zEj/plZZlyMypPV4D9IRJeWwZsvcQiEZ9fkXpvZAS
         q+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+9UPKb7Ii6FzBDArfIx0mfVT3Zwlk63jeV9czZ35D+0=;
        b=htf2A+PqALRBUsJJJSWkZOedNP0ejYL90lt0gWSfQW2z0uX9QpYQFaR0uHEE9dvhqG
         5wqG8/hYxWxCsVcLBbAn99FpIRb4Vu/CHaw9l5sjfsH0Z+VhtNm7v+qF6w9EK8E6UTwM
         F+dcoBNSFkHzXAUzhfRNBnyEppXI6R78bBdlP43N6xQGKe0aqkW2aGGMFUkCvWuoqrxg
         xCeBXRft1fMzVjBDU13b9jb5jqjH9FunzCsxWBWCMVo+t9e0B25hrGwKYc85BtRThQtT
         gi9QOLnV1xg18f5ZvMGWkFsCMwEn+EmJvXA4bHKzVBcia9HgjKziSERIQ0VGzawgt5db
         TWLA==
X-Gm-Message-State: ACgBeo1txLQNvqf29+OdQQikDYv4QxKQIns7PXBGcN5V2i/GuXqqTw0V
	fmYVi2VQor5ObRRYVsIu3nxfEg==
X-Google-Smtp-Source: AA6agR5Qa+jJgnLCmlDWo1wDT3VmVkwiXfyp+ekNEOEo4vuUYmkt4gZpNxtizVLDAYMar2xpMDVxVw==
X-Received: by 2002:a05:6512:280d:b0:498:fd40:51d4 with SMTP id cf13-20020a056512280d00b00498fd4051d4mr4083477lfb.167.1662902922803;
        Sun, 11 Sep 2022 06:28:42 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bj24-20020a2eaa98000000b0026acfe1b3b4sm674886ljb.17.2022.09.11.06.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 06:28:42 -0700 (PDT)
Message-ID: <1bfa4397-47a1-ea46-5ced-8b69fb2452c0@linaro.org>
Date: Sun, 11 Sep 2022 15:28:41 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Content-Language: en-US
To: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
 <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
 <CAE=m619qeaDYkWiB5kh50gY1Kndyrvo4oZuZjFKRCKK=j99K2w@mail.gmail.com>
 <0b8b2e01-5209-6437-c79e-3cff9b29bfcb@linaro.org>
 <CAE=m618WS-RKgWn6r1=Zfsd5N-gp3A4S725RtbDKDQ4PLsBk5w@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAE=m618WS-RKgWn6r1=Zfsd5N-gp3A4S725RtbDKDQ4PLsBk5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2022 08:18, 班涛 wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 于2022年9月8日周四 17:22写道：
> 
>> On 07/09/2022 15:03, 班涛 wrote:
>>>>> +++
>>>> b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
>>>>> @@ -0,0 +1,79 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id:
>> http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Allwinner H6 DMIC Device Tree Bindings
>>>>
>>>> s/Device Tree Bindings//
>>>>
>>>
>>> So, modify it to 'Allwinner H6 DMIC Devices Tree Bindings', sure?
>>
>> You pasted the same message, so what is the modification? I wrote you a
>>  search&replace pattern.
>>
> 
> "s/Device Tree Bindings//"
> I don't understand what you mean.

It's a search&replace command from Unix tools...

https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/

https://vim.fandom.com/wiki/Search_and_replace#Basic_search_and_replace

Just remove that string.


Best regards,
Krzysztof
