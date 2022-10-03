Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4134B7B
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Oct 2022 22:10:18 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id i17so7405019qkk.12
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Oct 2022 15:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8tQFqbMsDcL//cqoHMj+RGE2AtlvGSBQlWoMcN9cKQ4=;
        b=AvtY0tiOxSdUPbeIhtIgG1MOY/W95riY4n2PmaJg7iAqsgfS/1d29gWkI+jxeSHNb/
         Ln987UU1+Wy0hgX/HN+Y7aSxXib0MfaspEQOwQCfzdyYxbzkBj7hXGsxTByWQmoBhS6h
         61g7/NKT1ET2QlM1CXqz6VuyYTGo3BaPfHcmlZKLKCQPeQwpwvydumERXjcd2kRbcStp
         yaLhkumaGlt7sxqMLhJtfVIbNEniUjJC3UC1uFAUgtqKx/V82nVN4fms8IfKR7D1fRBx
         hOUBXrTpyJdcl1gSze27v0Kw4kTvSVZz6xMJ3y3ZRy9XL7VjBPHdEruocOv46wIWoxqa
         X9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8tQFqbMsDcL//cqoHMj+RGE2AtlvGSBQlWoMcN9cKQ4=;
        b=yPz6aHujO75F3YVnK5Hi9Ot1xx3JN9WUE8+wpSZbHqCiHv1dj6Gmds6dsDVp2CstZP
         B6Z/kpzj4iBPkczGPKrogxpovMkvnf4CUqWOg2qJpmHri2Ig75SbXw9r2Xduae6UFk27
         0k7KTT4JagT/W8Ftm5g91Jcp1ctLIE50utyzxQUrunceruZU9H/khpXQTVSHmsCxI0T1
         dgfEM7RpZPMxw2Go2hJKXikGsLAmUWV+jD4BqUO0BpMldjYzsK6UWry4VvkC/CphR45k
         fa2CmQpT3BMa1W1KboHx2gELAYbG7+e/7yXWdgbDpuXbBXimyvgYeG0juZIHJo4u0QTx
         mioA==
X-Gm-Message-State: ACrzQf0kFTG0soqJy7TZGHfhBjdfrY9HpN3oSCrLI96GVhLLVntXkw57
	E7htCKotxDcmSnqDZR2oxAk=
X-Google-Smtp-Source: AMsMyM7+1Lrc4a9pzbPkWKRDqlKgvwIcyf1qMIdnzZrYQkP0ffOMSCPf65kF4EQB9iDT7Ke8KuqGAg==
X-Received: by 2002:a05:620a:280d:b0:6cf:ab57:a130 with SMTP id f13-20020a05620a280d00b006cfab57a130mr15257843qkp.749.1664835017083;
        Mon, 03 Oct 2022 15:10:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id o26-20020ac8429a000000b0035a65bb6c1asm10881645qtl.85.2022.10.03.15.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 15:10:16 -0700 (PDT)
Message-ID: <7a7dc0a8-326d-7734-fc9c-3cc1121cb2e0@gmail.com>
Date: Mon, 3 Oct 2022 15:10:12 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ARM: sun9i: smp: fix out-of-bounds access error
Content-Language: en-US
To: William Zhang <william.zhang@broadcom.com>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>
Cc: f.fainelli@gmail.com, anand.gore@broadcom.com,
 Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Myl=c3=a8ne_Josserand?= <mylene.josserand@bootlin.com>,
 Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220929012944.454613-1-william.zhang@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220929012944.454613-1-william.zhang@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/22 18:29, William Zhang wrote:
> When running multi_v7_defconfig with CONFIG_UBSAN enabled, kernel
> reports UBSAN array-index-out-of-bounds error in sunxi_mc_smp_init
> function on non-sunxi platform.
> 
> Checking index to the sunxi_mc_smp_data array for out-of-bounds
> condition is needed to cover non-sunxi platform. Also fix the handling
> of return value from of_property_match_string function. Only negitive
> value is an error condition and should bail out from the function.
> 
> Fixes: 1631090e34f5 ("ARM: sun9i: smp: Add is_a83t field")
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

FWIW:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
