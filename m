Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6DE12294
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 18:17:02 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id c25so17558602ljr.8
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 10:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f6V4UohAWc2m+jNDZH5W+975Jb/3YdWztcr9QXvBFnQ=;
        b=ETE5lYGBmXaa9JIPl/vSiCxdAe9AjOFJO71t+bN8UOwMFDctx74kyA1/9V9nfM9MKr
         aLyYymTJxSRuiyhQbfu6zkTpRYiyOCM2VqQLw9YAGc7tR4trFeSc+LTPX7CgDwkZIc6G
         KIYMCwK9Em950H6uKi4+I6xENKYcocRQN2ATJdKWdXt/M958jD1fS5PGNtRKgZxRowvA
         FiVbnzRPnYcNZosk/4vf2TMDExyZjAHV1NgQ8W1ptLywLfEBej+yOJ/8aaYfTmuew8aY
         ZUSelnTbKK6VK9f3ETmGp/zuBAejqf43wdpaWqSQ8W97zgBiqfdcouvF0ezM0enq/AOL
         Q/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6V4UohAWc2m+jNDZH5W+975Jb/3YdWztcr9QXvBFnQ=;
        b=X4zpiDU29p3caPOGeLvphQujRP4ESOsi8rbN+1amopTwdNZ2crvLM8P3KPbud6JLXL
         0zbgzSBBzAF7veube3+DAw2+eLW96E2RrJAa4dMJRxun8WYMA1f/wQFIOTJRMupU6pnh
         lpX3x0nCSYczat6asP7yiliYK/TT5KUhtT5CL9tznZO5sowpMdaPiCf4dLQZs8OwG1VC
         dBiBSTY/USfr4GJo6FNr6ao2BNYh6gURDDTWlCDk+RZ9Lq7TVhNtrvP66tEiM8NeJXXo
         LbCs9RMEx4CcNxxbG/TfxH/v65o07eIzUBwS8vlJcrcNFFDAN7Xa8M0jMprN92+w/YHV
         DheQ==
X-Gm-Message-State: ACrzQf1klpfagAISgGyAzmUj0DqHRRN2Y/lJxSVW9htBhOiPzJHuTdjn
	YIwzr4N4osWp5UNEZ25SMYknDw==
X-Google-Smtp-Source: AMsMyM407OWxYUKac90YuT7TQcGnAfE0ACHr16p6PrcKPVVlUIq0zK0SMbxXoi3Ocdr5fTaSYFpkkg==
X-Received: by 2002:a05:651c:1110:b0:277:9e5:6cc8 with SMTP id e16-20020a05651c111000b0027709e56cc8mr5404021ljo.105.1667845020311;
        Mon, 07 Nov 2022 10:17:00 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id s12-20020a056512214c00b004a25468d86asm1367400lfr.68.2022.11.07.10.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 10:16:59 -0800 (PST)
Message-ID: <e5c049a1-a7f3-b804-9866-5c8edb07da0c@linaro.org>
Date: Mon, 7 Nov 2022 19:16:58 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 08/10] dt-bindings: vendor-prefixes: add Lctech name
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20221107005433.11079-1-andre.przywara@arm.com>
 <20221107005433.11079-9-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107005433.11079-9-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2022 01:54, Andre Przywara wrote:
> Shenzen LC Technology [1] is a company making various boards and related
> products around IoT and AI technology.
> They used to use the "Cherry Pi" brand before.
> 
> Add it to the vendor prefixes list.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

